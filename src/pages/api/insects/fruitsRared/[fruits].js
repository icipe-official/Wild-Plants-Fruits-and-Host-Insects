
import prisma from "../../../../../lib/prisma"
// API for Coleoptera details
export default async function getColeoptera(req, res) {
  try {
    const {fruits}=req.query
    // Fetch data from database
    const plants = await prisma.insects.findMany({
      where: {
        species_name:fruits
      },
      select:{
        species_name:true,
      insect_orders:{
        select:{
          order_name:true
        }
      },
      insect_families:{
        select:{
          family_name:true
        }
      },
      insect_sub_families:{
        select:{
          sub_family_name:true
        }
      },
      insect_genera:{
        select:{
          genus_name:true
        }
      },
      plants_insects:{
        select:{
          plants:{
            select:{
            species_name:true,
              plant_genera:{
                select:{
                  genus_name:true
                }
              
            }
          }}
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
