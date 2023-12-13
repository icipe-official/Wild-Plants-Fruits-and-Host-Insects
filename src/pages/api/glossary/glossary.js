//

import NextCors from "nextjs-cors";
import prisma from "../../../lib/prisma";

export default async function handle(req, res) {
  await NextCors(req, res, {
    methods: ["GET"],
    origin: "*",
    optionsSuccessStatus: 200,
  });

  if (req.method === "GET") {
    try {
      // Get family data with photos and joined plants_photos data.
      const glossary = await prisma.glossary.findMany({
        select: {
          glossary_description: true,
          glossary_id: true,

          glossary_term: true,
          glossary_type: true,
          glossary_examples: {
            select: {
              photo_name: true,

              plants_photos: {
                select: {
                  plant_id: true,
                  photo_name: true,

                  plants: {
                    select: {
                      species_name: true,
                      plant_genera: {
                        select: {
                          genus_name: true,
                        },
                      },
                    },
                  },
                },
              },
            },
          },
        },
        orderBy: {
          glossary_term: "asc",
        },
      });
      return res.json(glossary);
    } catch (e) {
      console.error(e);
      return res.status(500).json({ error: "Internal Server Error" });
    }
  }
}
