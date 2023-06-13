import prisma from "../../../lib/prisma";
export default async function handle(req, res) {
  if (req.method == "GET") {
    try {
      // get fruit type data.
      const margins = await prisma.leaf_margins.findMany({
        select: {
          type_of_leaf_margin: true,
        },
      });
      return res.json(margins);
    } catch (e) {
      console.error(e);
    }
  }
}
