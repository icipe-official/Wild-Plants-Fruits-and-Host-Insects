import NextCors from "nextjs-cors";
import prisma from "../../../lib/prisma";

export default async function handle(req, res) {
  await NextCors(req, res, {
    // Options
    methods: ["DELETE", "GET", "HEAD", "PATCH", "POST", "PUT"],
    origin: "*",
    optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
  });

  if (req.method === "GET") {
    try {
      // Get family data.
      const glossary = await prisma.glossary.findMany({
        select: {
          glossary_description: true,
          glossary_id: true,
          glossary_photos: {
            select: { photo_id: true },
          },
          glossary_term: true,
          glossary_type: true,
        },
        orderBy: {
          glossary_term: "asc",
        },
      });
      return res.json(glossary);
    } catch (e) {
      console.error(e);
    }
  }
}
