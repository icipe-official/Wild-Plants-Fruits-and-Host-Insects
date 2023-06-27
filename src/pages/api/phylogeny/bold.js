import { PrismaClient } from "@prisma/client";
import NextCors from "nextjs-cors";
import fetch from "node-fetch";
import { Parser } from "json2csv";
import fs from "fs";

const prisma = new PrismaClient();

export default async function handler(req, res) {
  await NextCors(req, res, {
    methods: ["GET", "HEAD", "PUT", "PATCH", "POST", "DELETE"],
    origin: "*",
    optionsSuccessStatus: 200,
  });

  if (req.method === "GET") {
    try {
      const species = await prisma.insects.findMany({
        select: {
          id: true,
          species_name: true,
          insect_genera: {
            select: {
              genus_name: true,
            },
          },
        },
      });
      const speciesData = species
        .filter((species) => species.genus_name !== "nan")
        .map((species) => ({
          id: species.id,
          speciesName:
            species.insect_genera.genus_name +
            " " +
            species.species_name.split(" ")[0].replace(".", ""),
        }));

      // Fetch data from BOLD and insert into database
      const apiURL =
        "http://www.boldsystems.org/index.php/API_Public/combined?";
      const barcodeMarker = "COI-5P";
      let results = [];

      for (const species of speciesData) {
        const params = new URLSearchParams({
          format: "tsv",
          data_type: "DNA",
          taxon: species.speciesName,
        });

        const response = await fetch(apiURL + params.toString());
        if (response.ok) {
          const data = await response.text();
          if (data.length !== 0) {
            try {
              const lines = data.trim().split("\n");
              const headers = lines[0].split("\t");
              const markerCodesIndex = headers.indexOf("marker_codes");
              const accessionIndex = headers.indexOf("genbank_accession");
              const speciesNameIndex = headers.indexOf("species_name");
              const countryIndex = headers.indexOf("country");
              const nucleotidesIndex = headers.indexOf("nucleotides");
              const yearIndex = headers.indexOf("year_of_collection");
              for (let i = 1; i < lines.length; i++) {
                const values = lines[i].split("\t");
                const markerCodes = values[markerCodesIndex];
                if (markerCodes.includes(barcodeMarker)) {
                  if (markerCodes.includes(barcodeMarker)) {
                    const accession = values[accessionIndex];
                    const speciesName = values[speciesNameIndex];
                    const country = values[countryIndex];
                    const nucleotides = values[nucleotidesIndex];
                    const year = values[yearIndex];

                    results.push({
                      genbank_accession: accession,
                      country: country,
                      year_of_collection: year,
                      nucleotides: nucleotides,
                      insectId: species.id,
                    });
                  }
                }
              }
            } catch (error) {
              console.error("Error parsing data:", error);
            }
          } else {
            console.log(`No data received for ${species.speciesName}`);
          }
        } else {
          console.log(
            `Error fetching data for ${species.speciesName}. Status code: ${response.status}`
          );
        }
      }

      // Convert the results to CSV format
      const fields = [
        "genbank_accession",
        "country",
        "year_of_collection",
        "nucleotides",
        "insectId",
      ];
      const json2csvParser = new Parser({ fields });
      const csv = json2csvParser.parse(results);

      // Save the CSV data to a file
      fs.writeFileSync("coi_data.csv", csv, "utf8");

      // Import the CSV data into the database
      const importData = await prisma.insects_coi.createMany({
        data: results,
      });

      res.status(200).json({ message: "Data inserted successfully" });
    } catch (error) {
      console.error("Error retrieving species data:", error);
      res.status(500).json({ error: "Internal server error" });
    }
  } else {
    res.status(405).json({ error: "Method Not Allowed" });
  }
}
