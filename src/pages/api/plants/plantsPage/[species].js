import prisma from "../../../../../lib/prisma";
import NextCors from "nextjs-cors";
// API for plant  fruit details
export default async function getFamily(req, res) {
  // Run the cors middleware
  // nextjs-cors uses the cors package, so we invite you to check the documentation https://github.com/expressjs/cors
  await NextCors(req, res, {
    // Options
    methods: ["GET", "HEAD", "PUT", "PATCH", "POST", "DELETE"],
    origin: "*",
    optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
  });
  const { species } = req.query;
  try {
    //Fetch data from database
    // console.log(params);
    const plant = await prisma.plants.findMany({
      where: {
        //convert species to intager
        //this id must be similatr to  dynamic file name
        id: parseInt(species),
      },
      select: {
        id: true,
        species_name: true,
        max_latitude: true,
        min_latitude: true,
        plant_description: true,
        leaf_type: true,
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

        plants_leaf_margins: {
          select: {
            leaf_margin_id: true,
            leaf_margins: {
              select: {
                type_of_leaf_margin: true,
              },
            },
          },
        },

        plants_leaf_arrangements: {
          select: {
            leaf_arrangement_id: true,
            leaf_arrangements: {
              select: {
                arrangement: true,
              },
            },
          },
        },
        plants_fruit_types: {
          select: {
            fruit_type_id: true,
            fruit_types: {
              select: {
                type_of_fruit: true,
              },
            },
          },
        },
        plants_fruit_colors: {
          select: {
            color_id: true,
            fruit_colors: {
              select: { color: true },
            },
          },
        },
        plants_fruit_shapes: {
          select: {
            fruit_shape_id: true,
            fruit_shapes: {
              select: { shape: true },
            },
          },
        },
        plants_fruit_sizes: {
          select: {
            fruit_size_id: true,
            fruit_sizes: {
              select: { size: true },
            },
          },
        },
        plants_fruiting_months: {
          select: {
            fruiting_month_id: true,
            fruiting_months: {
              select: { month: true },
            },
          },
        },
        plants_ukwf_areas: {
          select: {
            ukwf_area_id: true,
            ukwf_areas: {
              select: {
                ukwf_area: true,
              },
            },
          },
        },
        plants_k_sectors: {
          select: {
            k_sector_id: true,
            k_sectors: {
              select: {
                sector: true,
              },
            },
          },
        },

        plants_photos: {
          select: { photo_name: true },
        },
        plants_regions: {
          select: {
            regions: {
              select: {
                latitude: true,
                longitude: true,
              },
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
