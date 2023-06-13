/**
 * Returns data on the k-sectors for a given plant species.
 * @param {object} req - The request object.
 * @param {object} res - The response object.
 * @param {string} req.query.ksectorDetails - The name of the plant species to retrieve data for.
 * @returns {Promise} A Promise that resolves to an array of objects representing k-sectors for the given plant species.
 * @throws {Error} If there is an error retrieving data from the database.
 */

import prisma from "../../../../lib/prisma";
// API for plant  fruit details
export default async function getKsectorDetails(req, res) {
  const { ksectorDetails } = req.query;
  try {
    //Fetch data from database
    // console.log(params);
    const plant = await prisma.plants.findMany({
      where: {
        species_name: ksectorDetails, //this name must be similatr to  dynamic file name
      },
      select: {
        plants_k_sectors: {
          select: {
            k_sector_id: true,
            k_sectors: {
              select: {
                sector: true,
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
