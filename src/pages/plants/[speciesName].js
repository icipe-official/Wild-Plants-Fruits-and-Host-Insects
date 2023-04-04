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
import PlantSpecieFamilyGenus from "components/plants/plantSpeciesFamily";
import KsectorUKFKeyValues from "components/plants/ksectorUKWF";
import PlantDescriptionMUI from "components/plants/description";
import { useMediaQuery } from "@mui/material";
// import Coleoptera from "components/plants/insectsRared/Coleoptera"
// import Lepidoptera from "components/plants/insectsRared/Lepidoptera"
// import DipteraTephridiae from "components/plants/insectsRared/dipteraTephridiae"
// import OtherDiptera from "components/plants/insectsRared/otherDiptera"
// import HymenopteraBraconidae from "components/plants/insectsRared/hymenopteraBraconidae"
// import OtherHymenoptera from "components/plants/insectsRared/otherHymenoptera"
import dynamic from "next/dynamic";
//Dynamic imports to avoid hydration error. ensure serverdide and client side rendering are the same
const Coleoptera = dynamic(
  () => import("components/plants/insectsRared/Coleoptera"),
  {
    ssr: false,
  }
);

const Lepidoptera = dynamic(
  () => import("components/plants/insectsRared/lepidoptera"),
  {
    ssr: false,
  }
);
const DipteraTephridiae = dynamic(
  () => import("components/plants/insectsRared/dipteraTephridiae"),
  {
    ssr: false,
  }
);

const OtherDiptera = dynamic(
  () => import("components/plants/insectsRared/otherDiptera"),
  {
    ssr: false,
  }
);

const HymenopteraBraconidae = dynamic(
  () => import("components/plants/insectsRared/hymenopteraBraconidae"),
  {
    ssr: false,
  }
);

const OtherHymenoptera = dynamic(
  () => import("components/plants/insectsRared/otherHymenoptera"),
  {
    ssr: false,
  }
);
export default function PlantPage(props) {
  const [data, setData] = useState([]);
  const [loaded, setLoaded] = useState(false);
  const [error, setError] = useState(null);
  const [isLoading, setIsLoading] = useState(true); // add state variable to track loading status
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));

  // const router = useRouter();
  // const query = router.query;
  return (
    <Container sx={{ backgroundColor: "lightbrown" }}>
      {/* <QueryResult query={query}/> */}
      <SearchbarMUI />
      <Box>
        <PlantSpecieFamilyGenus plants_data={props.plants_data} />
      </Box>
      <Grid container columns={12} spacing={2}>
        <Grid xs={12} sm={6} md={5} lg={3}>
          <PlantDetailsFeaturesValues
            fruits_data={props.fruits_data}
            plants_data={props.plants_data}
            leaves_data={props.leaves_data}
          />
        </Grid>
        <Grid xs={12} sm={6} md={5} lg={3}>
          <Box>
            <Box sx={{ fontWeight: "bold" }}>Distribtion</Box>
            <KsectorUKFKeyValues
              k_sector_data={props.k_sector_data}
              ukwf_area_data={props.ukwf_area_data}
            />
            <PlantDescriptionMUI plants_data={props.plants_data} />
            <Photos photo_data={props.photo_data} />
          </Box>
        </Grid>
        <Grid xs={12} sm={6} md={5} lg={3}>
          <Box sx={{ fontWeight: "bold" }}>
            Insects reared
            <Coleoptera coleoptera_data={props.coleoptera_data} />
            <Lepidoptera coleoptera_data={props.coleoptera_data} />
            <DipteraTephridiae coleoptera_data={props.coleoptera_data} />
            <OtherDiptera coleoptera_data={props.coleoptera_data} />
            <HymenopteraBraconidae coleoptera_data={props.coleoptera_data} />
            <OtherHymenoptera coleoptera_data={props.coleoptera_data} />
          </Box>
        </Grid>
      </Grid>
    </Container>
  );
}

