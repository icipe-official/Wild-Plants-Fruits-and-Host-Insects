import { Box, Container, useMediaQuery } from "@mui/material";
import Grid from "@mui/material/Grid";
import { makeStyles } from "@mui/styles";
import { useState, useEffect, useContext } from "react";
import { useRouter } from "next/router";
// import { TreeView, TreeItem } from "@mui/lab";
import { TreeItem, TreeView } from "@mui/x-tree-view";
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
const useStyles = makeStyles({
  root: {
    display: "row",
  },
});

export default function PlantFirstPage() {
  const data = [
    {
      id: 1,
      species_name: "hirtum (Lam.) Sweet",
      max_latitude: 1350,
      min_latitude: 1,
      plant_description: "nan",
      leaf_type: "Simple",
      plant_genera: {
        genus_name: "Abutilon",
      },
      plant_families: {
        family_name: "Malvaceae",
      },
      plants_woody_herbaceous: [
        {
          back_id: 3,
          woody_herbaceous: {
            type_of_stem: "Woody",
          },
        },
      ],
      plants_latex: [
        {
          fruit_latex_id: 1,
          latex: {
            latex_description: "Absent",
          },
        },
      ],
      plants_spines_thorns: [
        {
          thorn_id: 3,
          spines_thorns: {
            thorns_spines: "Absent",
          },
        },
      ],
      plants_shrub_climbings: [
        {
          shrub_id: 5,
          shrub_climbings: {
            tree_type: "Herb",
          },
        },
        {
          shrub_id: 8,
          shrub_climbings: {
            tree_type: "Shrub",
          },
        },
      ],
      plants_leaf_margins: [
        {
          leaf_margin_id: 4,
          leaf_margins: {
            type_of_leaf_margin: "Serrate",
          },
        },
        {
          leaf_margin_id: 9,
          leaf_margins: {
            type_of_leaf_margin: "Crenate",
          },
        },
      ],
      plants_leaf_arrangements: [
        {
          leaf_arrangement_id: 3,
          leaf_arrangements: {
            arrangement: "Alternate",
          },
        },
      ],
      plants_fruit_types: [
        {
          fruit_type_id: 2,
          fruit_types: {
            type_of_fruit: "Multiple",
          },
        },
      ],
      plants_fruit_colors: [
        {
          color_id: 5,
          fruit_colors: {
            color: "Green",
          },
        },
      ],
      plants_fruit_shapes: [
        {
          fruit_shape_id: 6,
          fruit_shapes: {
            shape: "Cylindrical",
          },
        },
      ],
      plant_coordinates: [
        {
          latitude: "0.83835",
          longitude: "37.44605",
        },
      ],
      plants_fruit_sizes: [
        {
          fruit_size_id: 3,
          fruit_sizes: {
            size: "15-25 mm",
          },
        },
      ],
      plants_fruiting_months: [
        {
          fruiting_month_id: 1,
          fruiting_months: {
            month: "Feb",
          },
        },
      ],
      plants_ukwf_areas: [
        {
          ukwf_area_id: 5,
          ukwf_areas: {
            ukwf_area: "Unknown",
          },
        },
      ],
      plants_k_sectors: [
        {
          k_sector_id: 1,
          k_sectors: {
            sector: "1",
          },
        },
        {
          k_sector_id: 2,
          k_sectors: {
            sector: "2",
          },
        },
        {
          k_sector_id: 3,
          k_sectors: {
            sector: "3",
          },
        },
        {
          k_sector_id: 4,
          k_sectors: {
            sector: "4",
          },
        },
        {
          k_sector_id: 6,
          k_sectors: {
            sector: "6",
          },
        },
        {
          k_sector_id: 7,
          k_sectors: {
            sector: "7",
          },
        },
      ],
      plants_photos: [
        {
          photo_name: "01780.jpg",
        },
        {
          photo_name: "01781.jpg",
        },
        {
          photo_name: "01782.jpg",
        },
      ],
      plants_regions: [
        {
          regions: {
            latitude: "0.4612",
            longitude: "39.6401",
          },
        },
      ],
    },
  ];

  // console.log(data);
  // const data = DataFirstpage;
  // const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));
  const isSmallScreen = useMediaQuery(`(max-width: 1282px)`);

  const [selectedNode, setSelectedNode] = useState(null);
  const handleNodeSelect = (event, nodeId) => {
    setSelectedNode(nodeId);
  };
  const [state, setState] = useState({});
  const handleStateUpdate = (updatedState) => {
    setState(updatedState);
  };

  const router = useRouter();
  const species = router.query.species || null;
  const classes = useStyles();
  // const contextValue = useContext(PlantFamilyGenusSpecies);

  // const router = useRouter();
  // const query = router.query;
  const coordinates = data.map((specie) =>
    specie.plant_coordinates.map((region) => {
      const latitude = parseFloat(region.latitude);
      const longitude = parseFloat(region.longitude);
      return [longitude, latitude];
    })
  );

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
        <Grid container>
          <Grid item xs={12} sm={6} md={5} lg={3}>
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
          <Grid item xs={12} sm={6} md={5} lg={4}>
            <Box sx={{ marginLeft: 0 }}>
              <PhotosComponent photos_data={data} selectedIndex={0} />
              <Box sx={{ fontWeight: "bold", marginTop: 2 }}>
                Regions collected
              </Box>
              <OpenLayersMap coordinates={coordinates} />
            </Box>
          </Grid>
          <Grid item xs={12} sm={6} md={5} lg={5}>
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
      </Box>
    </Container>
  );
}
