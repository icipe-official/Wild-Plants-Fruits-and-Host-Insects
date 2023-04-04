// This is an API end point for plant species details
// import database client
//inner join plants table,genus table and families table
// return json data of plant family and genus details
import { db } from "../../../../../lib/db"
export default async function getplantSpecie(req, res){
    try{
        //Fetch data from database
        // console.log(params);
        const plant_species=await db('plants')
        .select('plants.id','family.family_name','plants.species_name','plants.genus_id','genus.genus_name')
        .join('genus',{'plants.genus_id':'genus.id'})
        .join('family',{'genus.family_id':'family.id'})
        //console.log(teams)
        let tms = Array.from(plant_species).map(specie =>({//Team is the dynamic page file name 
            species_id:specie.id,
            species_name:specie.species_name,
            genus_id: specie.genus_id,
            genus_name: specie.genus_name,
            family_name:specie.family_name}
            ))
        // console.log(tms);
        res.json(tms)
    } catch(e){
        console.error(e)
    }
}