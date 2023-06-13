import prisma from "../../../../lib/prisma";
import NextCors from "nextjs-cors";
// API for Coleoptera details
export default async function getColeoptera(req, res) {
  //enable cors
  await NextCors(req, res, {
    // Options
    methods: ["GET", "HEAD", "PUT", "PATCH", "POST", "DELETE"],
    origin: "*",
    optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
  });
  try {
    // Fetch data from database
    const coleoptera = await prisma.insects.findMany({
      where: {
        insect_orders: {
          is: {
            order_name: "Coleoptera",
          },
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
        insects_coi: {
          select: {
            nucleotide: true,
            country: true,
            genebank_accesion: true,
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

    const dipteraTephridiae = await prisma.insects.findMany({
      where: {
        insect_orders: {
          is: {
            order_name: "Diptera",
          },
        },
        insect_families: {
          is: {
            family_name: "Tephritidae",
          },
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
    const hymenopteraBraconidae = await prisma.insects.findMany({
      where: {
        insect_orders: {
          is: {
            order_name: "Hymenoptera",
          },
        },
        insect_families: {
          is: {
            family_name: "Braconidae",
          },
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

    const lepidoptera = await prisma.insects.findMany({
      where: {
        insect_orders: {
          is: {
            order_name: "Lepidoptera",
          },
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

    const otherdiptera = await prisma.insects.findMany({
      where: {
        insect_orders: {
          is: {
            order_name: "Diptera",
          },
        },
        insect_families: {
          isNot: {
            family_name: "Tephritidae",
          },
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
    const otherHymenoptera = await prisma.insects.findMany({
      where: {
        insect_orders: {
          is: {
            order_name: "Hymenoptera",
          },
        },
        insect_families: {
          isNot: {
            family_name: "Ichneumonidae",
          },
        },
        insect_families: {
          isNot: {
            family_name: "Braconidae",
          },
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
    const hymenopteraIchneumonoidae = await prisma.insects.findMany({
      where: {
        insect_orders: {
          is: {
            order_name: "Hymenoptera",
          },
        },
        insect_families: {
          is: {
            family_name: "Ichneumonidae",
          },
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
    res.json({
      coleoptera,
      dipteraTephridiae,
      otherdiptera,
      hymenopteraBraconidae,
      hymenopteraIchneumonoidae,
      otherHymenoptera,
      lepidoptera,
    });
  } catch (e) {
    console.error(e);
  }
}
