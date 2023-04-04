import { Container } from '@mui/material';
import { Box } from '@mui/system';
import DynamicKeyValueCard from './dynamicvaluecard';
export default function FruitDetails({fruits_data}){
    console.log('dataaaa');
   console.log(fruits_data)
console.log('fruit types')
console.log(fruits_data.map((specie)=>specie. plants_fruiting_months.map(fruit=>fruit)))

  return(
    fruits_data.map((specie) =>(
      <Box key={specie.id}>
        <Box>Feature</Box>
        <DynamicKeyValueCard key={specie.id} feature='Fruit Type' value={specie.plants_fruit_types.map(fruit =>fruit.fruit_types.type_of_fruit)}
        />
          {/* <DynamicKeyValueCard key={specie.id} feature='Fruit Color' keyName='Fruit Color' value={specie.plants_fruit_colors.map(color =>color.fruit_colors.color + ' ')}
          /> */}
          <DynamicKeyValueCard key={specie.id} feature='Fruit Shape' keyName='Fruit Color' value={specie.plants_fruit_shapes.map(shape =>shape.fruit_shapes.shape + ' ')}
          />
      </Box>)
    ))}
        

    




