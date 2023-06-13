import prisma from "../../../lib/prisma";
import NextCors from "nextjs-cors";

/**

Retrieves plant genera data.
@param {Object} req - The HTTP request object.
@param {Object} res - The HTTP response object.
@returns {Object} The retrieved plant genera data.
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
      const genus = await prisma.plant_genera.findMany({});
      return res.json(genus);
    } catch (e) {
      console.error(e);
    }
  }
}
