import { Box } from '@mui/system';
import DynamicValueCardUKWFRegion from './dynamicCardUKWFRegion';
export default function UKWFValues({ukwf_area_data}){
console.log('ukwf_area_data client side');
console.log(ukwf_area_data)
// console.log(k_sector_data.map((sector)=>sector.plants_k_sectors.map(sector=>sector)))

// padding 3 ensures first line is mapped to fruits in the features
  return(
    ukwf_area_data.map((ukwf,index) =>(
      <Box key={ukwf.id}>
        <br></br>
        <DynamicValueCardUKWFRegion key={index}  keyName='K sector' value={ukwf.plants_ukwf_areas.map(area =>area.ukwf_areas.ukwf_area)+" "}/>
     
     </Box>
     )
    ))
    }
        

    




