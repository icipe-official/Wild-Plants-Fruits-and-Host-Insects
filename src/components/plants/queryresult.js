import { useState, useEffect } from "react";
import Router, { useRouter } from "next/router";
import Box from "@mui/material/Box";
import { Container, ButtonBase, Button } from "@mui/material";
import Link from "next/link";
import useSWR from "swr";
import Grid from "@mui/material/Grid";
import insectQueryresult from "./insectQueryresult";
import PlantDetailsFeaturesValues from "./plantFruitsLeafMultipleEntry";
import PlantDetailValues from "./Plant/plantDetailValuesMUI";
import FruitDetailValues from "./Fruit/fruitDetailValues";
import PlantSpecieFamilyGenusResult from "./plantSpeciesFamilyResult";
import LeafDetailValues from "./Leaf/leafDetailValues";
import KsectorValues from "./distribution/KsectorValues";
import UKWFValues from "./distribution/ukwfareas/ukwfvalues";
import PlantDescription from "./plantDescriptionCard";
import PhotosComponent from "./photos/photosmain";
import InsectsReared from "./insectsRared/insectsreared";
import Insectspecies from "./specieslist";
import { makeStyles } from "@mui/styles";
import OpenLayersMap from "./distribution/map";
import InsectsRearedfromPlants from "./insectsRared/insects";
import { returnOrUpdate } from "ol/extent";
const useStyles = makeStyles({
  root: {
    display: "row",
  },
});

export default function QueryResult({ query_data }) {
  const router = useRouter();
  const d = router.query.query;
  const [selectedIndex, setSelectedIndex] = useState(0);
  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
  const classes = useStyles();
  const [selectedSpeciesId, setSelectedSpeciesId] = useState("");
  // const handleSpeciesSelect = (selectedSpecies) => {
  //   setSelectedSpeciesId(selectedSpecies.id);
  // };
  const handleSpeciesSelect = (selectedSpecies, index) => {
    setSelectedSpeciesId(selectedSpecies.id);
    // setSelectedIndex(index);
  };
  const [showErrorMessage, setShowErrorMessage] = useState(false);
  const fetcher = (url) => fetch(url).then((r) => r.json());

  const { data: species_list, error: species_error } = useSWR(
    `${base_url}/api/multipleEntry/multipleentry?filters=${d}`,
    fetcher
  );

  const { data: species_list1, error: species_error1 } = useSWR(
    selectedSpeciesId
      ? `${base_url}/api/plants/plantsPage/${selectedSpeciesId}`
      : null,
    fetcher
  );

  const { data: insectsreared, error: insects_error } = useSWR(
    selectedSpeciesId
      ? `${base_url}/api/plants/Allinsectsreared/${selectedSpeciesId}`
      : null,
    fetcher
  );

  useEffect(() => {
    if (species_list?.length > 0 && species_list?.length > 0) {
      setSelectedSpeciesId(species_list[0].id);
    }
  }, [species_list]);

  const isLoading =
    !species_list ||
    species_list.length === 0 ||
    !species_list1 ||
    !insectsreared;

  if (species_error || species_error1 || insects_error) {
    return (
      <Container
        sx={{
          backgroundColor: "lightbrown",
          overflowY: "scroll",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          height: "100%",
          paddingBottom: "65%", // Adjust this value to create space for the footer
        }}
      >
        {/* Content goes here */}
        <Box sx={{ marginTop: 6 }}>Failed to load</Box>;
      </Container>
    );
  }
  //handle case when there is no data returned
  if (species_list?.length === 0) {
    const errorMessage = "No data found";
    const queryParams = new URLSearchParams({ error: errorMessage });
    router.push(`/multipleentry?${queryParams}`);
  }
  const coordinates = species_list1?.map((specie) =>
    specie.plants_regions.map((region) => {
      const latitude = parseFloat(region.regions.latitude);
      const longitude = parseFloat(region.regions.longitude);
      return [longitude, latitude];
    })
  );
  // console.log(species_list);
  if (species_list?.length > 0) {
    return (
      <Grid container columns={12} marginTop={8}>
        <Grid item xs={12} md={6}>
          <Insectspecies
            data={species_list}
            onSpeciesSelect={handleSpeciesSelect}
          />
        </Grid>
        <Grid item xs={12} md={6} marginTop={4} marginLeft={0}>
          <PlantSpecieFamilyGenusResult plants_data={species_list1} />
        </Grid>
        <Grid container>
          <Grid item xs={12} sm={6} md={5} lg={3}>
            <Box className={classes.root} sx={{ marginTop: 2 }}>
              <Box sx={{ marginBottom: 2 }}>
                <PlantDetailValues plants_data={species_list1} />
              </Box>
              <Box sx={{ marginBottom: 2 }}>
                <LeafDetailValues leaves_data={species_list1} />
              </Box>
              <Box sx={{ marginBottom: 2 }}>
                <FruitDetailValues fruits_data={species_list1} />
              </Box>
            </Box>
          </Grid>
          <Grid item xs={12} sm={6} md={5} lg={4}>
            <Box sx={{ marginLeft: 0 }}>
              <PhotosComponent photos_data={species_list1} selectedIndex={0} />
              <Box sx={{ fontWeight: "bold", marginBottom: 2 }}>
                Regions collected
              </Box>
              <OpenLayersMap coordinates={coordinates} />
            </Box>
          </Grid>
          <Grid item xs={12} sm={6} md={5} lg={5}>
            <Box>
              <Box sx={{ marginLeft: 2, marginTop: 3, marginBottom: 2 }}>
                <Box sx={{ fontWeight: "bold" }}>Insects reared</Box>
                <Box>
                  <InsectsRearedfromPlants />
                </Box>
              </Box>
            </Box>
          </Grid>
        </Grid>
      </Grid>
    );
  }
}
