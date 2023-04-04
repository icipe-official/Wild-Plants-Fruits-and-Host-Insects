import Grid from "@mui/material/Grid";
// import PlantDetailValues from "components/plants/Plant/plantDetailValuesMUI"
// import FruitDetailsFeaturesValues from "components/plants/plantFruitLeafValues"
// import LeafDetailValues from "components/plants/Leaf/leafDetailValues"
import Photos from "components/plants/photos/photos";
import Photostrial from "components/plants/photos/photo2";
import SearchbarMUI from "components/plants/FamilyGenusSpecies/PlantGenusFamilySearchbar";
// import FruitDetails from "components/plants/fruitdetailsMUI"
import FruitDetailsFeaturesValues from "components/plants/plantFruitLeafValues";
import { Container, Box } from "@mui/material";
import PlantSpecieFamilyGenus from "components/plants/plantSpeciesFamily";
import KsectorUKWFValues from "components/plants/distribution/KsectorukwfValues";
import PlantDescriptioncomponent from "components/plants/description";
import { useMediaQuery } from "@mui/material";
import OpenLayersMap from "components/plants/distribution/map";

// import Coleoptera from "components/plants/insectsRared/Coleoptera"
// import Lepidoptera from "components/plants/insectsRared/Lepidoptera"
// import DipteraTephridiae from "components/plants/insectsRared/dipteraTephridiae"
// import OtherDiptera from "components/plants/insectsRared/otherDiptera"
// import HymenopteraBraconidae from "components/plants/insectsRared/hymenopteraBraconidae"
// import OtherHymenoptera from "components/plants/insectsRared/otherHymenoptera"
// import QueryResult from "pages/multipleentry/[query]"
import dynamic from "next/dynamic";
import { useRouter } from "next/router";
import { useState, useEffect } from "react";
import InsectsReared from "components/plants/insectsRared/insects";

//Dynamic imports to avoid hydration error. ensure serverdide and client side rendering are the same
// const Coleoptera = dynamic(
//   () => import("components/plants/insectsRared/insects"),
//   {
//     ssr: false,
//   }
// );

export default function PlantPage(props) {
  const [data, setData] = useState([]);
  const [loaded, setLoaded] = useState(false);
  const [error, setError] = useState(null);
  const [isLoading, setIsLoading] = useState(true); // add state variable to track loading status
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));

  // const router = useRouter();
  // const query = router.query;
  return (
    <Container>
      <FruitDetailsFeaturesValues />
    </Container>
  );
}
