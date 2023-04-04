import prisma from "../../../../../lib/prisma"
// API for plant  fruit details
export default async function getLeafDetails(req, res){
    const {leafDetails}=req.query
    try{
        //Fetch data from database
        // console.log(params);
        const plant = await prisma.plants.findMany({
            where:{
                species_name:leafDetails //this name must be similatr to  dynamic file name
            },
            select: {
                leaf_type:true,
                plants_leaf_margins:{
                    select:{
                        leaf_margin_id:true,
                        leaf_margins:{
                            select:{
                                type_of_leaf_margin:true
                            }
                        }
                    }
                },
                plants_leaf_arrangements: {
                select:{leaf_arrangement_id:true,
                    leaf_arrangements:{
                select: {
                    arrangement : true
                  }
                }}
          }
             
        },
        })
        // console.log(tms);
        res.json(plant)
    } catch(e){
        console.error(e)
    }
}