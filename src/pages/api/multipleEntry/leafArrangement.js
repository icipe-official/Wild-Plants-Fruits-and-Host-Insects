import prisma from "../../../lib/prisma";
export default async function handle(req, res) {
  if (req.method == "GET") {
    try {
      // get fruit type data.
      const arrangements = await prisma.leaf_arrangements.findMany({
        select: {
          arrangement: true,
        },
      });
      return res.json(arrangements);
    } catch (e) {
      console.error(e);
    }
  }
}
