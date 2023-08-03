import { Box, Container, useMediaQuery } from "@mui/material";
import Grid from "@mui/material/Grid";
import { makeStyles } from "@mui/styles";
import { useState, useEffect, useContext } from "react";
import { useRouter } from "next/router";
import useSWR from "swr";
import { TreeView, TreeItem } from "@mui/lab";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import ChevronRightIcon from "@mui/icons-material/ChevronRight";
import FruitDetailValues from "./Fruit/fruitDetailValues";
import KsectorValues from "./distribution/KsectorValues";
import PlantDescription from "./plantDescriptionCard";
import PhotosComponent from "./photos/photosmain";
import OpenLayersMap from "./distribution/map";
import InsectsRearedfromPlants from "./insectsRared/insects";
import PlantSpecieFamilyGenus from "./plantSpeciesFamily";
import PlantDetailValues from "./Plant/plantDetailValuesMUI";
import LeafDetailValues from "./Leaf/leafDetailValues";
import { Description } from "@mui/icons-material";

const useStyles = makeStyles({
  root: {
    display: "row",
  },
});

const fetcher = (url) => fetch(url).then((r) => r.json());

export default function PlantDetailsFeaturesValues() {
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("md"));
  const [selectedNode, setSelectedNode] = useState(null);
  const handleNodeSelect = (event, nodeId) => {
    setSelectedNode(nodeId);
  };
  const [state, setState] = useState({});
  const handleStateUpdate = (updatedState) => {
    setState(updatedState);
  };

  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
  const router = useRouter();
  const species =
    typeof router.query.species !== "undefined" ? router.query.species : null;
  const classes = useStyles();

  const { data, error } = useSWR(
    `${base_url}/api/plants/plantsPage/${species}`,
    fetcher
  );

  useEffect(() => {
    if (error) {
      // Handle error
    }
  }, [error]);

  if (!data) {
    return (
      <Container
        sx={{
          backgroundColor: "lightbrown",
          overflowY: "scroll",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          height: "100%",
          paddingBottom: "65%",
        }}
      >
        <Box sx={{ marginTop: 12 }}>Loading...</Box>
      </Container>
    );
  }

  // const coordinates = data.map((specie) =>
  //   specie.plants_regions.map((region) => {
  //     const latitude = parseFloat(region.regions.latitude);
  //     const longitude = parseFloat(region.regions.longitude);
  //     return [longitude, latitude];
  //   })
  // );
  const coordinates = data.map((specie) =>
    specie.plant_coordinates.map((region) => {
      const latitude = parseFloat(region.latitude);
      const longitude = parseFloat(region.longitude);
      return [longitude, latitude];
    })
  );
  console.log(" plant coordinates");

  console.log(data);
  return (
    <Container
      sx={{
        backgroundColor: "lightbrown",
        overflowY: "scroll",
        justifyContent: "space-between",
      }}
    >
      <PlantSpecieFamilyGenus />
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

            <TreeItem nodeId="15" label="Image">
              <PhotosComponent photos_data={data} selectedIndex={0} />
            </TreeItem>
            <TreeItem nodeId="12" label="Map">
              <OpenLayersMap coordinates={coordinates} />
            </TreeItem>
            <TreeItem nodeId="19" label="Insects Reared">
              <InsectsRearedfromPlants />
            </TreeItem>

            <TreeItem nodeId="23" label="Description">
              <PlantDescription plants_data={data} />
            </TreeItem>
          </TreeView>
        ) : (
          <Grid container>
            <Grid item xs={12} sm={6} md={5} lg={3}>
              <Box className={classes.root} sx={{ marginTop: 2 }}>
                <Box sx={{ marginBottom: 2 }}>
                  <PlantDetailValues plants_data={data} />
                </Box>
                <Box sx={{ marginBottom: 2 }}>
                  <LeafDetailValues leaves_data={data} />
                </Box>
                <Box sx={{ marginBottom: 2 }}>
                  <FruitDetailValues fruits_data={data} />
                </Box>
              </Box>
            </Grid>
            <Grid item xs={12} sm={6} md={5} lg={4}>
              <Box sx={{ marginLeft: 0 }}>
                <PhotosComponent photos_data={data} selectedIndex={0} />
                <PlantDescription />
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
        )}
      </Box>
    </Container>
  );
}
