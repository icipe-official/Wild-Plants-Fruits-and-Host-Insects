import prisma from "../../../../lib/prisma";
import NextCors from "nextjs-cors";

export default async function handle(req, res) {
  await NextCors(req, res, {
    methods: ["GET", "HEAD", "PUT", "PATCH", "POST", "DELETE"],
    origin: "*",
    optionsSuccessStatus: 200,
  });

  if (req.method === "GET") {
    try {
      const species = await prisma.insects.findMany({
        where: {
          insects_coi: {
            some: {
              nucleotide: {
                not: null,
              },
            },
          },
        },
        select: {
          species_name: true,
          insect_genera: {
            select: {
              genus_name: true,
            },
          },

          insect_families: {
            select: {
              family_name: true,
            },
          },

          insect_orders: {
            select: {
              order_name: true,
            },
          },
          plants_insects: {
            select: {
              plants: {
                select: {
                  species_name: true,
                  plant_genera: {
                    select: {
                      genus_name: true,
                      plant_families: {
                        select: {
                          family_name: true,
                        },
                      },
                    },
                  },
                },
              },
            },
          },
          insects_coi: {
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
