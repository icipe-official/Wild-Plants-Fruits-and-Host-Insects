import React, { useState } from "react";
// import makeStyles from '@mui/material/styles/makeStyles'
import FormGroup from "@mui/material/FormGroup";
import FormControlLabel from "@mui/material/FormControlLabel";
import Checkbox from "@mui/material/Checkbox";
import { makeStyles } from "@mui/styles"; // custom component  styles
import { Box, Button, FormControl, InputLabel } from "@mui/material";
import Select from "@mui/material/Select";
import MenuItem from "@mui/material/MenuItem";
import Link from "next/link";
import { useRouter } from "next/router";
import Typography from "@mui/material/Typography";

//import { useEffect, useState } from 'react';

export default function Groupcheckbox({
  plant_type_data,
  latex_data,
  spines_data,
  fruit_type_data,
  fruit_shape_data,
  fruit_color_data,
  fruit_size_data,
  plants_data,
  leaf_type_data,
  leaf_margin_data,
  leaf_arrangement_data,
}) {
  const [selected, setSelected] = useState(true);
  // const theme=useTheme()
  const [data, setData] = useState([]);
  const [loaded, setLoaded] = useState(false);
  const [error, setError] = useState(null);
  const [query, setQuery] = useState({
    plant_types: [],
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

  //  custome material UI styles
  const useStyles = makeStyles((theme) => ({
    formControl: {
      margin: theme.spacing(0),
      color: "yellow",
    },
  }));

  // Extract arrays from the query params
  //console.log(fruit_size.fruit_size.fruit_size)
  const plant_type_array = Array.from(plant_type_data).map(
    (specie) =>
      // return a list of fruit color
      specie.tree_type
  );
  // console.log("plant_type_array");
  // console.log(plant_type_array);

  // manage states of checked plant type
  const [checkedStatePlantType, setCheckedStatePlantType] = useState(
    new Array(plant_type_array.length).fill(false)
  );

  // handle Change events when fruit color box is checked
  const handleOnChangePlantType = (position) => {
    const updatedCheckedStatePlantType = checkedStatePlantType.map(
      (item, index) => (position === index ? !item : item)
    );
    setCheckedStatePlantType(updatedCheckedStatePlantType);
    const PlantTypeIndex = updatedCheckedStatePlantType.flatMap((bool, index) =>
      bool ? index : []
    ); //extract only true values index
    const len = PlantTypeIndex.length;
    const fr = PlantTypeIndex.map((i) => plant_type_array[i]);
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, plant_types: fr })); //setting state in dictionary
  };

  //plant latex
  // plant latex data data
  // console.log("plant_latex_data");

  // console.log(latex_data);
  // console.log(
  //   Array.from(latex_data).map(
  //     (specie) =>
  //       // return a list of fruit shape
  //       specie.latex_description
  //   )
  // );
  // Extract arrays from the query params
  //console.log(fruit_size.fruit_size.fruit_size)
  const plant_latex_array = Array.from(latex_data).map(
    (specie) =>
      // return a list of fruit color
      specie.latex_description
  );

  // plant spines data data

  // Extract arrays from the query params
  //console.log(fruit_size.fruit_size.fruit_size)
  const plant_spines_array = Array.from(spines_data).map(
    (specie) =>
      // return a list of fruit color
      specie.thorns_spines
  );

  // manage states of checked fruit shape
  const [checkedStatePlantSpnines, setCheckedStatePlantSpnines] = useState(
    new Array(plant_spines_array.length).fill(false)
  );

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

  // manage states of checked plant latex box
  const [checkedStatePlantLatex, setCheckedStatePlantLatex] = useState(
    new Array(plant_latex_array.length).fill(false)
  );

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

  //fruit size data
  // console.log("fruit_size_data");
  // console.log(
  //   Array.from(fruit_size_data).map(
  //     (specie) =>
  //       // return a list of species
  //       specie.size
  //   )
  // ); // data object with list of dictionaries
  //console.log('fruit_color-data')
  const fruit_size_array = Array.from(fruit_size_data).map(
    (specie) =>
      // return a list of species
      specie.size
  );
  //manage state of fruit size
  const [checkedStateSize, setCheckedStateSize] = useState(
    new Array(fruit_size_array.length).fill(false)
  );

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

  // Extract arrays from the query params
  //console.log(fruit_size.fruit_size.fruit_size)
  const fruit_color_array = Array.from(fruit_color_data).map(
    (specie) =>
      // return a list of fruit color
      specie.color
  );

  // manage states of checked fruit colors
  const [checkedStateColor, setCheckedStateColor] = useState(
    new Array(fruit_color_array.length).fill(false)
  );

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

  //Fruit type data
  // fruit type data

  // Extract arrays from the query params
  //console.log(fruit_size.fruit_size.fruit_size)
  const fruit_type_array = Array.from(fruit_type_data).map(
    (specie) =>
      // return a list of fruit color
      specie.type_of_fruit
  );

  // manage states of checked fruit type
  const [checkedStateFruitType, setCheckedStateFruitType] = useState(
    new Array(fruit_type_array.length).fill(false)
  );

  // handle Change events when fruit color box is checked
  const handleOnChangeFruitType = (position) => {
    const updatedCheckedStateFruitType = checkedStateFruitType.map(
      (item, index) => (position === index ? !item : item)
    );
    setCheckedStateFruitType(updatedCheckedStateFruitType);
    const FruitTypeIndex = updatedCheckedStateFruitType.flatMap((bool, index) =>
      bool ? index : []
    ); //extract only true values index
    const len = FruitTypeIndex.length;
    const fr = FruitTypeIndex.map((i) => fruit_type_array[i]);
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_types: fr })); //setting state in dictionary
  };

  //Fruit shape data
  // fruit shape data

  // Extract arrays from the query params
  //console.log(fruit_size.fruit_size.fruit_size)
  const fruit_shape_array = Array.from(fruit_shape_data).map(
    (specie) =>
      // return a list of fruit color
      specie.shape
  );

  // manage states of checked fruit shape
  const [checkedStateFruitShape, setCheckedStateFruitShape] = useState(
    new Array(fruit_shape_array.length).fill(false)
  );

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

  //leaf type data

  // Extract arrays from the query params
  //console.log(fruit_size.fruit_size.fruit_size)
  const leaf_type_array = Array.from(plants_data).map(
    (specie) =>
      // return a list of fruit color
      specie.leaf_type
  );

  // manage states of checked leaf type
  const [checkedStateLeafType, setCheckedStateLeafType] = useState(
    new Array(leaf_type_array.length).fill(false)
  );

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

  // Extract arrays from the query params
  //console.log(fruit_size.fruit_size.fruit_size)
  const leaf_margins_array = Array.from(leaf_margin_data).map(
    (specie) =>
      // return a list of fruit color
      specie.type_of_leaf_margin
  );

  // manage states of checked leaf margin boxes
  const [checkedStateLeafMargins, setCheckedStateLeafMargins] = useState(
    new Array(leaf_margins_array.length).fill(false)
  );

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

  // Extract arrays from the query params
  //console.log(fruit_size.fruit_size.fruit_size)
  const leaf_arrangement_array = Array.from(leaf_arrangement_data).map(
    (specie) =>
      // return a list of fruit color
      specie.arrangement
  );

  // manage states of checked fruit shape
  const [checkedStateLeafArrangement, setCheckedStateLeafArrangement] =
    useState(new Array(leaf_arrangement_array.length).fill(false));

  // handle Change events when fruit color box is checked
  const handleOnChangeLeafArrangement = (position) => {
    const updatedCheckedStateLeafArrangement = checkedStateLeafArrangement.map(
      (item, index) => (position === index ? !item : item)
    );
    setCheckedStateLeafArrangement(updatedCheckedStateLeafArrangement);
    const LeafArrangementIndex = updatedCheckedStateLeafArrangement.flatMap(
      (bool, index) => (bool ? index : [])
    ); //extract only true values index
    const len = LeafArrangementIndex.length;
    const fr = LeafArrangementIndex.map((i) => leaf_arrangement_array[i]);
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, leaf_arrangements: fr })); //setting state in dictionary
  };

  // handle Query function
  const handleData = () => {
    if (
      query.plant_types.length === 0 &&
      query.plant_latex.length === 0 &&
      query.fruit_shapes.length === 0 &&
      query.fruit_colors.length === 0 &&
      query.fruit_sizes.length === 0 &&
      query.leaf_types.length === 0 &&
      query.fruit_types.length === 0 &&
      query.leaf_types.length &&
      query.leaf_margins.length &&
      query.leaf_arrangements.length
    ) {
      return "No query param selected";
    } else {
      const i = JSON.stringify(query);
      fetch("api/multipleEntry/multipleentry?filters=" + i)
        .then((res) => res.json())
        .then(
          (result) => setData(result),
          (error) => {
            setLoaded(true);
            setError(error);
          }
        );
    }
  };
  // Handle data states and select functionality
  const [selectedSpecies, setSelectedSpecies] = useState("");
  const selectSpecieHandler = (value) => setSelectedSpecies(value);
  // handle change of events when user cancels selections
  const handleCancel = () => {
    //states for check box
    setCheckedStateColor(new Array(fruit_color_array.length).fill(false));
    setCheckedStateSize(new Array(fruit_size_array.length).fill(false));
    setCheckedStatePlantType(new Array(plant_type_array.length).fill(false));
    setCheckedStateFruitType(new Array(fruit_type_array.length).fill(false));
    setCheckedStateFruitShape(new Array(fruit_shape_array.length).fill(false));
    setCheckedStatePlantType(new Array(plant_type_array.length).fill(false));
    setCheckedStateLeafType(new Array(leaf_type_array.length).fill(false));
    setCheckedStatePlantLatex(new Array(plant_latex_array.length).fill(false));
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
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, plant_thorns: [] })); //setting state in dictionary
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_colors: [] })); //setting state in dictionary
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_shapes: [] })); //setting state in dictionary
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_sizes: [] })); //setting state in dictionary
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, fruit_types: [] })); //setting state in dictionary
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, leaf_types: [] })); //setting state in dictionary
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, leaf_margins: [] })); //setting state in dictionary
    setQuery((prevQueryInfo) => ({ ...prevQueryInfo, leaf_arrangements: [] })); //setting state in dictionary

    setData([]);
  };

  const j = JSON.stringify(query);

  //extract species name
  // console.log(selectedSpecies.split(' ').slice(1, ).join(' '))// split with space, splice to get species name
  // console.log('/plants/prisma_api/'+ selectedSpecies.split(' ').slice(1, ).join(' '))// split with space, splice to get species name

  return (
    <Box sx={{ display: "column" }}>
      <Box
        sx={{
          display: "flex",
          border: "1px solid #ccc",
          borderRadius: "4px",
          width: "100%",
          marginTop: 1,
          height: 280,
        }}
      >
        <Box sx={{ display: "flex" }}>
          <Box sx={{ padding: 0.5 }}>
            <Box>
              <Typography sx={{ color: "green" }}>Plant</Typography>
              <Typography variant="subtitle1" sx={{ color: "green" }}>
                Type
              </Typography>
            </Box>
            <Box
              sx={{
                height: "220px",
                backgroundColor: "lightgrey",
                overflowY: "auto",
                border: "1px solid #ccc",
                borderRadius: "4px",
                width: "200px",
              }}
            >
              {plant_type_array.sort().map((type, index) => (
                <FormGroup key={type}>
                  <FormControlLabel
                    control={
                      <Checkbox
                        checked={checkedStatePlantType[index]}
                        onChange={() => handleOnChangePlantType(index)}
                      />
                    }
                    label={type}
                  />
                </FormGroup>
              ))}
            </Box>
          </Box>
          <Box sx={{ padding: 4 }}>
            <Box sx={{ marginLeft: 2 }}>
              <Typography variant="subtitle2" sx={{ color: "green" }}>
                Spines and thorns
              </Typography>
            </Box>

            <Box
              sx={{
                height: "220px",
                backgroundColor: "lightgrey",
                overflowY: "auto",
                border: "1px solid #ccc",
                borderRadius: "4px",
                width: "200px",
                marginLeft: 2,
              }}
            >
              {plant_spines_array.sort().map((spine, index) => (
                <FormGroup key={spine}>
                  <FormControlLabel
                    control={
                      <Checkbox
                        checked={checkedStatePlantSpnines[index]}
                        onChange={() => handleOnChangePlantSpnines(index)}
                      />
                    }
                    label={spine}
                  />
                </FormGroup>
              ))}
            </Box>
          </Box>
          <Box sx={{ padding: 4 }}>
            <Box sx={{ marginLeft: 2 }}>
              <Typography variant="subtitle2" sx={{ color: "green" }}>
                Latex
              </Typography>
            </Box>

            <Box
              sx={{
                height: "220px",
                backgroundColor: "lightgrey",
                overflowY: "auto",
                border: "1px solid #ccc",
                borderRadius: "4px",
                width: "200px",
                marginLeft: 2,
              }}
            >
              {plant_latex_array.sort().map((latex, index) => (
                <FormGroup key={latex}>
                  <FormControlLabel
                    control={
                      <Checkbox
                        checked={checkedStatePlantLatex[index]}
                        onChange={() => handleOnChangePlantLatex(index)}
                      />
                    }
                    label={latex}
                  />
                </FormGroup>
              ))}
            </Box>
          </Box>
        </Box>
        <Box sx={{ padding: 5 }}>
          <Button
            color="success"
            variant="contained" // add background
            onClick={() => {
              // setQuery({'colors':[],'sizes':[]})
              // handleOnChangeColor();
              // handleOnChangeSize();
              handleData();
            }}
          >
            Submit Query
          </Button>
        </Box>

        <Box sx={{ padding: 5 }}>
          <Button
            variant="contained" // add
            color="error"
            onClick={() => {
              handleCancel(); // cancel any box checked
            }}
          >
            Clear Query
          </Button>
        </Box>
      </Box>
      <Box sx={{ display: "flex" }}>
        <Box
          sx={{
            display: "flex",
            border: "1px solid #ccc",
            borderRadius: "4px",
            width: "100%",
            marginTop: 1,
            height: 280,
          }}
        >
          <Box>
            <Box>
              <Typography sx={{ color: "red" }}>Fruit</Typography>
              <Typography variant="subtitle1" sx={{ color: "red" }}>
                Type
              </Typography>
            </Box>
            <Box
              sx={{
                height: "220px",
                backgroundColor: "lightgrey",
                overflowY: "auto",
                border: "1px solid #ccc",
                borderRadius: "4px",
                width: "200px",
                marginLeft: 0.5,
              }}
            >
              {/* <Select style={{ width: "200px" }}> */}
              {fruit_type_array.sort().map((fruit, index) => (
                <FormGroup key={fruit}>
                  <FormControlLabel
                    control={
                      <Checkbox
                        checked={checkedStateFruitType[index]}
                        onChange={() => handleOnChangeFruitType(index)}
                      />
                    }
                    label={fruit}
                  />
                </FormGroup>
              ))}
              {/* </Select> */}
            </Box>
          </Box>

          <Box sx={{ padding: 4 }}>
            <Box sx={{ marginLeft: 2 }}>
              <Typography variant="subtitle2" sx={{ color: "red" }}>
                Shape
              </Typography>
            </Box>
            <Box
              sx={{
                height: "220px",
                backgroundColor: "lightgrey",
                overflowY: "auto",
                border: "1px solid #ccc",
                borderRadius: "4px",
                width: "200px",
                marginLeft: 2,
              }}
            >
              {fruit_shape_array.sort().map((shape, index) => (
                <FormGroup key={shape}>
                  <FormControlLabel
                    control={
                      <Checkbox
                        checked={checkedStateFruitShape[index]}
                        onChange={() => handleOnChangeFruitShape(index)}
                      />
                    }
                    label={shape}
                  />
                </FormGroup>
              ))}
            </Box>
          </Box>

          <Box sx={{ padding: 4 }}>
            <Box sx={{ padding: 0 }}>
              <Box sx={{ marginLeft: 2 }}>
                <Typography variant="subtitle2" sx={{ color: "red" }}>
                  Shape
                </Typography>
              </Box>
              <Box
                sx={{
                  height: "220px",
                  backgroundColor: "lightgrey",
                  overflowY: "auto",
                  border: "1px solid #ccc",
                  borderRadius: "4px",
                  width: "200px",
                  marginLeft: 2,
                }}
              >
                {/* <Select style={{ width: "200px" }}> */}
                {fruit_color_array.sort().map((color, index) => (
                  <FormGroup key={color}>
                    <FormControlLabel
                      control={
                        <Checkbox
                          checked={checkedStateColor[index]}
                          onChange={() => handleOnChangeColor(index)}
                        />
                      }
                      label={color}
                    />
                  </FormGroup>
                ))}
                {/* </Select> */}
              </Box>
            </Box>
          </Box>

          <Box sx={{ padding: 4 }}>
            <Box sx={{ padding: 0 }}>
              <Box sx={{ marginLeft: 2 }}>
                <Typography variant="subtitle2" sx={{ color: "red" }}>
                  Size
                </Typography>
              </Box>
              <Box
                sx={{
                  height: "220px",
                  backgroundColor: "lightgrey",
                  overflowY: "auto",
                  border: "1px solid #ccc",
                  borderRadius: "4px",
                  width: "200px",
                  marginLeft: 2,
                }}
              >
                {fruit_size_array.map((size, index) => (
                  <FormGroup key={size}>
                    <FormControlLabel
                      control={
                        <Checkbox
                          checked={checkedStateSize[index]}
                          onChange={() => handleOnChangeSize(index)}
                        />
                      }
                      label={size}
                    />
                  </FormGroup>
                ))}
              </Box>
            </Box>
          </Box>
        </Box>
      </Box>

      <Box
        sx={{
          display: "flex",
          border: "1px solid #ccc",
          borderRadius: "4px",
          width: "100%",
          marginTop: 1,
          height: 280,
        }}
      >
        <Box sx={{ display: "flex" }}>
          <Box sx={{ padding: 0.5 }}>
            <Box>
              <Box>
                <Typography sx={{ color: "green" }}>Leaf</Typography>
                <Typography variant="subtitle1" sx={{ color: "green" }}>
                  Type
                </Typography>
              </Box>
              <Box
                sx={{
                  height: "220px",
                  backgroundColor: "lightgrey",
                  overflowY: "auto",
                  border: "1px solid #ccc",
                  borderRadius: "4px",
                  width: "200px",
                  marginLeft: 2,
                }}
              >
                {leaf_type_array.map((type, index) => (
                  <FormGroup key={type}>
                    <FormControlLabel
                      control={
                        <Checkbox
                          checked={checkedStateLeafType[index]}
                          onChange={() => handleOnChangeLeafType(index)}
                        />
                      }
                      label={type}
                    />
                  </FormGroup>
                ))}
              </Box>
            </Box>
          </Box>
          <Box>
            <Box sx={{ padding: 4 }}>
              <Box sx={{ padding: 0 }}>
                <Box sx={{ marginLeft: 2 }}>
                  <Typography variant="subtitle2" sx={{ color: "green" }}>
                    Margin
                  </Typography>
                </Box>
                {/* <Box sx={{padding:3}} > */}
                <Box
                  sx={{
                    height: "220px",
                    backgroundColor: "lightgrey",
                    overflowY: "auto",
                    border: "1px solid #ccc",
                    borderRadius: "4px",
                    width: "200px",
                    marginLeft: 2,
                  }}
                >
                  {leaf_margins_array.map((margin, index) => (
                    <FormGroup key={margin}>
                      <FormControlLabel
                        control={
                          <Checkbox
                            checked={checkedStateLeafMargins[index]}
                            onChange={() => handleOnChangeLeafMargins(index)}
                          />
                        }
                        label={margin}
                      />
                    </FormGroup>
                  ))}
                </Box>
              </Box>
            </Box>
            {/* </Box> */}
          </Box>
          <Box sx={{ padding: 1 }}>
            <Box sx={{ padding: 2 }}>
              <Box sx={{ marginLeft: 2 }}>
                <Typography variant="subtitle2" sx={{ color: "green" }}>
                  Arrangement
                </Typography>
              </Box>
              <Box
                sx={{
                  height: "220px",
                  backgroundColor: "lightgrey",
                  overflowY: "auto",
                  border: "1px solid #ccc",
                  borderRadius: "4px",
                  width: "200px",
                  marginLeft: 2,
                }}
              >
                {leaf_arrangement_array.map((arrangement, index) => (
                  <FormGroup key={arrangement}>
                    <FormControlLabel
                      control={
                        <Checkbox
                          checked={checkedStateLeafArrangement[index]}
                          onChange={() => handleOnChangeLeafArrangement(index)}
                        />
                      }
                      label={arrangement}
                    />
                  </FormGroup>
                ))}
              </Box>
            </Box>
          </Box>
        </Box>
      </Box>

      <Box>
        <Box sx={{ paddingBottom: 30 }}>
          <p>{data.length} Records found based on your search creteria</p>
          <FormControl>
            {/* <InputLabel id="Input label">Select</InputLabel> */}
            <Select
              displayEmpty={true}
              native={false}
              labelId="Input label"
              // id= "Select"
              autoWidth={true}
              defaultOpen={true}
              style={{ width: "500px" }}
              defaultValue={"value"}
              value={selectedSpecies}
              onChange={(e) => {
                selectSpecieHandler(e.target.value);
                // speciesDetailsHandler();
              }}
            >
              {!!data?.length &&
                data.map((specie, index) => (
                  <MenuItem
                    key={index}
                    value={
                      specie.plant_genera.genus_name + " " + specie.species_name
                    }
                  >
                    <Link
                      href={`/plants/${specie.species_name}`}
                      style={{ textDecoration: "none" }}
                    >
                      {specie.plant_genera.genus_name +
                        " " +
                        specie.species_name}
                    </Link>
                  </MenuItem>
                ))}
            </Select>
          </FormControl>
        </Box>
      </Box>
    </Box>
  );

  // Form control - controls the size of the form
}
