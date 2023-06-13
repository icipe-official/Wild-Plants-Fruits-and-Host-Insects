import prisma from "../../../lib/prisma";
import NextCors from "nextjs-cors";
export default async function handle(req, res) {
  await NextCors(req, res, {
    // Options
    methods: ["GET", "HEAD", "PUT", "PATCH", "POST", "DELETE"],
    origin: "*",
    optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
  });
  if (req.method == "GET") {
    try {
      // get family data.
      const shrub_climbings = await prisma.shrub_climbings.findMany({
        select: {
          tree_type: true,
        },
      });
      // get family data.
      const spines = await prisma.spines_thorns.findMany({
        select: {
          thorns_spines: true,
        },
      });
      // get family data.
      const fruit_colors = await prisma.fruit_colors.findMany({
        select: {
          color: true,
        },
      });
      const fruit_sizes = await prisma.fruit_sizes.findMany({
        select: {
          size: true,
        },
      });
      // get family data.
      const fruit_shapes = await prisma.fruit_shapes.findMany({
        select: {
          shape: true,
        },
      });
      // get fruit type data.
      const fruit_types = await prisma.fruit_types.findMany({
        select: {
          type_of_fruit: true,
          fruit_type_description: true,
          fruit_types_glossary: {
            select: { photo_id: true },
          },
        },
        orderBy: {
          type_of_fruit: "asc",
        },
      });
      // get fruit type data.
      const latex = await prisma.latex.findMany({
        select: {
          latex_description: true,
        },
      });

      const leaf_arrangements = await prisma.leaf_arrangements.findMany({
        select: {
          arrangement: true,
        },
      });
      // get fruit type data.
      const leaf_margins = await prisma.leaf_margins.findMany({
        select: {
          type_of_leaf_margin: true,
        },
      });

      // get leaf type data.
      const leaf_types = await prisma.plants.findMany({
        distinct: ["leaf_type"],
        select: {
          leaf_type: true,
        },
      });

      return res.json({
        shrub_climbings,
        spines,
        latex,
        fruit_types,
        fruit_colors,
        fruit_shapes,
        leaf_types,
        leaf_margins,
        leaf_arrangements,
        fruit_sizes,
      });
    } catch (e) {
      console.error(e);
    }
  }
}
