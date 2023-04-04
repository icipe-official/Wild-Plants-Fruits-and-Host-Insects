import { Container,Box } from "@mui/material"
import Order from "../../components/insects/dipteraTephritidae"
import dynamic from 'next/dynamic';
import InsectQuery from "components/insects/insectsQuery";
import FruitsReared from "components/insects/fruitsReared";
import RegionsInsect from "components/insects/regeons";
import InsectPhotos from "components/insects/photo";
//Dynamic imports to avoid hydration error. ensure serverdide and client side rendering are the same
const Coleoptera = dynamic(() => import('components/insects/coleoptera'), {
  ssr: false,
});
import DipteraTephritidae from "components/insects/dipteraTephritidae";
const Lepidoptera = dynamic(() => import('components/insects/lepidoptera'), {
  ssr: false,
});
const DipteraTephridiae = dynamic(() => import('components/insects/dipteraTephritidae'), {
  ssr: false,});
  
// const OtherDiptera = dynamic(() => import('components/insects/otherDiptera'), {
//   ssr: false,
// });

const Hymenoptera = dynamic(() => import('components/insects/hymenoptera'), {
  ssr: false,
});

// const OtherHymenoptera = dynamic(() => import('components/insects/otherHymenoptera'), {
//   ssr: false,
// });

export default function Inects(props){
    console.log("props.insect_data client side")
    console.log(props.insect_data)

    console.log("props.fruits reared client side")
    console.log(props.fruits_reared_data)

    console.log("props.regions_collected_data client side")
    console.log(props.regions_collected_data)

    console.log("props.photos_data client side")
    console.log(props.photos_data)
    return(
    <Container>
    <Box sx={{display:'flex'}}>
      <Box>
       <InsectQuery  insect_data={props.insect_data}/>
       <RegionsInsect regions_collected_data={props.regions_collected_data}/>
       <FruitsReared fruits_reared_data={props.fruits_reared_data}/>
    </Box>
    <Box sx={{paddingTop:'2rem',marginLeft:'5rem'}}>
        <InsectPhotos photos_data={props.photos_data}/>
     </Box>
    </Box>
    </Container>
    )
}


//fetch data for preparing page fior insects
export async function getServerSideProps(context){
    console.log('path for i details')
    //extract query params from url
    const  genus = context.query.genus
    const selected_species = context.query.species_name
    console.log("genus selected serverside")
    console.log(genus)
    console.log("species selected serverside")
    console.log(selected_species)
    console.log('http://localhost:3000/api/insects/' + genus)

    //define the data to be returned
    const props = {};
  
    // Only query for insects if the genus is defined
    if (genus) {
      const res_genus = await fetch(`http://localhost:3000/api/insects/${genus}`);
      const insect_data = await res_genus.json();
      console.log("insect_data server side")  

    // fruits reared data
     // Set the insects and genus props if they are defined
      if (genus) {
        props.insect_data = insect_data;
      }
      if (genus) {
        props.genus = genus;
      }
    }
  
      // Only query for fruits reared if the species name is defined
      if (selected_species) {
        const res_selected_species = await fetch(`http://localhost:3000/api/insects/fruitsRared/${selected_species}`);
        const fruits_reared_data = await res_selected_species.json();
        console.log("fruits_reared server side")  
        console.log(fruits_reared_data)  
  
       // Set the insects and genus props if they are defined
        if (selected_species) {
          props.fruits_reared_data = fruits_reared_data;
        }
      }
    // regions collected data
    const region = await fetch(`http://localhost:3000/api/insects/regions/${selected_species}`);
    const regions_collected_data = await region.json();
    console.log("region_collected_data server side")  
    console.log(regions_collected_data)

    // insect photo data
      const photo = await fetch(`http://localhost:3000/api/insects/photos/${selected_species}`);
      const photos_data = await photo.json();
      console.log("photo_data server side")  
      console.log(photos_data)
    //

    // Set any other props that need to be returned
    props.regions_collected_data = regions_collected_data
    props.photos_data = photos_data

    // props.otherProp2 = { key: "value" };
    // // ... add more props as needed
  
    return {
      props,
    };
  }
 
  