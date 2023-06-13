import prisma from "../../../lib/prisma";
import NextCors from "nextjs-cors";

/**
 * Retrieves all plant families from the database and returns them sorted alphabetically.
 * @param req - The request object.
 * @param res - The response object.
 */
export default async function handle(req, res) {
  // Run the cors middleware
  // nextjs-cors uses the cors package, so we invite you to check the documentation https://github.com/expressjs/cors
  await NextCors(req, res, {
    // Options
    methods: ["GET", "HEAD", "PUT", "PATCH", "POST", "DELETE"],
    origin: "*",
    optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
  });
  if (req.method == "GET") {
    try {
      const families = await prisma.plant_families.findMany({
        orderBy: {
          family_name: "asc", // sort by family name in ascending order
        },
      });

      return res.json(families);
    } catch (error) {
      console.error(error);
      return res.status(500).json({ message: "Internal server error." });
    }
  }
}
