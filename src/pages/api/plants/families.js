import prisma from "../../../../lib/prisma";

/**
 * Retrieves all plant families from the database and returns them sorted alphabetically.
 * @param req - The request object.
 * @param res - The response object.
 */
export default async function handle(req, res) {
  if (req.method == "GET") {
    try {
      const families = await prisma.plant_families.findMany({
        orderBy: {
          family_name: 'asc' // sort by family name in ascending order
        }
      });

      return res.json(families);
    } catch (error) {
      console.error(error);
      return res.status(500).json({ message: "Internal server error." });
    }
  }
}
