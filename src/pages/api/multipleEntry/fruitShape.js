import prisma from "../../../lib/prisma";
export default async function handle(req, res) {
  if (req.method == "GET") {
    try {
      // get family data.
      const shapes = await prisma.fruit_shapes.findMany({
        select: {
          shape: true,
        },
      });
      return res.json(shapes);
    } catch (e) {
      console.error(e);
    }
  }
}
