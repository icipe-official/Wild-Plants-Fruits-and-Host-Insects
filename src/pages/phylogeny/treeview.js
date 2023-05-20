import { TreeView,TreeItem } from '@mui/lab';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore'
import ChevronRightIcon from '@mui/icons-material/ChevronRight'

import LeafDetailValues from 'components/plants/Leaf/leafDetailValues';
import PlantDetailValues from 'components/plants/Plant/plantDetailValuesMUI';
import { Box, Container } from "@mui/material";
import Grid from "@mui/material/Grid";
import FruitDetailValues from 'components/plants/Fruit/fruitDetailValues';
import { makeStyles } from "@mui/styles";
import { useState, useEffect } from "react";
import { useRouter } from "next/router";
import useSWR from "swr";
import { usePlantFeatures } from "service/plantsService";
import KsectorValues from 'components/plants/distribution/KsectorValues';
import UKWFValues from 'components/plants/distribution/ukwfareas/ukwfvalues';
import PlantDescription from 'components/plants/plantDescriptionCard';
import PhotosComponent from 'components/plants/photos/photosmain';
import OpenLayersMap from 'components/plants/distribution/map';
import InsectsRearedfromPlants from 'components/plants/insectsRared/insects';
import PlantFamilyGenusSpecies from 'components/plants/FamilyGenusSpecies/PlantGenusFamilySearchbar';
import PlantSpecieFamilyGenus from 'components/plants/plantSpeciesFamily';
const useStyles = makeStyles({
  root: {
    height: 240,
    flexGrow: 1,
    maxWidth: 400,
  },
});


const fetcher = (url) => fetch(url).then((r) => r.json());

export default function PlantDetailsFeaturesValuesTree() {
  // const [plantsData, setPlantsData] = useState([]);
  // const [loaded, setLoaded] = useState(false);
  // // const [error, setError] = useState(null);
  // // const classes = useStyles();
  // const baseUrl = process.env.NEXT_PUBLIC_API_BASE_URL; cause of error originally
  const base_url = "http://localhost:3000";
  const router = useRouter();
  const species = router.query.species;
  const classes = useStyles();
  console.log("species id");
  console.log(species);
  // const { data, error, isLoading } = usePlantFeatures(species);
  const { data, error, isLoading } = useSWR(
    `${base_url}/api/plantsPage/${species}`,
    fetcher
    // {
    //   revalidateOnMount: false,
    // }
  );

  if (error) return <Box sx={{ marginTop: 6 }}>Failed to load</Box>;
  if (isLoading) return <Box sx={{ marginTop: 6 }}> Loading...</Box>;

  // console.log("plantsData client side");
  // console.log(plantsData);

  if (data && data.length > 0) {

  const classes = useStyles();
  const [selectedNode, setSelectedNode] = useState(null);

  const handleNodeSelect = (event, nodeId) => {
    setSelectedNode(nodeId);
  };

  return (
    <Box sx={{marginTop:4}}>
      <PlantFamilyGenusSpecies />

    <TreeView
      className={classes.root}
      defaultCollapseIcon={<ExpandMoreIcon />}
      defaultExpandIcon={<ChevronRightIcon />}
      selected={selectedNode}
      onNodeSelect={handleNodeSelect}
    >
      <TreeItem nodeId="1" label="Morphological fetures">

      <TreeItem nodeId="2" label="Plant">
          <PlantDetailValues plants_data={data}/>
          {/* <TreeItem nodeId="4" label="Grandchild 2" /> */}
        </TreeItem>

        <TreeItem nodeId="5" label="Fruit">
          <TreeItem nodeId="6" label="Grandchild 1" />
          <TreeItem nodeId="7" label="Grandchild 2" />
        </TreeItem>

        <TreeItem nodeId="8" label="Leaf">
          <TreeItem nodeId="9" label="Grandchild 1" />
          <TreeItem nodeId="10" label="Grandchild 2" />
        </TreeItem>
         </TreeItem>


      <TreeItem nodeId="11" label="Distribution">
        <TreeItem nodeId="12" label="Child 4" />
        <TreeItem nodeId="13" label="Child 5" />
        <TreeItem nodeId="14" label="Child 6" />
      </TreeItem>

    <TreeItem nodeId="15" label="Image">
        <TreeItem nodeId="16" label="Child 4" />
        <TreeItem nodeId="17" label="Child 5" />
        <TreeItem nodeId="18" label="Child 6" />
      </TreeItem>

      <TreeItem nodeId="19" label="Insects Reared">
        <TreeItem nodeId="20" label="Child 4" />
        <TreeItem nodeId="21" label="Child 5" />
        <TreeItem nodeId="22" label="Child 6" />
      </TreeItem>
      </TreeView>

    </Box>
  );
}};

