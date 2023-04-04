/*
API endpoint that retrieves fruit details for a given plant species.

Parameters:
    - req: HTTP request object
    - res: HTTP response object

Returns:
    - JSON object containing the fruit details for the specified plant species.

Example usage:
    GET /api/plants/fruit-details?fruitDetails=banana

Note: The 'fruitDetails' parameter should be set to the name of the plant species you want to retrieve fruit details for. The parameter value should be similar to the dynamic file name.
"""
*/
import prisma from "../../../../../lib/prisma"
export default async function getFamily(req, res){
    const {fruitDetails}=req.query
    try{
        //Fetch data from database
        // console.log(params);
        const plant = await prisma.plants.findMany({
            where:{
                species_name:fruitDetails //this name must be similatr to  dynamic file name
            },
            select: {

                plants_fruit_types: {
                select:{fruit_type_id:true,
                fruit_types:{
                select: {
                    type_of_fruit : true
                  }
                }}
            },
                plants_fruit_colors:{
                    select:{color_id: true,
                    fruit_colors:{
                        select:{color: true
                    }}
                }
                },
                plants_fruit_shapes:{
                    select:{fruit_shape_id: true,
                    fruit_shapes:{
                        select:{shape: true
                    }}
                } 
                },
                plants_fruit_sizes:{
                    select:{fruit_size_id: true,
                    fruit_sizes:{
                        select:{size: true
                    }}
                }, 
                },
                plants_fruiting_months:{
                    select:{fruiting_month_id: true,
                    fruiting_months:{
                        select:{month: true
                    }}
                }, 
                }
        },
        })
        // console.log(tms);
        res.json(plant)
    } catch(e){
        console.error(e)
    }
}