export async function getStaticPaths(params) {
  //DFetch data for all paths to be rendered statically
  const data = await fetch(
    "http://localhost:3000/api/plants/plantSpecies"
  ).then((res) => res.json());
  //console.log(Array.from(data))
  return {
    //paths-array of URL paths that shoudl be statically generated during build time
    fallback: false,
    paths: Array.from(data).map((specie) => ({
      params: {
        //species1:specie.genus_name + ' ' +specie.species_name, //Team is the dynamic page file name
        speciesName: specie.species_name,
      }, //Team is the dynamic page file name
    })),
  };
}
export async function getStaticProps(context) {
  console.log("context.params");

  const species = context.params.speciesName;
  //Featch plants data from API
  const plant = await fetch(
    "http://localhost:3000/api/plants/plantdetails/" + species
  );
  const plants_data = await plant.json();
  console.log("plants_data serverside");
  console.log(plants_data);

  //Fetch fruits data from API
  const fruit = await fetch(
    "http://localhost:3000/api/plants/fruitdetails/" + species
  );
  const fruits_data = await fruit.json();
  console.log("fruits data serverside");
  console.log(fruits_data);

  //Fetch photos data from API
  const photo = await fetch(
    "http://localhost:3000/api/plants/plantphoto/" + species
  );
  const photo_data = await photo.json();
  console.log("photo data serverside");
  console.log(photo);
  //Fetch leaf data from  API
  const leaf = await fetch(
    "http://localhost:3000/api/plants/leafdetails/" + species
  );
  const leaves_data = await leaf.json();
  console.log("leaf data serverside");
  console.log(leaves_data);

  // Fetch k sector data
  const ksector = await fetch(
    "http://localhost:3000/api/plants/ksectordetails/" + species
  );
  const k_sector_data = await ksector.json();
  console.log("ksector_data server side");
  console.log(k_sector_data);

  // Fetch ukwf area data
  // Fetch k sector data
  const ukwf = await fetch(
    "http://localhost:3000/api/plants/ukwfareadetails/" + species
  );
  const ukwf_area_data = await ukwf.json();
  console.log("ukwf_area_data serverside");
  console.log(ukwf_area_data);

  // fetch coleoptera data
  const dip_teph = await fetch(
    "http://localhost:3000/api/plants/insectsReared/DipteraTephrideae/" +
      species
  );
  const diptera_tephritideae_data = await dip_teph.json();
  console.log("diptera_tephritideae_data serverside");
  console.log(diptera_tephritideae_data);

  // fetch lepidoptera_data data
  const lep = await fetch(
    "http://localhost:3000/api/plants/insectsReared/Lepidoptera/" + species
  );
  const lepidoptera_data = await lep.json();
  console.log("lepidoptera_data serverside");
  console.log(lepidoptera_data);

  // fetch coleoptera data
  const col = await fetch(
    "http://localhost:3000/api/plants/insectsReared/Coleoptera/" + species
  );
  const coleoptera_data = await col.json();
  console.log("coleoptera_data serverside");
  console.log(coleoptera_data);

  // fetch coleoptera data
  const other_dip = await fetch(
    "http://localhost:3000/api/plants/insectsReared/OtherDiptera/" + species
  );
  const other_diptera_data = await other_dip.json();
  console.log("other_diptera_data serverside");
  console.log(other_diptera_data);

  // fetch coleoptera data
  const hym_opin = await fetch(
    "http://localhost:3000/api/plants/insectsReared/HymenopteraBraconidaeOpiina/" +
      species
  );
  const hymenoptera_bracon_opiinae_data = await hym_opin.json();
  console.log("hymenoptera_bracon_opiinae_data serverside");
  console.log(hymenoptera_bracon_opiinae_data);

  // fetch coleoptera data
  const other_hym = await fetch(
    "http://localhost:3000/api/plants/insectsReared/OtherHymenoptera/" + species
  );
  const other_hymenoptera_data = await other_hym.json();
  console.log("other_hymenoptera_data serverside");
  console.log(other_hymenoptera_data);

  return {
    props: {
      plants_data,
      fruits_data,
      photo_data,
      leaves_data,
      k_sector_data,
      ukwf_area_data,
      coleoptera_data,
      lepidoptera_data,
      diptera_tephritideae_data,
      other_diptera_data,
      hymenoptera_bracon_opiinae_data,
      other_hymenoptera_data,
    },
  };
}
