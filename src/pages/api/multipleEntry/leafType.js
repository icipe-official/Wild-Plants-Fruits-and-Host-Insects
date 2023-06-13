import prisma from "../../../lib/prisma";
export default async function handle(req, res) {
  if (req.method == "GET") {
    try {
      // get fruit type data.
      const plant = await prisma.plants.findMany({
        distinct: ["leaf_type"],
        select: {
          leaf_type: true,
        },
      });
      return res.json(plant);
    } catch (e) {
      console.error(e);
    }
  }
}
