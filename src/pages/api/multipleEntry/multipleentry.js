import NextCors from "nextjs-cors";
import prisma from "../../../lib/prisma";
// const [query,setQuery]=useState({'plant_types':[],'plant_thorns':[],'plant_latex':[],'fruit_types':[],'fruit_colors':[],
// 'fruit_sizes':[],'fruit_shapes':[],'leaf_types':[],'leaf_margins':[],'leaf_arrangements':[]})

export default async function getFilterdData(req, res) {
  await NextCors(req, res, {
    // Options
    methods: ["GET", "HEAD", "PUT", "PATCH", "POST", "DELETE"],
    origin: "*",
    optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
  });
  try {
    const filterJson = req.query.filters;
    const filterObj = filterJson ? JSON.parse(filterJson) : {};
    const shrub_climbings = filterObj.shrub_climbings || [];
    const plant_latex = filterObj.plant_latex || [];
    const plant_spines = filterObj.plant_spines || [];
    const fruit_types = filterObj.fruit_types || [];
    const fruit_colors = filterObj.fruit_colors || [];
    const fruit_sizes = filterObj.fruit_sizes || [];
    const fruit_shapes = filterObj.fruit_shapes || [];
    const leaf_types = filterObj.leaf_types || [];
    const leaf_margins = filterObj.leaf_margins || [];
    const leaf_arrangements = filterObj.leaf_arrangements || [];
    ////console.log('filterObj');

    ////console.log(filterObj);
    const plant = await prisma.plants.findMany({
      select: {
        id: true,
        species_name: true,
        plant_genera: {
          select: {
            genus_name: true,
          },
        },
        plants_photos: {
          select: { photo_name: true, photo_id: true },
        },
      },
      where: {
        AND: [
          shrub_climbings.length !== 0 && {
            plants_shrub_climbings: {
              some: {
                shrub_climbings: {
                  tree_type: {
                    in: shrub_climbings,
                  },
                },
              },
            },
          },
          plant_latex.length !== 0 && {
            plants_latex: {
              some: {
                latex: {
                  latex_description: {
                    in: plant_latex,
                  },
                },
              },
            },
          },
          plant_spines.length !== 0 && {
            plants_spines_thorns: {
              some: {
                spines_thorns: {
                  thorns_spines: {
                    in: plant_spines,
                  },
                },
              },
            },
          },
          fruit_colors.length !== 0 && {
            plants_fruit_colors: {
              some: {
                fruit_colors: {
                  color: {
                    in: fruit_colors,
                  },
                },
              },
            },
          },
          fruit_sizes.length !== 0 && {
            plants_fruit_sizes: {
              some: {
                fruit_sizes: {
                  size: {
                    in: fruit_sizes,
                  },
                },
              },
            },
          },
          fruit_types.length !== 0 && {
            plants_fruit_types: {
              some: {
                fruit_types: {
                  type_of_fruit: {
                    in: fruit_types,
                  },
                },
              },
            },
          },
          fruit_shapes.length !== 0 && {
            plants_fruit_shapes: {
              some: {
                fruit_shapes: {
                  shape: {
                    in: fruit_shapes,
                  },
                },
              },
            },
          },
          leaf_types.length !== 0 && {
            leaf_type: {
              in: leaf_types,
            },
          },
          leaf_margins.length !== 0 && {
            plants_leaf_margins: {
              some: {
                leaf_margins: {
                  type_of_leaf_margin: {
                    in: leaf_margins,
                  },
                },
              },
            },
          },
          leaf_arrangements.length !== 0 && {
            plants_leaf_arrangements: {
              some: {
                leaf_arrangements: {
                  arrangement: {
                    in: leaf_arrangements,
                  },
                },
              },
            },
          },
        ].filter(Boolean),
      },
    });

    res.json(plant);
  } catch (e) {
    console.error(e);
    res.status(400).json({ error: "Invalid query parameter" });
  }
}
