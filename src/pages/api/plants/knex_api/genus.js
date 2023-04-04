
import { db } from "../../../../../lib/db"
export default async function getGenus(req, res){
    try{
        //Fetch data from database
        // console.log(params);
        const genus_list=await db('genus')
        .select('genus.id','genus.genus_name','genus.family_id','family.family_name')

        .join('family',{'genus.family_id':'family.id'})
        //.join('plant_photo',{'plants.id':'plant_photo.plant_id'})
        //console.log(teams)
        let tms = Array.from(genus_list).map(genus =>({//Team is the dynamic page file name 
            genus_id:genus.id,
            genus_name:genus.genus_name,
            family_id: genus.family_id,
            family_name: genus.family_name}

        ))
        // console.log(tms);
        res.json(tms)
    } catch(e){
        console.error(e)
    }
}
