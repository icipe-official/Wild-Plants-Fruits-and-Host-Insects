import { query } from "express";
import prisma from "../../../../../lib/prisma";
import NextCors from "nextjs-cors";
// API for Coleoptera details
export default async function getInsectdeatils(req, res) {
  await NextCors(req, res, {
    // Options
    methods: ["GET", "HEAD", "PUT", "PATCH", "POST", "DELETE"],
    origin: "*",
    optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
  });
  try {
    const { insectsAll } = req.query;
    // Fetch data from database
    const plants = await prisma.insects.findMany({
      where: { species_name: insectsAll },
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
        insect_photos: {
          select: {
            photo_id: true,
          },
        },
        insects_regions: {
          select: {
            regions: {
              select: {
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
