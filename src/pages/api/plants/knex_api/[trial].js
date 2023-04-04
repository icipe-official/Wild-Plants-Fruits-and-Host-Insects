
import { db } from "../../../../../lib/db"
export default async function getFamily(req, res){
   const {trial}=req.query
    try{
        //Fetch data from database
        // console.log(params);
        const families=await db('family')
        .select('family.id','family.family_name')
        .where({family_name:trial})

        //.join('plant_photo',{'plants.id':'plant_photo.plant_id'})
        //console.log(teams)
        let tms = Array.from(families).map(family =>({//Team is the dynamic page file name 
            family_id:family.id,
            family_name:family.family_name}
        ))
        // console.log(tms);
        res.json(tms)
    } catch(e){
        console.error(e)
    }
}
