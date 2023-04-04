import Grid from "@mui/material/Grid";
import { useState } from "react";
// import PlantDetailValues from "components/plants/Plant/plantDetailValuesMUI"
// import FruitDetailsFeaturesValues from "components/plants/plantFruitLeafValues"
// import LeafDetailValues from "components/plants/Leaf/leafDetailValues"
import Photos from "components/plants/photos/photos";
import SearchbarMUI from "components/plants/FamilyGenusSpecies/PlantGenusFamilySearchbar";
// import FruitDetails from "components/plants/fruitdetailsMUI"
//import FruitDetailsFeaturesValues from "components/plants/plantFruitLeafValues";
import PlantDetailsFeaturesValues from "components/plants/plantFruitLeafValues";
import { Container, Box } from "@mui/material";
import PlantSpecieFamilyGenusResult from "components/plants/plantSpeciesFamilyResult";
import KsectorUKFKeyValues from "components/plants/ksectorUKWF";
import PlantDescriptionMUI from "components/plants/description";
import { useMediaQuery } from "@mui/material";
import QueryResult from "components/plants/queryresult";

// import Coleoptera from "components/plants/insectsRared/Coleoptera"
// import Lepidoptera from "components/plants/insectsRared/Lepidoptera"
// import DipteraTephridiae from "components/plants/insectsRared/dipteraTephridiae"
// import OtherDiptera from "components/plants/insectsRared/otherDiptera"
// import HymenopteraBraconidae from "components/plants/insectsRared/hymenopteraBraconidae"
// import OtherHymenoptera from "components/plants/insectsRared/otherHymenoptera"
import dynamic from "next/dynamic";
//Dynamic imports to avoid hydration error. ensure serverdide and client side rendering are the same

export default function PlantPage(props) {
  const [data, setData] = useState([]);
  const [loaded, setLoaded] = useState(false);
  const [error, setError] = useState(null);
  const [isLoading, setIsLoading] = useState(true); // add state variable to track loading status
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));

  // const router = useRouter();
  // const query = router.query;
  console.log("props.query_data");
  console.log(props.query_data);
  return (
    <Container sx={{ backgroundColor: "lightbrown" }}>
      <QueryResult />
      {/* <SearchbarMUI /> */}
      {/* <Box>
        <PlantSpecieFamilyGenusResult plants_data={props.plants_data} />
      </Box> */}
      {/*  */}
    </Container>
  );
}

// export async function getServerSideProps(context) {
//   console.log("context.params");
//   const families = await fetch("http://localhost:3000/api/plants/families");
//   const plant_family = await families.json();
//   console.log("plant_family");
//   //   console.log(plant_family[0].family_name)
//   //extract first family  id
//   const first_family_id = plant_family[0].id;
//   console.log(first_family_id);

//   //find first genues
//   const genus = await fetch("http://localhost:3000/api/plants/genus");
//   const plant_genus = await genus.json();
//   console.log("plant_genus");
//   console.log(plant_genus);
//   // use contxt param to get the query parameter
//   const d = context.query.query;
//   // console.log("dddddddddddddddddddddd")
//   const data = await fetch(
//     "http://localhost:3000/api/multipleEntry/multipleentry?filters=" + d
//   );
//   const query =
//     "http://localhost:3000/api/multipleEntry/multipleentry?filters=" + d;
//   const query_data = await data.json();

//   console.log(" query result data");
//   console.log(query);
//   //extract first specie data
//   const first_specie = query_data.map((sp) => sp.species_name)[0];
//   console.log(query_data.map((sp) => sp.species_name)[0]);

//   //const first_query=data.map((dat)=>dat.species_name)
//   //Featch plants data from API
//   const plant = await fetch(
//     "http://localhost:3000/api/plants/plantdetails/" + first_specie
//   );
//   const plants_data = await plant.json();
//   console.log("plants_data serverside");
//   //  console.log(plants_data)

