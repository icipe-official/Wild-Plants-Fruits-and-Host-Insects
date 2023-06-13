import prisma from "../../../lib/prisma";
export default async function handle(req, res) {
  if (req.method == "GET") {
    try {
      // get family data.
      const spines = await prisma.spines_thorns.findMany({
        select: {
          thorns_spines: true,
        },
      });
      return res.json(spines);
    } catch (e) {
      console.error(e);
    }
  }
}
