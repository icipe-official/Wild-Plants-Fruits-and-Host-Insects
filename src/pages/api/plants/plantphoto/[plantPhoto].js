import prisma from "../../../../lib/prisma";
// API for plant  fruit details
export default async function getFamily(req, res) {
  const { plantPhoto } = req.query;
  try {
    //Fetch data from database
    // console.log(params);
    const plant = await prisma.plants.findMany({
      where: {
        species_name: plantPhoto, //this name must be similatr to  dynamic file name
      },
      select: {
        species_name: true,

        plant_photos: {
          select: { photo_name: true },
        },
      },
    });
    // console.log(tms);
    res.json(plant);
  } catch (e) {
    console.error(e);
  }
}
