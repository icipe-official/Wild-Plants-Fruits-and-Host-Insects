import prisma from "../../../lib/prisma";
export default async function handle(req, res) {
  if (req.method == "GET") {
    try {
      // get family data.
      const colors = await prisma.shrub_climbings.findMany({
        select: {
          tree_type: true,
        },
      });
      return res.json(colors);
    } catch (e) {
      console.error(e);
    }
  }
}
