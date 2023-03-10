
import prisma from "../../../../../lib/prisma"
// API for Coleoptera details
export default async function getColeoptera(req, res) {
  try {
    const {region}=req.query
    // Fetch data from database
    const plants = await prisma.insects.findMany({
      where: {
        species_name:region   
      },
      select:{
      insects_regions:{
        select:{
          regions:{
            select:{
                region:true
            }
          }
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
