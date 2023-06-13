import prisma from "../../../lib/prisma";
export default async function handle(req, res) {
  if (req.method == "GET") {
    try {
      // get fruit type data.
      const types = await prisma.fruit_types.findMany({
        select: {
          type_of_fruit: true,
        },
      });
      return res.json(types);
    } catch (e) {
      console.error(e);
    }
  }
}
