import Grid from "@mui/material/Grid";
// import PlantDetailValues from "components/plants/Plant/plantDetailValuesMUI"
// import FruitDetailsFeaturesValues from "components/plants/plantFruitLeafValues"
// import LeafDetailValues from "components/plants/Leaf/leafDetailValues"
import Photos from "components/plants/photos/photos";
// import FruitDetails from "components/plants/fruitdetailsMUI"
import FruitDetailsFeaturesValues from "components/plants/plantFruitLeafValues";
import { Container, Box } from "@mui/material";
import dynamic from "next/dynamic";
import { useRouter } from "next/router";
import { useState, useEffect } from "react";

// );

export default function PlantPage(props) {
  // const router = useRouter();
  // const query = router.query;
  return (
    <Container>
      <FruitDetailsFeaturesValues />
    </Container>
  );
}
