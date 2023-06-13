import prisma from "../../../../lib/prisma";
// API for plant  fruit details
export default async function getFamily(req, res) {
  const { plantDetails } = req.query;
  try {
    //Fetch data from database
    // console.log(params);
    const plant = await prisma.plants.findMany({
      where: {
        species_name: plantDetails, //this name must be similatr to  dynamic file name
      },
      select: {
        species_name: true,
        max_latitude: true,
        min_latitude: true,
        description: true,
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
        plants_woody_herbaceous: {
          select: {
            back_id: true,
            woody_herbaceous: {
              select: {
                type_of_stem: true,
              },
            },
          },
        },

        plants_latex: {
          select: {
            fruit_latex_id: true,
            latex: {
              select: { latex_description: true },
            },
          },
        },
        plants_spines_thorns: {
          select: {
            thorn_id: true,
            spines_thorns: {
              select: { thorns_spines: true },
            },
          },
        },
        plants_shrub_climbings: {
          select: {
            shrub_id: true,
            shrub_climbings: {
              select: { tree_type: true },
            },
          },
        },
      },
    });
    // console.log(tms);
    res.json(plant);
  } catch (e) {
    console.error(e);
  }
}
