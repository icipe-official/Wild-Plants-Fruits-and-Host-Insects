import prisma from "../../../../../lib/prisma";
import NextCors from "nextjs-cors";
// API for plant fruit details
export default async function getColeoptera(req, res) {
  // Run the cors middleware
  // nextjs-cors uses the cors package, so we invite you to check the documentation https://github.com/expressjs/cors
  await NextCors(req, res, {
    // Options
    methods: ["GET", "HEAD", "PUT", "PATCH", "POST", "DELETE"],
    origin: "*",
    optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
  });
  const { allrearedinsects } = req.query;

  try {
    // Fetch data from database
    const plants = await prisma.insects.findMany({
      where: {
        // insect_orders: {
        //   is: {
        //     order_name: "Coleoptera",
        //   },
        // },
        plants_insects: {
          some: {
            plants: {
              is: {
                id: parseInt(allrearedinsects),
              },
            },
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

//http://localhost:3000/api/plants/Allinsectsreared/polystachius%20Delile
