import React, { useState } from "react";
import { makeStyles } from "@mui/styles"; // custom component  styles
import {
  Box,
  Button,
  Container,
  FormControl,
  InputLabel,
  useMediaQuery,
} from "@mui/material";
import Link from "next/link";
import Router from "next/router";
import useSWR from "swr";
import PlantFeaturesComponent from "./plantfeatures";
import PlantSpines from "./plantspines";
import Plantlatex from "./plantlatex";
import SubmitClearquery from "./submitclearquey";
import Fruittype from "./fruittype";
import FruitColor from "./fruitcolor";
import FruitShape from "./fruitshape";
import FruitSize from "./fruitsize";
import Leaftype from "./leaftype";
import LeafMargin from "./leafmargin";
import Leafarrangement from "./leafarrangement";
// import { TreeView } from "@mui/lab";
import { TreeView, TreeItem } from "@mui/lab";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import ChevronRightIcon from "@mui/icons-material/ChevronRight";
// custom styless
const useStyles = makeStyles({
  component: {
    height: "220px",
    overflowY: "auto",
    border: "1px solid #ccc",
    borderRadius: "4px",
    width: "100%",
    boxShadow: "2px 2px 2px rgba(0, 0, 0, 0.1)",
    padding: "10px",
    // marginLeft: "0.5rem",
    // marginBottom: "0.5rem",
  },
  component1: {
    height: "220px",
    overflowY: "auto",
    border: "1px solid #ccc",
    borderRadius: "4px",
    width: "100%",
    boxShadow: "2px 2px 2px rgba(0, 0, 0, 0.1)",
    padding: "10px",
    marginLeft: "0.5rem",
    marginBottom: "0.5rem",
  },
  item: {
    cursor: "pointer",
    padding: "5px",
    borderBottom: "1px solid #ccc",
    "&:active": {
      color: "black",
    },
  },
  itemChecked: {
    backgroundColor: "black",
    color: "white",
  },
  horizontalboundary: {
    display: "flex",
    border: "1px solid #ccc",
    borderRadius: "4px",
    width: "100%",
    marginTop: "0.5rem",
    marginBottom: "0.5rem",
  },
});
export default function QuerySelectAdvancedSearch() {
  const [selected, setSelected] = useState(true);
  // const theme=useTheme()
  const classes = useStyles();
  const [loaded, setLoaded] = useState(false);
  // const [error, setError] = useState(null);
  const [query, setQuery] = useState({
    shrub_climbings: [],
    plant_spines: [],
    plant_latex: [],
    fruit_types: [],
    fruit_colors: [],
    fruit_sizes: [],
    fruit_shapes: [],
    leaf_types: [],
    leaf_margins: [],
    leaf_arrangements: [],
  });
  //manage state
  const [checkedStatePlantShrubClimbings, setCheckedStatePlantShrubClimbings] =
    useState([]);
  const [checkedStatePlantSpnines, setCheckedStatePlantSpnines] = useState([]);
  const [checkedStatePlantLatex, setCheckedStatePlantLatex] = useState([]);
  const [checkedStateFruitType, setCheckedStateFruitType] = useState([]);
  const [checkedStateColor, setCheckedStateColor] = useState([]);
  const [checkedStateFruitShape, setCheckedStateFruitShape] = useState([]);
  const [checkedStateSize, setCheckedStateSize] = useState([]);
  const [checkedStateLeafType, setCheckedStateLeafType] = useState([]);
  const [checkedStateLeafMargins, setCheckedStateLeafMargins] = useState([]);
  const [checkedStateLeafArrangement, setCheckedStateLeafArrangement] =
    useState([]);
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));

  // check all options
  const [showAllOptions, setShowAllOptions] = useState(false);

  // Handle data states and select functionality
  const [selectedSpecies, setSelectedSpecies] = useState("");
  const selectSpecieHandler = (value) => setSelectedSpecies(value);
  useState([]);

  //handle small screen tree view
  const [selectedNode, setSelectedNode] = useState(null);

  const handleNodeSelect = (event, nodeId) => {
    setSelectedNode(nodeId);
  };
  // const plant_type_array = ["type1", "type2", "type3"]; // Replace with your own data
  const [selectedPlantTypes, setSelectedPlantTypes] = useState([]);
  const [uniqueColeopteraData, setUniqueColeopteraData] = useState([]);
  // const base_url = "http://localhost:3000";

  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
  const fetcher = (url) => fetch(url).then((r) => r.json());
  const { data, error, isLoading } = useSWR(
    `${base_url}/api/multipleEntry/allmultipleQuery`,
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
  // console.log(data);
  if (data) {
    // fetch(`/api/plantsPage/${species}`)
    // if (error) return <div>Failed to load</div>;
    if (!data) return <div>Loading...</div>;
    console.log("plants data client side");
    // Convert JSON string to JavaScript object
    const plant_data = data.shrub_climbings;

    const plant_type_array = plant_data.map(
      (specie) =>
        // return a list of fruit color
        specie.tree_type
    );
    console.log("plant_type_array");
    console.log(plant_type_array);

    // manage states of checked plant type
    if (
      checkedStatePlantShrubClimbings.length !== data.shrub_climbings.length
    ) {
      setCheckedStatePlantShrubClimbings(
        new Array(data.shrub_climbings.length).fill(false)
      );
    }
    // const plant_type = new Array(plant_type_array.length).fill(false);

    // handle Change events when plant type box is checked
    const handleOnChangePlantShrubClimbings = (position) => {
      const updatedCheckedStatePlantType = checkedStatePlantShrubClimbings.map(
        (item, index) => (position === index ? !item : item)
      );
      setCheckedStatePlantShrubClimbings(updatedCheckedStatePlantType);
      const PlantTypeIndex = updatedCheckedStatePlantType.flatMap(
        (bool, index) => (bool ? index : [])
      ); //extract only true values index
      const len = PlantTypeIndex.length;
      const fr = PlantTypeIndex.map((i) => plant_type_array[i]);
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, shrub_climbings: fr })); //updating state in dictionary
    };

    //plant latex
    // plant spines data data
    console.log("plant_spines_data");
    const spines_data = data.spines;
    console.log(spines_data);
    // console.log(
    //   Array.from(spines_data).map(
    //     (specie) =>
    //       // return a list of fruit shape
    //       specie.latex_description
    //   )
    // );
    // Extract arrays from the query params
    //console.log(fruit_size.fruit_size.fruit_size)
    const plant_spines_array = spines_data.map(
      (specie) =>
        // return a list of fruit color
        specie.thorns_spines
    );
    console.log("plant_spines_array");
    console.log(plant_spines_array);

    // plant spines data data
    console.log("plant_spines_data");

    if (checkedStatePlantSpnines.length !== data.spines.length) {
      setCheckedStatePlantSpnines(new Array(data.spines.length).fill(false));
    }

    // handle Change events when fruit color box is checked
    // manage states of checked fruit shape
    // const [checkedStatePlantSpnines, setCheckedStatePlantSpnines] = useState(
    //   new Array(plant_spines_array.length).fill(false)
    // );

    // handle Change events when fruit color box is checked
    const handleOnChangePlantSpnines = (position) => {
      const updatedCheckedStatePlantSpnines = checkedStatePlantSpnines.map(
        (item, index) => (position === index ? !item : item)
      );
      setCheckedStatePlantSpnines(updatedCheckedStatePlantSpnines);
      const PlantSpninesIndex = updatedCheckedStatePlantSpnines.flatMap(
        (bool, index) => (bool ? index : [])
      ); //extract only true values index
      const len = PlantSpninesIndex.length;
      const fr = PlantSpninesIndex.map((i) => plant_spines_array[i]);
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, plant_spines: fr })); //setting state in dictionary
    };

    console.log("checkedStatePlantSpnines");
    console.log(checkedStatePlantSpnines);

    // manage states of checked plant latex box
    const latex_data = data.latex;
    const plant_latex_array = Array.from(latex_data).map(
      (specie) =>
        // return a list of fruit color
        specie.latex_description
    );

    console.log("latex_data");
    console.log(plant_latex_array);
    //manage state latex
    if (checkedStatePlantLatex.length !== data.latex.length) {
      setCheckedStatePlantLatex(new Array(data.latex.length).fill(false));
    }

    // handle Change events when plant latex box is checked
    const handleOnChangePlantLatex = (position) => {
      const updatedCheckedStatePlantLatex = checkedStatePlantLatex.map(
        (item, index) => (position === index ? !item : item)
      );
      setCheckedStatePlantLatex(updatedCheckedStatePlantLatex);
      const PlantLatexIndex = updatedCheckedStatePlantLatex.flatMap(
        (bool, index) => (bool ? index : [])
      ); //extract only true values index
      const len = PlantLatexIndex.length;
      const fr = PlantLatexIndex.map((i) => plant_latex_array[i]);
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, plant_latex: fr })); //setting state in dictionary
    };

    //Fruit type data
    // fruit type data
    const fruit_type_data = data.fruit_types;
    console.log("fruit_type_data");
    console.log(fruit_type_data);
    console.log(
      fruit_type_data.map(
        (specie) =>
          // return a list of fruit color
          specie.tree_type
      )
    );
    // Extract arrays from the query params
    //console.log(fruit_size.fruit_size.fruit_size)
    const fruit_type_array = fruit_type_data.map(
      (specie) =>
        // return a list of fruit color
        specie.type_of_fruit
    );
    console.log("fruit_type_array");

    console.log(fruit_type_array);

    // manage states of checked fruit type
    if (checkedStateFruitType.length !== data.fruit_types.length) {
      setCheckedStateFruitType(new Array(data.fruit_types.length).fill(false));
    }
    // handle Change events when fruit color box is checked
    const handleOnChangeFruitType = (position) => {
      const updatedCheckedStateFruitType = checkedStateFruitType.map(
        (item, index) => (position === index ? !item : item)
      );
      setCheckedStateFruitType(updatedCheckedStateFruitType);
      const FruitTypeIndex = updatedCheckedStateFruitType.flatMap(
        (bool, index) => (bool ? index : [])
      ); //extract only true values index
      const len = FruitTypeIndex.length;
      const fr = FruitTypeIndex.map((i) => fruit_type_array[i]);
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_types: fr })); //setting state in dictionary
    };

    //fruit size data
    const fruit_size_data = data.fruit_sizes;
    console.log("fruit_size_data");
    console.log(
      fruit_size_data.map(
        (specie) =>
          // return a list of species
          specie.size
      )
    ); // data object with list of dictionaries
    //console.log('fruit_color-data')
    const fruit_size_array = fruit_size_data.map(
      (specie) =>
        // return a list of species
        specie.size
    );

    //manage state of fruit size
    if (checkedStateSize.length !== data.fruit_sizes.length) {
      setCheckedStateSize(new Array(data.fruit_sizes.length).fill(false));
    }
    const fruit_size = new Array(fruit_size_array.length).fill(false);
    // handle change of events when fruit size box is checked
    const handleOnChangeSize = (position) => {
      const updatedCheckedStateSize = checkedStateSize.map((item, index) =>
        index === position ? !item : item
      );
      const fruitSizeIndex = updatedCheckedStateSize.flatMap((bool, index) =>
        bool ? index : []
      ); //extract only true values index
      const len = fruitSizeIndex.length;
      const fr = fruitSizeIndex.map((i) => fruit_size_array[i]);
      setCheckedStateSize(updatedCheckedStateSize);
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_sizes: fr })); //setting state in dictionary
    };
    //fruit color data
    const fruit_color_data = data.fruit_colors;
    // console.log(fruit_color_data).map(
    //   (specie) =>
    //     // return a list of fruit color
    //     specie.color
    // );

    // Extract arrays from the query params
    //console.log(fruit_size.fruit_size.fruit_size)
    const fruit_color_array = fruit_color_data.map(
      (specie) =>
        // return a list of fruit color
        specie.color
    );

    // manage states of checked fruit colors
    if (checkedStateColor.length !== data.fruit_colors.length) {
      setCheckedStateColor(new Array(data.fruit_colors.length).fill(false));
    }

    // handle Change events when fruit color box is checked
    const handleOnChangeColor = (position) => {
      const updatedCheckedStateColor = checkedStateColor.map((item, index) =>
        position === index ? !item : item
      );
      setCheckedStateColor(updatedCheckedStateColor);
      const fruitColorIndex = updatedCheckedStateColor.flatMap((bool, index) =>
        bool ? index : []
      ); //extract only true values index
      const len = fruitColorIndex.length;
      const fr = fruitColorIndex.map((i) => fruit_color_array[i]);
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_colors: fr })); //setting state in dictionary
      // setQuery.fruit[fr]
      //const fruitSizeIndex=checkedStateColor.flatMap((bool,index)=>bool? index:[]) //extract only true values index
      // loop over selected values and append to the list for query
    };

    //Fruit shape data
    const fruit_shape_data = data.fruit_shapes;
    console.log("fruit_shape_data");
    console.log(fruit_shape_data);
    console.log(
      Array.from(fruit_shape_data).map(
        (specie) =>
          // return a list of fruit shape
          specie.tree_type
      )
    );
    // Extract arrays from the query params
    //console.log(fruit_size.fruit_size.fruit_size)
    const fruit_shape_array = Array.from(fruit_shape_data).map(
      (specie) =>
        // return a list of fruit color
        specie.shape
    );
    console.log("fruit_shape_array");
    console.log(fruit_shape_array);

    // manage states of checked fruit shape
    if (checkedStateFruitShape.length !== data.fruit_shapes.length) {
      setCheckedStateFruitShape(
        new Array(data.fruit_shapes.length).fill(false)
      );
    }
    // handle Change events when fruit color box is checked
    const handleOnChangeFruitShape = (position) => {
      const updatedCheckedStateFruitShape = checkedStateFruitShape.map(
        (item, index) => (position === index ? !item : item)
      );
      setCheckedStateFruitShape(updatedCheckedStateFruitShape);
      const FruitShapeIndex = updatedCheckedStateFruitShape.flatMap(
        (bool, index) => (bool ? index : [])
      ); //extract only true values index
      const len = FruitShapeIndex.length;
      const fr = FruitShapeIndex.map((i) => fruit_shape_array[i]);
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_shapes: fr })); //setting state in dictionary
    };

    // Extract arrays from the query params
    //console.log(fruit_size.fruit_size.fruit_size)
    //leaf type data
    const leaf_type_data = data.leaf_types;
    const leaf_type_array = leaf_type_data.map(
      (specie) =>
        // return a list of fruit color
        specie.leaf_type
    );
    console.log("leaf_type_array");
    console.log(leaf_type_array);

    // manage states of checked leaf type
    if (checkedStateLeafType.length !== data.leaf_types.length) {
      setCheckedStateLeafType(new Array(data.leaf_types.length).fill(false));
    }
    const leaf_type = new Array(leaf_type_array.length).fill(false);
    // handle Change events when leaf type  box is checked
    const handleOnChangeLeafType = (position) => {
      const updatedCheckedStateLeafType = checkedStateLeafType.map(
        (item, index) => (position === index ? !item : item)
      );
      setCheckedStateLeafType(updatedCheckedStateLeafType);
      const LeafTypeIndex = updatedCheckedStateLeafType.flatMap((bool, index) =>
        bool ? index : []
      ); //extract only true values index
      const len = LeafTypeIndex.length;
      const fr = LeafTypeIndex.map((i) => leaf_type_array[i]);
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, leaf_types: fr })); //setting state in dictionary
    };

    // plant leaf margin data data
    const leaf_margin_data = data.leaf_margins;
    console.log("leaf_margins_data");

    console.log(leaf_margin_data);
    console.log(
      Array.from(leaf_margin_data).map(
        (specie) =>
          // return a list of fruit shape
          specie.type_of_leaf_margin
      )
    );
    // Extract arrays from the query params
    //console.log(fruit_size.fruit_size.fruit_size)
    const leaf_margins_array = Array.from(leaf_margin_data).map(
      (specie) =>
        // return a list of fruit color
        specie.type_of_leaf_margin
    );
    console.log("leaf_margins_array");
    console.log(leaf_margins_array);

    // manage states of checked leaf margin boxes
    if (checkedStateLeafMargins.length !== data.leaf_margins.length) {
      setCheckedStateLeafMargins(
        new Array(data.leaf_margins.length).fill(false)
      );
    }

    // handle Change events when leaf margin box is checked
    const handleOnChangeLeafMargins = (position) => {
      const updatedCheckedStateLeafMargins = checkedStateLeafMargins.map(
        (item, index) => (position === index ? !item : item)
      );
      setCheckedStateLeafMargins(updatedCheckedStateLeafMargins);
      const LeafMarginsIndex = updatedCheckedStateLeafMargins.flatMap(
        (bool, index) => (bool ? index : [])
      ); //extract only true values index
      const len = LeafMarginsIndex.length;
      const fr = LeafMarginsIndex.map((i) => leaf_margins_array[i]);
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, leaf_margins: fr })); //setting state in dictionary
    };

    // plant leaf arrangement data data
    const leaf_arrangement_data = data.leaf_arrangements;
    console.log("leaf_arrangement_data");

    console.log(leaf_arrangement_data);
    console.log(
      Array.from(leaf_arrangement_data).map(
        (specie) =>
          // return a list of leaf arrangement
          specie.arrangement
      )
    );
    // Extract arrays from the query params
    //console.log(fruit_size.fruit_size.fruit_size)
    const leaf_arrangement_array = Array.from(leaf_arrangement_data).map(
      (specie) =>
        // return a list of fruit color
        specie.arrangement
    );
    console.log("leaf_arrangement_array");
    console.log(leaf_arrangement_array);

    // manage states of checked leaf arrangement
    if (checkedStateLeafArrangement.length !== data.leaf_arrangements.length) {
      setCheckedStateLeafArrangement(
        new Array(data.leaf_arrangements.length).fill(false)
      );
    }
    const arrange = new Array(leaf_arrangement_array.length).fill(false);

    // handle Change events when fruit color box is checked
    const handleOnChangeLeafArrangement = (position) => {
      const updatedCheckedStateLeafArrangement =
        checkedStateLeafArrangement.map((item, index) =>
          position === index ? !item : item
        );
      setCheckedStateLeafArrangement(updatedCheckedStateLeafArrangement);
      const LeafArrangementIndex = updatedCheckedStateLeafArrangement.flatMap(
        (bool, index) => (bool ? index : [])
      ); //extract only true values index
      const len = LeafArrangementIndex.length;
      const fr = LeafArrangementIndex.map((i) => leaf_arrangement_array[i]);
      setQuery((prevQueryInfo) => ({
        ...prevQueryInfo,
        leaf_arrangements: fr,
      })); //setting state in dictionary
    };

    // handle Query function
    const handleData = () => {
      if (
        query.shrub_climbings.length === 0 &&
        query.plant_latex.length === 0 &&
        query.fruit_shapes.length === 0 &&
        query.fruit_colors.length === 0 &&
        query.fruit_sizes.length === 0 &&
        query.leaf_types.length === 0 &&
        query.fruit_types.length === 0 &&
        query.plant_spines.length === 0 &&
        query.leaf_margins.length === 0 &&
        query.leaf_arrangements.length === 0
      ) {
        return "No query param selected";
      } else {
        const i = JSON.stringify(query);
        // Set the data in the store
        // const data = result.map((r) => r.species_name);
        Router.push({
          pathname: "/multipleentry/query",
          query: { query: i },
        });
      }
    };

    // handle change of events when user cancels selections
    const handleCancel = () => {
      //states for check box
      setCheckedStateColor(new Array(fruit_color_array.length).fill(false));
      setCheckedStateSize(new Array(fruit_size_array.length).fill(false));
      setCheckedStatePlantShrubClimbings(
        new Array(plant_type_array.length).fill(false)
      );
      setCheckedStateFruitType(new Array(fruit_type_array.length).fill(false));
      setCheckedStateFruitShape(
        new Array(fruit_shape_array.length).fill(false)
      );
      // setCheckedStatePlantType(new Array(plant_type_array.length).fill(false));
      setCheckedStateLeafType(new Array(leaf_type_array.length).fill(false));
      setCheckedStatePlantLatex(
        new Array(plant_latex_array.length).fill(false)
      );
      setCheckedStatePlantSpnines(
        new Array(plant_spines_array.length).fill(false)
      );
      setCheckedStateLeafMargins(
        new Array(leaf_margins_array.length).fill(false)
      );
      setCheckedStateLeafArrangement(
        new Array(leaf_arrangement_array.length).fill(false)
      );
      //states for query
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, plant_types: [] })); //setting state in dictionary
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, plant_latex: [] })); //setting state in dictionary
      // setQuery(prevQueryInfo => ({...prevQueryInfo,plant_thorns:[]})) //setting state in dictionary
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_colors: [] })); //setting state in dictionary
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_shapes: [] })); //setting state in dictionary
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_sizes: [] })); //setting state in dictionary
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_types: [] })); //setting state in dictionary
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, leaf_types: [] })); //setting state in dictionary
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, leaf_margins: [] })); //setting state in dictionary
      setQuery((prevQueryInfo) => ({
        ...prevQueryInfo,
        leaf_arrangements: [],
      })); //setting state in dictionary
      setQuery((prevQueryInfo) => ({ ...prevQueryInfo, plant_spines: [] })); //setting state in dictionary

      // setData([]);
    };

    const Transfer = () => {
      <Link
        href={{
          pathname: "/multipleentry/query",
          query: data, // the data
        }}
      ></Link>;
    };

    const mainFunction = (event) => {
      handleData(event);
      Transfer(event);
    };
    console.log("query");
    console.log(query);
    console.log("JSON.stringfy(query)");
    console.log(JSON.stringify(query));
    const j = JSON.stringify(query);
    console.log("/api/plants/multipleEntry/multipleentry?filters=" + j);
    //console.log(checkedStateSize)
    console.log("checkedStateColor");
    console.log(checkedStateColor);
    // console.log(query)
    // console.log('fruit_size_array')
    // console.log(fruit_size_array)
    console.log("query");
    console.log(query);
    //console.log(fr)
    //console.log('data')
    console.log(Array.from(data));
    console.log("data");
    console.log(data);
    console.log(selectedSpecies);

    const handle = () => {
      //states for check box

      setCheckedStateLeafArrangement(
        new Array(leaf_arrangement_array.length).fill(false)
      );
    }; //states for query}
    //extract species name
    // console.log(selectedSpecies.split(' ').slice(1, ).join(' '))// split with space, splice to get species name
    // console.log('/plants/prisma_api/'+ selectedSpecies.split(' ').slice(1, ).join(' '))// split with space, splice to get species name

    const handlePlantTypeChange = (event) => {
      setSelectedPlantTypes(event.target.value);
    };

    return (
      <Container sx={{ marginTop: 8 }}>
        {isSmallScreen ? (
          <>
            <SubmitClearquery
              handleCancel={handleCancel}
              handleData={handleData}
            />

            <Box marginTop={4} marginBottom={2}>
              Plants and Fruits data
              <TreeView
                className={classes.root}
                defaultCollapseIcon={<ExpandMoreIcon />}
                defaultExpandIcon={<ChevronRightIcon />}
                selected={selectedNode}
                onNodeSelect={handleNodeSelect}
              >
                <TreeItem nodeId="1" label="Plant type">
                  <PlantFeaturesComponent
                    plant_type_array={plant_type_array}
                    checkedStatePlantShrubClimbings={
                      checkedStatePlantShrubClimbings
                    }
                    handleOnChangePlantShrubClimbings={
                      handleOnChangePlantShrubClimbings
                    }
                  />
                  {/* <TreeItem nodeId="4" label="Grandchild 2" /> */}
                </TreeItem>

                <TreeItem nodeId="5" label="Spines">
                  <PlantSpines
                    plant_spines_array={plant_spines_array}
                    checkedStatePlantSpnines={checkedStatePlantSpnines}
                    handleOnChangePlantSpnines={handleOnChangePlantSpnines}
                  />
                </TreeItem>

                <TreeItem nodeId="8" label="Latex">
                  <Plantlatex
                    plant_latex_array={plant_latex_array}
                    checkedStatePlantLatex={checkedStatePlantLatex}
                    handleOnChangePlantLatex={handleOnChangePlantLatex}
                  />
                </TreeItem>

                <TreeItem nodeId="29" label="Fruit Type">
                  <Fruittype
                    fruit_type_array={fruit_type_array}
                    checkedStateFruitType={checkedStateFruitType}
                    handleOnChangeFruitType={handleOnChangeFruitType}
                  />
                </TreeItem>

                <TreeItem nodeId="12" label="Fruit Color">
                  <FruitColor
                    fruit_color_array={fruit_color_array}
                    checkedStateColor={checkedStateColor}
                    handleOnChangeColor={handleOnChangeColor}
                  />
                </TreeItem>

                <TreeItem nodeId="15" label="Fruit Shape">
                  <FruitShape
                    fruit_shape_array={fruit_shape_array}
                    checkedStateFruitShape={checkedStateFruitShape}
                    handleOnChangeFruitShape={handleOnChangeFruitShape}
                  />
                </TreeItem>

                <TreeItem nodeId="19" label="Fruit Size">
                  <FruitSize
                    fruit_size_array={fruit_size_array}
                    checkedStateSize={checkedStateSize}
                    handleOnChangeSize={handleOnChangeSize}
                  />
                </TreeItem>

                <TreeItem nodeId="30" label="Leaf type">
                  <Leaftype
                    leaf_type_array={leaf_type_array}
                    checkedStateLeafType={checkedStateLeafType}
                    handleOnChangeLeafType={handleOnChangeLeafType}
                  />
                </TreeItem>

                <TreeItem nodeId="49" label="Leaf arrangement">
                  <Leafarrangement
                    leaf_arrangement_array={leaf_arrangement_array}
                    checkedStateLeafArrangement={checkedStateLeafArrangement}
                    handleOnChangeLeafArrangement={
                      handleOnChangeLeafArrangement
                    }
                  />
                </TreeItem>
              </TreeView>
            </Box>
          </>
        ) : (
          <Box>
            <Box sx={{ display: isSmallScreen ? "row" : "flex", marginTop: 3 }}>
              <PlantFeaturesComponent
                plant_type_array={plant_type_array}
                checkedStatePlantShrubClimbings={
                  checkedStatePlantShrubClimbings
                }
                handleOnChangePlantShrubClimbings={
                  handleOnChangePlantShrubClimbings
                }
              />
              <PlantSpines
                plant_spines_array={plant_spines_array}
                checkedStatePlantSpnines={checkedStatePlantSpnines}
                handleOnChangePlantSpnines={handleOnChangePlantSpnines}
              />
              <Plantlatex
                plant_latex_array={plant_latex_array}
                checkedStatePlantLatex={checkedStatePlantLatex}
                handleOnChangePlantLatex={handleOnChangePlantLatex}
              />
              <SubmitClearquery
                handleCancel={handleCancel}
                handleData={handleData}
              />
            </Box>

            <Box sx={{ display: isSmallScreen ? "row" : "flex", marginTop: 3 }}>
              <Fruittype
                fruit_type_array={fruit_type_array}
                checkedStateFruitType={checkedStateFruitType}
                handleOnChangeFruitType={handleOnChangeFruitType}
              />
              <FruitColor
                fruit_color_array={fruit_color_array}
                checkedStateColor={checkedStateColor}
                handleOnChangeColor={handleOnChangeColor}
              />
              <FruitShape
                fruit_shape_array={fruit_shape_array}
                checkedStateFruitShape={checkedStateFruitShape}
                handleOnChangeFruitShape={handleOnChangeFruitShape}
              />

              <FruitSize
                fruit_size_array={fruit_size_array}
                checkedStateSize={checkedStateSize}
                handleOnChangeSize={handleOnChangeSize}
              />
            </Box>

            <Box sx={{ display: isSmallScreen ? "row" : "flex", marginTop: 3 }}>
              <Leaftype
                leaf_type_array={leaf_type_array}
                checkedStateLeafType={checkedStateLeafType}
                handleOnChangeLeafType={handleOnChangeLeafType}
              />

              <LeafMargin
                leaf_margins_array={leaf_margins_array}
                checkedStateLeafMargins={checkedStateLeafMargins}
                handleOnChangeLeafMargins={handleOnChangeLeafMargins}
              />
              <Leafarrangement
                leaf_arrangement_array={leaf_arrangement_array}
                checkedStateLeafArrangement={checkedStateLeafArrangement}
                handleOnChangeLeafArrangement={handleOnChangeLeafArrangement}
              />
            </Box>
          </Box>
        )}
      </Container>
    );
  }
}
