import prisma from "../../../../../lib/prisma";
// API for plant  fruit details
export default async function getUKWFDetails(req, res) {
  const { ukwfDetails } = req.query;
  try {
    //Fetch data from database
    // console.log(params);
    const plant = await prisma.plants.findMany({
      where: {
        species_name: ukwfDetails, //this name must be similatr to  dynamic file name
      },
      select: {
        plants_ukwf_areas: {
          select: {
            ukwf_area_id: true,
            ukwf_areas: {
              select: {
                ukwf_area: true,
              },
            },
          },
        },
      },
    });
    // console.log(tms);
    res.json(plant);
  } catch (e) {
    console.error(e);
  }
}
