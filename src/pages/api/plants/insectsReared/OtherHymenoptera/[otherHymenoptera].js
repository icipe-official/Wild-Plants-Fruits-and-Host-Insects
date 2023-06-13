import prisma from "../../../../../lib/prisma";

// API for plant fruit details
export default async function getColeoptera(req, res) {
  const { otherHymenoptera } = req.query;
  try {
    // Fetch data from database
    const plants = await prisma.insects.findMany({
      where: {
        insect_orders: {
          is: {
            order_name: "Hymenoptera",
          },
        },
        insect_families: {
          isNot: {
            family_name: "Braconidae",
          },
        },
        plants_insects: {
          some: {
            plants: {
              is: {
                species_name: otherHymenoptera,
              },
            },
          },
        },
      },
      select: {
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
            genus_name: true,
          },
        },
      },
    });

    res.json(plants);
  } catch (e) {
    console.error(e);
  }
}
