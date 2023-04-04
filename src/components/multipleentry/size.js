// import Fruitdetails from "components/plants/fruitDetails"
import PlantDetailsFeaturesValues from "components/plants/plantFruitLeafFeatures"
import Photos from "components/plants/photos/photos"
import SearchbarMUI from "components/plants/FamilyGenusSpecies/PlantGenusFamilySearchbar"
// import FruitDetails from "components/plants/fruitdetailsMUI"
import FruitDetailsFeaturesValues from "components/plants/plantFruitLeafValues"
import { Container,Box } from "@mui/material"
import PlantSpecieFamilyGenus from "components/plants/plantSpeciesFamily"
import KsectorUKFKeyValues from "components/plants/ksectorUKWF"
import PlantDescriptionMUI from "components/plants/description"
// // import Coleoptera from "components/plants/insectsRared/Coleoptera"
// import Lepidoptera from "components/plants/insectsRared/Lepidoptera"
// import DipteraTephridiae from "components/plants/insectsRared/dipteraTephridiae"
// import OtherDiptera from "components/plants/insectsRared/otherDiptera"
//import HymenopteraBraconidae from "components/plants/insectsRared/hymenopteraBraconidae"
// import OtherHymenoptera from "components/plants/insectsRared/otherHymenoptera"
import dynamic from 'next/dynamic';
import { useLocation } from "react-router-dom";
export default function ResultPage(props) {
  const {id} = useParams();
  const location = useLocation();
  const query = location.state.query;

  // const data = props.plants_data.find(plant => plant.id === id);
  // console.log(" state")
  // console.log(data)
  // const data2=JSON.stringify(data, null, 2)
  // console.log(data2)
  // const arr = Object.values(data);
  const arr = (query);

  return (
    <Container sx={{ backgroundColor: "lightbrown"}}>
          <Box sx={{padding:4}}>{data.species_name}</Box>
          {/* <div>
      {data ? (
        <div>
          <h1>Data:</h1>
          <pre>{JSON.stringify(data, null, 2)}</pre>
        </div>
      ) : (
        <div>No data found</div>
      )}
    </div> */}
      {/* <SearchbarMUI />
      <Box>
        <PlantSpecieFamilyGenus plants_data={props.plants_data} />
      </Box>
      <Box display="flex">
        <Box>
          <PlantDetailsFeaturesValues />
        </Box>
        <Box>
          <FruitDetailsFeaturesValues
            fruits_data={props.fruits_data}
            plants_data={props.plants_data}
            leaves_data={props.leaves_data}
          />
        </Box>
        <Box>
          <Box sx={{fontWeight:"bold"}}>Distribution</Box>
          <KsectorUKFKeyValues
            k_sector_data={props.k_sector_data}
            ukwf_area_data={props.ukwf_area_data}
          />
          <PlantDescriptionMUI plants_data={props.plants_data} />
          <Photos photo_data={props.photo_data} />
        </Box>
        <Box>
        <Box sx={{fontWeight:"bold"}}>Insects reared</Box>

          <Coleoptera coleoptera_data={props.coleoptera_data}/>
          <Lepidoptera coleoptera_data={props.coleoptera_data}/>
          <DipteraTephridiae coleoptera_data={props.coleoptera_data}/>
          <OtherDiptera coleoptera_data={props.coleoptera_data}/>
          <HymenopteraBraconidae coleoptera_data={props.coleoptera_data}/>
          <OtherHymenoptera coleoptera_data={props.coleoptera_data}/>
   
        </Box>
      </Box>
    </Container>
  );
} */}
    </Container>
)}
