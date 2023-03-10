import { Container,Box } from "@mui/material"
import Order from "../../components/insects/dipteraTephritidae"
import dynamic from 'next/dynamic';
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

export default function order(props){
    return(
    <Container>
      <Box sx={{display:'flex',marginTop:'1rem',marginBottom:'1rem'}}>
        <Box>
        <DipteraTephritidae 
        diptera_tephritideae_data={props.diptera_tephritideae_data}
        other_diptera_data={props.other_diptera_data}/>
       </Box>
      
       <Box sx={{marginLeft:''}} >
        <Lepidoptera lepidoptera_data={props.lepidoptera_data}/>
        </Box>

       <Box>
        <Coleoptera coleoptera_data={props.coleoptera_data}/>
      </Box>
      <Box sx={{marginLeft:'1rem'}} >
        <Hymenoptera 
        hymenoptera_bracon_opiinae_data={props.hymenoptera_bracon_opiinae_data}
        hym_ichumonoidae_data={props.hym_ichumonoidae_data}
        other_hymenoptera_data={props.other_hymenoptera_data}
        />
      </Box>

        </Box>
    </Container>
    )
}



//fetch data for preparing page fior insects
export async function getStaticProps(context){
    console.log('context.params');        
      // fetch coleoptera data
      const dip_teph = await fetch('http://localhost:3000/api/insects/dipteraTephritidae/')
      const diptera_tephritideae_data= await dip_teph.json()
      console.log('diptera_tephritideae_data serverside')
      console.log(diptera_tephritideae_data)
  
      // fetch lepidoptera_data data
      const lep = await fetch('http://localhost:3000/api/insects/lepidoptera/')
      const lepidoptera_data= await lep.json()
      console.log('lepidoptera_data serverside')
      console.log(lepidoptera_data)
  
     // fetch coleoptera data
      const col = await fetch('http://localhost:3000/api/insects/coleoptera/')
      const coleoptera_data= await col.json()
      console.log('coleoptera_data serverside')
      console.log(coleoptera_data)
  
    //   // fetch other diptera data
      const other_dip = await fetch('http://localhost:3000/api/insects/otherDiptera/')
      const other_diptera_data= await other_dip.json()
      console.log('other_diptera_data serverside')
      console.log(other_diptera_data)
  
            // fetch hymenoptera braconidae data
      const hym_opin = await fetch('http://localhost:3000/api/insects/hymenopteraBraconidae/')
      const hymenoptera_bracon_opiinae_data= await hym_opin.json()
      console.log('hymenoptera_bracon_opiinae_data serverside')
      console.log(hymenoptera_bracon_opiinae_data)
  
      // fetch hymenoptera data
      const other_hym = await fetch('http://localhost:3000/api/insects/otherHymenoptera/')
      const other_hymenoptera_data= await other_hym.json()
      console.log('other_hymenoptera_data serverside')
      console.log(other_hymenoptera_data)
      //hymenopteraIchneumonoidae          
          // fetch hymenoptera data
      const hym_ichumonoidae = await fetch('http://localhost:3000/api/insects/hymenopteraIchneumonoidae/')
      const hym_ichumonoidae_data= await hym_ichumonoidae.json()
      console.log('other_hymenoptera_data serverside')
      console.log(hym_ichumonoidae_data) 
      return{
      props:{
       
        lepidoptera_data,
        diptera_tephritideae_data,
        coleoptera_data,
        other_diptera_data,
        hym_ichumonoidae_data,
        hymenoptera_bracon_opiinae_data,
        other_hymenoptera_data
      }
    }
  }