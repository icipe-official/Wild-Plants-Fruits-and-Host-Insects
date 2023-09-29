import NextCors from "nextjs-cors";
import prisma from "../../../lib/prisma";

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
          insect_genera: {
            genus_name: {
              not: null,
            },
          },

          // exclude these families for now
          // NOT: [
          //   { insect_families: { family_name: "Tortricidae" } },
          //   { insect_families: { family_name: "Tephritidae" } },
          //   { insect_families: { family_name: "Lycaenidae" } },
          // ],
        },
        select: {
          id: true,
          species_name: true,
          insect_genera: {
            select: {
              id: true,
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
              genbank_accesion: true,
              bold_id: true,
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
