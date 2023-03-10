
import prisma from "../../../../../lib/prisma"
// API for Coleoptera details
export default async function getColeoptera(req, res) {
  try {
    const {insectPhoto}=req.query
    // Fetch data from database
    const plants = await prisma.insects.findMany({
      where: {
        species_name:insectPhoto
      },
      select:{
      insect_photos:{
        select:{
          photo_id:true,
          sex:true
        }
      },
    }
    }
    )

    res.json(plants)
  } catch(e) {
    console.error(e)
  }
}
