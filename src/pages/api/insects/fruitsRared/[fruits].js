import prisma from "../../../../lib/prisma";
// API for Coleoptera details
export default async function getInsects(req, res) {
  try {
    const { fruits } = req.query;
    // Fetch data from database
    const plants = await prisma.insects.findMany({
      where: {
        id: parseInt(fruits),
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
