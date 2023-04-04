import prisma from "../../../../lib/prisma";

/**

Retrieves plant genera data.
@param {Object} req - The HTTP request object.
@param {Object} res - The HTTP response object.
@returns {Object} The retrieved plant genera data.
*/
export default async function handle(req, res) {
if (req.method == "GET") {
try {
const genus = await prisma.plant_genera.findMany({});
return res.json(genus);
} catch (e) {
console.error(e);
}
}
}