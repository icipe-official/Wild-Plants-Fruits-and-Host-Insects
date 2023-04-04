import { Container,Box } from "@mui/material"
import Order from "../../components/insects/dipteraTephritidae"
import dynamic from 'next/dynamic';
// import InsectQuery2 from "components/insects/insectsQuery2";
import InsectQuery2 from "components/insects/insectQuery2";
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
      <InsectQuery2 genus_list={props.genus_list} insect_data={props.insect_data}/>
      <FruitsReared fruits_reared_data={props.insect_data}/>
      {/* <RegionsInsect regions_collected_data={props.regions_collected_data}/> */}
      {/* <FruitsReared fruits_reared_data={props.fruits_reared_data}/> */}
      </Box>
   <Box sx={{paddingTop:'2rem',marginLeft:'5rem'}}>
       <InsectPhotos photos_data={props.insect_data}/>
    </Box>
    </Box>
   </Container>
   )
}


export async function getStaticPaths(params){
 //DFetch data for all paths to be rendered statically
 const data=await fetch('http://localhost:3000/api/insects/all/speciesAll').then((res) => res.json())
 //console.log(Array.from(data))
 return{
   //paths-array of URL paths that shoudl be statically generated during build time
   fallback:false,
   paths: Array.from(data).map(specie =>({params:{
      //species1:specie.genus_name + ' ' +specie.species_name, //Team is the dynamic page file name
      query2:specie.species_name} //query2 is the dynamic page file name
     }))
  }
 };
//fetch data for preparing page fior insects
export async function getStaticProps(context){
   console.log('path for specie details')
 const  species=context.params.query2;
    console.log('http://localhost:3000/api/insects/all/species/' + species)
  
   const res_species_genus=await fetch('http://localhost:3000/api/insects/all/speciesAll')
   const species_genus = await res_species_genus.json();
   console.log("species_genus")
   // console.log(species_genus)


   const filtered_species_genus_data = species_genus.filter(item => item.species_name === species).map(p=>p.insect_genera.genus_name);
   console.log("filtered_species_genus_data")
   console.log(filtered_species_genus_data)
   //define the data to be returned
   const genus_list = species_genus.filter(item => item.insect_genera.genus_name === filtered_species_genus_data[0]);
   console.log("genus_list")


   console.log(genus_list)
   // Only query for insects if the genus is defined
     const res_data = await fetch(`http://localhost:3000/api/insects/all/species/${species}`);
     const insect_data = await res_data.json();
     console.log("insect_data server side") 
   return {
     props:{
       insect_data,
       genus_list
     }}}
