import NextCors from "nextjs-cors";
import prisma from "../../../../lib/prisma";
// API for Coleoptera details
export default async function getColeoptera(req, res) {
  await NextCors(req, res, {
    // Options
    methods: ["GET", "HEAD", "PUT", "PATCH", "POST", "DELETE"],
    origin: "*",
    optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
  });
  try {
    const { insectTaxonomy } = req.query;
    // Fetch data from database for a specific genus
    const plants = await prisma.insects.findMany({
      // where: {
      //   insect_genera: {
      //     is: {
      //       id: parseInt(insectTaxonomy),
      //       // genus_name: insectTaxonomy,
      //     },
      //   },
      // },
      where: {
        insect_genera: {
          is: {
            id: parseInt(insectTaxonomy),
          },
        },
        plants_insects: {
          some: {}, // This ensures that only insects with associated plants are selected
        },
      },
      select: {
        id: true,
        species_name: true,
        insect_orders: {
          select: {
            order_name: true,
          },
        },
        insect_families: {
          select: {
            family_name: true,
          },
        },
        insect_sub_families: {
          select: {
            sub_family_name: true,
          },
        },
        insect_genera: {
          select: {
            id: true,
            genus_name: true,
          },
        },
        insect_photos: {
          select: {
            photo_id: true,
            sex: true,
          },
        },
        insects_regions: {
          select: {
            regions: {
              select: {
                latitude: true,
                longitude: true,
                region: true,
              },
            },
          },
        },
        plants_insects: {
          select: {
            plants: {
              select: {
                id: true,
                species_name: true,
                plant_genera: {
                  select: {
                    genus_name: true,
                  },
                },
                plant_coordinates: {
                  select: {
                    latitude: true,
                    longitude: true,
                  },
                },
              },
            },
          },
        },
      },
    });

    res.json(plants);
  } catch (e) {
    console.error(e);
  }
}