//   //Fetch fruits data from API
//   const fruit = await fetch(
//     "http://localhost:3000/api/plants/fruitdetails/" + first_specie
//   );
//   const fruits_data = await fruit.json();
//   console.log("fruits data serverside");
//   //  console.log(fruits_data)

//   //Fetch photos data from API
//   const photo = await fetch(
//     "http://localhost:3000/api/plants/plantphoto/" + first_specie
//   );
//   const photo_data = await photo.json();
//   console.log("photo data serverside");
//   //  console.log(photo_data)
//   //Fetch leaf data from  API
//   const leaf = await fetch(
//     "http://localhost:3000/api/plants/leafdetails/" + first_specie
//   );
//   const leaves_data = await leaf.json();
//   console.log("leaf data serverside");
//   //  console.log(leaves_data)

//   // Fetch k sector data
//   const ksector = await fetch(
//     "http://localhost:3000/api/plants/ksectordetails/" + first_specie
//   );
//   const k_sector_data = await ksector.json();
//   console.log("ksector_data server side");
//   //  console.log(k_sector_data)

//   // Fetch ukwf area data
//   // Fetch k sector data
//   const ukwf = await fetch(
//     "http://localhost:3000/api/plants/ukwfareadetails/" + first_specie
//   );
//   const ukwf_area_data = await ukwf.json();
//   console.log("ukwf_area_data serverside");
//   // console.log(ukwf_area_data)

//   // fetch coleoptera data
//   const dip_teph = await fetch(
//     "http://localhost:3000/api/plants/insectsReared/DipteraTephrideae/" +
//       first_specie
//   );
//   const diptera_tephritideae_data = await dip_teph.json();
//   console.log("diptera_tephritideae_data serverside");
//   // console.log(diptera_tephritideae_data)

//   // fetch lepidoptera_data data
//   const lep = await fetch(
//     "http://localhost:3000/api/plants/insectsReared/Lepidoptera/" + first_specie
//   );
//   const lepidoptera_data = await lep.json();
//   console.log("lepidoptera_data serverside");
//   // console.log(lepidoptera_data)

//   // fetch coleoptera data
//   const col = await fetch(
//     "http://localhost:3000/api/plants/insectsReared/Coleoptera/" + first_specie
//   );
//   const coleoptera_data = await col.json();
//   console.log("coleoptera_data serverside");
//   // console.log(coleoptera_data)

//   // fetch coleoptera data
//   const other_dip = await fetch(
//     "http://localhost:3000/api/plants/insectsReared/OtherDiptera/" +
//       first_specie
//   );
//   const other_diptera_data = await other_dip.json();
//   console.log("other_diptera_data serverside");
//   // console.log(other_diptera_data)

//   // fetch coleoptera data
//   const hym_opin = await fetch(
//     "http://localhost:3000/api/plants/insectsReared/HymenopteraBraconidaeOpiina/" +
//       first_specie
//   );
//   const hymenoptera_bracon_opiinae_data = await hym_opin.json();
//   console.log("hymenoptera_bracon_opiinae_data serverside");
//   // console.log(hymenoptera_bracon_opiinae_data)

//   // fetch coleoptera data
//   const other_hym = await fetch(
//     "http://localhost:3000/api/plants/insectsReared/OtherHymenoptera/" +
//       first_specie
//   );
//   const other_hymenoptera_data = await other_hym.json();
//   console.log("other_hymenoptera_data serverside");
//   // console.log(other_hym)

//   return {
//     props: {
//       plants_data,
//       fruits_data,
//       photo_data,
//       leaves_data,
//       k_sector_data,
//       ukwf_area_data,
//       coleoptera_data,
//       lepidoptera_data,
//       diptera_tephritideae_data,
//       other_diptera_data,
//       hymenoptera_bracon_opiinae_data,
//       other_hymenoptera_data,
//       query_data,
//     },
//   };
// }
