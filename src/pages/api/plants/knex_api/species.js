import { db } from "../../../../../lib/db"
export default async function getTeams(req, res){
    try{
        //Fetch data from database
        // console.log(params);
        const species=await db('plants')
        .select('plants.species_name','genus.genus_name','genus.family')

        .join('genus',{'plants.genus_id':'genus.id'})
        //.join('plant_photo',{'plants.id':'plant_photo.plant_id'})
        //console.log(teams)
        let tms = Array.from(species).map(specie =>({//Team is the dynamic page file name 
            species_name:specie.species_name,
            genus_name:specie.genus,
            family_name: specie.family,
            photo:specie.photo_name}
        ))
        // console.log(tms);
        res.json(tms)
    } catch(e){
        console.error(e)
    }
}
