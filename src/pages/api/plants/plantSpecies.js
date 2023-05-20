// This code is a server-side function that handles a GET request.
// It uses the Prisma library to query the plants table in a database.
//The query retrieves the species name, genus ID, genus name from plants table
// It the joins to plant_genera table and retrieve genus name  anmd family name
// It also joins family table and retrieve family name of all plants.
// The query results are then returned as a JSON response to the client.
// Try catch block is used to catch the error during get request

import prisma from "../../../../lib/prisma";
import NextCors from "nextjs-cors";
export default async function handle(req, res) {
  // Run the cors middleware
  // nextjs-cors uses the cors package, so we invite you to check the documentation https://github.com/expressjs/cors
  await NextCors(req, res, {
    // Options
    methods: ["GET", "HEAD", "PUT", "PATCH", "POST", "DELETE"],
    origin: "*",
    optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
  });
  if (req.method == "GET") {
    // get species data.
    try {
      const species = await prisma.plants.findMany({
        select: {
          id: true,
          species_name: true,
          genus_id: true,
          matk: true,
          plant_genera: {
            select: {
              genus_name: true,
              family_id: true,
              plant_families: {
                select: {
                  family_name: true,
                  id: true,
                },
              },
            },
          },
          plants_matk: {
            select: {
              nucleotide: true,
              country: true,
              genebank_accesion: true,
            },
          },
        },
      });
      return res.json(species);
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  }
}
