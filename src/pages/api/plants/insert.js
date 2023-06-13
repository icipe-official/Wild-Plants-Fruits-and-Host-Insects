import prisma from "../../../lib/prisma";
import NextCors from "nextjs-cors";
import formidable from "formidable";
import fs from "fs";
import path from "path";
export default async function postPlant(req, res) {
  await NextCors(req, res, {
    methods: ["POST", "GET"],
    origin: "*",
    optionsSuccessStatus: 200,
  });

  if (req.method === "POST") {
    const {
      species_name,
      max_latitude,
      genus_name,
      family_name,
      plant_description,
    } = req.body;

    try {
      // Check if the family already exists in the plant_families table
      let plantFamily = await prisma.plant_families.findUnique({
        where: {
          family_name,
        },
      });

      let familyId;

      // If the family doesn't exist, create it and retrieve its id
      if (!plantFamily) {
        plantFamily = await prisma.plant_families.create({
          data: {
            family_name,
          },
        });
        familyId = plantFamily.id;
      } else {
        familyId = plantFamily.id;
      }

      // Check if the genus already exists in the plant_genera table
      let plantGenus = await prisma.plant_genera.findUnique({
        where: {
          genus_name,
        },
      });

      let genusId;

      // If the genus doesn't exist, create it and retrieve its id
      if (!plantGenus) {
        plantGenus = await prisma.plant_genera.create({
          data: {
            genus_name,
            plant_families: {
              connect: {
                id: familyId,
              },
            },
          },
        });
        genusId = plantGenus.id;
      } else {
        genusId = plantGenus.id;
      }

      // Check if the plant already exists
      const existingPlant = await prisma.plants.findFirst({
        where: {
          species_name: species_name,
        },
      });

      if (existingPlant) {
        // Handle the case when the plant already exists
        res.status(400).json({ message: "Plant already exists" });
        return;
      }

      // Create the plant record with the obtained genusId
      const createdPlant = await prisma.plants.create({
        data: {
          species_name: species_name,
          max_latitude: max_latitude,
          plant_description: plant_description,
          plant_genera: {
            connect: {
              id: genusId,
            },
          },
        },
      });

      console.log("createdPlant");
      console.log(createdPlant);

      res.status(200).json({ message: "Data inserted successfully" });
    } catch (error) {
      console.error("Error inserting data:", error);
      res.status(500).json({ message: "Internal Server Error" });
    }
  } else {
    res.status(405).json({ message: "Method Not Allowed" });
  }
}
