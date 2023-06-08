import LeafDetailValues from "./Leaf/leafDetailValues";
import PlantDetailValues from "./Plant/plantDetailValuesMUI";
import { Box, Container } from "@mui/material";
import Grid from "@mui/material/Grid";
import FruitDetailValues from "./Fruit/fruitDetailValues";
import { makeStyles } from "@mui/styles";
import { useState, useEffect } from "react";
import { useRouter } from "next/router";
import useSWR from "swr";
import KsectorValues from "./distribution/KsectorValues";
import UKWFValues from "./distribution/ukwfareas/ukwfvalues";
import PlantDescription from "./plantDescriptionCard";
import PhotosComponent from "./photos/photosmain";
import OpenLayersMap from "./distribution/map";
import InsectsRearedfromPlants from "./insectsRared/insects";
import PlantFamilyGenusSpecies from "./FamilyGenusSpecies/PlantGenusFamilySearchbar";
import PlantSpecieFamilyGenus from "./plantSpeciesFamily";
import { useMediaQuery } from "@mui/material";
import { TreeView, TreeItem } from "@mui/lab";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import ChevronRightIcon from "@mui/icons-material/ChevronRight";
// import PlantFamilyGenusSpecies from "./FamilyGenusSpecies/PlantGenusFamilySearchbar";
import { useContext } from "react";
import Footer from "components/footer/footer";
const useStyles = makeStyles({
  root: {
    display: "row",
  },
});
const fetcher = (url) => fetch(url).then((r) => r.json());

export default function PlantDetailsFeaturesValues() {
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));
  const [selectedNode, setSelectedNode] = useState(null);
  const handleNodeSelect = (event, nodeId) => {
    setSelectedNode(nodeId);
  };
  const [state, setState] = useState({});
  const handleStateUpdate = (updatedState) => {
    setState(updatedState);
  };
  //maintain state of plants page
  // const [plantsData, setPlantsData] = useState([]);
  // const [loaded, setLoaded] = useState(false);
  // // const [error, setError] = useState(null);
  // // const classes = useStyles();
  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
  // const base_url = "http://localhost:3000";
  const router = useRouter();
  const species = router.query.species ? router.query.species : null; //only if url
  const classes = useStyles();
  console.log("species id");
  console.log(species);
  const contextValue = useContext(PlantFamilyGenusSpecies);
  console.log("contextValue");

  // const { data, error, isLoading } = usePlantFeatures(species);
  const { data, error, isLoading } = useSWR(
    `${base_url}/api/plants/plantsPage/${species}`,
    fetcher
  );

  if (error)
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

  if (isLoading)
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
        <Box sx={{ marginTop: 12 }}>Loading...</Box>
        {/* Footer goes here */}
      </Container>
    );
  // console.log("plantsData client side");
  // console.log(plantsData);

  if (data && data.length > 0) {
    //extract coordinates
    const coordinates = data.map((specie) =>
      specie.plants_regions.map((region) => {
        const latitude = parseFloat(region.regions.latitude);
        const longitude = parseFloat(region.regions.longitude);
        return [longitude, latitude];
      })
    );
    console.log("coordinates");
    console.log(
      coordinates.map((c) => {
        return c;
      })
    );
    if (data) {
      console.log("contextValue yyyy");

      console.log(contextValue);

      return (
        <Container
          sx={{
            backgroundColor: "lightbrown",
            overflowY: "scroll",
            // display: flex;
            justifyContent: "space-between",
          }}
        >
          {/* <PlantFamilyGenusSpecies
          // state={state}
          // onStateUpdate={handleStateUpdate}
          /> */}
          {/* <Box sx={{ marginTop: 6 }}>contextValue</Box>; */}{" "}
          <PlantSpecieFamilyGenus h />
          <Box>
            {isSmallScreen ? (
              <TreeView
                className={classes.root}
                defaultCollapseIcon={<ExpandMoreIcon />}
                defaultExpandIcon={<ChevronRightIcon />}
                selected={selectedNode}
                onNodeSelect={handleNodeSelect}
              >
                <TreeItem nodeId="1" label="Morphological Features">
                  <TreeItem nodeId="2" label="Plant">
                    <PlantDetailValues plants_data={data} />
                    {/* <TreeItem nodeId="4" label="Grandchild 2" /> */}
                  </TreeItem>

                  <TreeItem nodeId="5" label="Fruit">
                    <FruitDetailValues fruits_data={data} />
                  </TreeItem>

                  <TreeItem nodeId="8" label="Leaf">
                    <LeafDetailValues leaves_data={data} />
                  </TreeItem>
                </TreeItem>

                <TreeItem nodeId="11" label="Distribution">
                  <KsectorValues k_sector_data={data} />
                </TreeItem>
                <TreeItem nodeId="12" label="Map">
                  <OpenLayersMap coordinates={coordinates} />
                </TreeItem>

                <TreeItem nodeId="15" label="Image">
                  <PhotosComponent photos_data={data} selectedIndex={0} />
                </TreeItem>

                <TreeItem nodeId="19" label="Insects Reared">
                  <InsectsRearedfromPlants />
                </TreeItem>

                <TreeItem nodeId="23" label="Description">
                  <PlantDescription plants_data={data} />
                </TreeItem>
              </TreeView>
            ) : (
              <Grid container columns={12}>
                <Grid xs={12} sm={6} md={5} lg={3}>
                  <Box className={classes.root} sx={{ marginTop: 2 }}>
                    <Box>
                      <PlantDetailValues plants_data={data} />
                    </Box>
                    <Box sx={{ padding: 0.5 }}>
                      <LeafDetailValues leaves_data={data} />
                    </Box>
                    <Box sx={{ padding: 0.5 }}>
                      <FruitDetailValues fruits_data={data} />
                    </Box>
                  </Box>
                </Grid>
                <Grid xs={12} sm={6} md={5} lg={4}>
                  <Box sx={{ marginLeft: 0 }}>
                    <Box sx={{ fontWeight: "bold", marginTop: 2 }}>
                      Regions collected
                    </Box>
                    <OpenLayersMap coordinates={coordinates} />

                    {/* <KsectorValues k_sector_data={data} /> */}
                    {/* <UKWFValues ukwf_area_data={data} /> */}
                    {/* <PlantDescription plants_data={data} />  */}
                    <PhotosComponent photos_data={data} selectedIndex={0} />
                  </Box>
                </Grid>
                {/* <Box> */}
                {/* </Box> */}
                <Grid xs={12} sm={6} md={5} lg={5}>
                  <Box>
                    <Box sx={{ marginLeft: 2, marginTop: 3 }}>
                      <Box sx={{ fontWeight: "bold" }}>Insects reared</Box>
                      <Box>
                        <InsectsRearedfromPlants />
                      </Box>
                    </Box>
                  </Box>
                </Grid>
              </Grid>
            )}
          </Box>
          {/* <OpenLayersMap location_data={data} /> */}
        </Container>
      );
    }
  }
}
