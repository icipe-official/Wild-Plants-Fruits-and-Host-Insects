import prisma from "../../../lib/prisma";
import NextCors from "nextjs-cors";
export default async function handle(req, res) {
  await NextCors(req, res, {
    // Options
    methods: ["GET", "HEAD", "PUT", "PATCH", "POST", "DELETE"],
    origin: "*",
    optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
  });
  if (req.method == "GET") {
    try {
      // get family data.
      const glossary = await prisma.glossary.findMany({
        select: {
          glossary_id: true,
          glossary_type: true,
          glossary_term: true,
          glossary_description: true,

          glossary_photos: {
            select: { photo_id: true },
          },
        },
      });
      return res.json(glossary);
    } catch (e) {
      console.error(e);
    }
  }
}
