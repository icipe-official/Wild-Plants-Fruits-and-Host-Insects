
import { db } from "../../../../../lib/db";
export default async function getFamily(req, res){
    try{
        //Fetch data from database
        // console.log(params);
        const plant= await db('plants')
        //.select('species_name',)
        .select('*')
        .join('plant_fruit_shape',{'plants.id':'plant_fruit_shape.plant_id'})
       .join('plant_fruit_type',{'plant_fruit_type.plant_id':'plants.id'})
       //.where({species_name:context.params.speciesName})
       .join('fruit_type',{'fruit_type.fruit_type_id':'plant_fruit_type.fruit_type_id'})
       .join('fruit_shape',{'fruit_shape.fruit_shape_id':'plant_fruit_shape.fruit_shape_id'})

       //console.log(plant)
        let data = Array.from(plant).map(specie =>({
            // all:specie,
            name:specie.species_name, //Team is the dynamic page file name
            fruit_type:specie.type_of_fruit,
            max_lalitude:specie.max_latitude,
            min_lalitude:specie.min_latitude,
            leaf_type:specie.leaf_type,
            fruit_shape:specie.shape,
            description:specie.description}))
         console.log('dataaaa');
        res.json(data)
       // console.log(data);

    } catch(e){
        console.error(e)
  }
}