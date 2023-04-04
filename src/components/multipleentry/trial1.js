// Use PascalCase for React components, or lowercase for HTML elements.
// //Material UI working

//This code is a part of a React component that implements a dropdown menu using Material-UI's FormControl and Select components.

//The FormControl component is a wrapper for form controls (e.g. input, select, etc.) that provides additional styling, validation, and accessibility features.

//The Select component is a dropdown menu that allows users to select an option from a list of choices.

//displayEmpty - Specifies whether to display the dropdown menu without a selected option.
//native - Specifies whether to use the native HTML select element or the Material-UI Select component.
//labelId - The id of the label that describes the select element.
//autoWidth - Specifies whether to adjust the width of the dropdown menu to the width of its largest item.
//defaultOpen - Specifies whether the dropdown menu should be open by default.
//style - A style object for the dropdown menu.
//defaultValue - The default value of the selected option.
//value - The value of the selected option, which is dynamically set by selectedSpecies.
//onChange - A function that is called whenever the selected option changes. It sets the new value of selectedSpecies using selectSpecieHandler and may call speciesDetailsHandler (the code is commented out in this case).
//The Select component also contains a list of MenuItem components that represent the available options in the dropdown menu. The options are created by mapping over an array of objects, data, and creating a MenuItem component for each object. The options are links to specific plant species and display both the genus and species names

import React, { useState } from 'react'
// import makeStyles from '@mui/material/styles/makeStyles'
import FormGroup from '@mui/material/FormGroup'
import FormControlLabel from '@mui/material/FormControlLabel'
import Checkbox from '@mui/material/Checkbox'
import { makeStyles } from '@mui/styles';  // custom component  styles
// import { Box, Button, FormControl, InputLabel } from '@mui/material'
import Select from '@mui/material/Select'
import MenuItem from '@mui/material/MenuItem'
// import Link from 'next/link'
// import { useRouter } from 'next/router'
// import { useState } from "react";
import { Box,Button, FormControl, InputLabel} from '@mui/material';
import Typography from '@mui/material/Typography';
import { Link } from 'react-admin';
// import { useRouter } from 'next/router';
// import Router from 'next/router';
import { setData } from '../../../store/actions';
import { useDispatch } from 'react-redux';
import { useNavigate } from 'react-router-dom';
// import Switch from '@material-ui/core/Switch';
import Router from 'next/router';
import { useHistory } from 'react-router-dom';
import { useRouter } from 'next/router';
//import { useEffect, useState } from 'react';
export default function QuerySelect({plant_type_data,latex_data,spines_data,fruit_type_data,fruit_shape_data,fruit_color_data,fruit_size_data,
                                      plants_data,leaf_type_data,leaf_margin_data,leaf_arrangement_data}){
  const [selected, setSelected] = useState(true);
  // const theme=useTheme()
  const [data,setData]=useState([])
  const [loaded,setLoaded]=useState(false)
  const [error,setError]=useState(null)
  const [query,setQuery]=useState({'plant_types':[],'plant_spines':[],'plant_latex':[],'fruit_types':[],'fruit_colors':[],
                                  'fruit_sizes':[],'fruit_shapes':[],'leaf_types':[],'leaf_margins':[],'leaf_arrangements':[]})
   const dispatch = useDispatch();

//  custome material UI styles 
    // const useStyles = makeStyles((theme) => ({
    //     formControl: {
    //       margin: theme.spacing(0),
    //       color:'yellow'
    //     },
    //   }))
    // const { JSDOM } = jsdom;
    
    // const dom = new JSDOM();
    // const { document } = dom.window;
    

// plant type data
console.log("plant_type_data")
console.log(plant_type_data)
console.log(Array.from(plant_type_data).map(specie =>(
  // return a list of fruit color
specie.tree_type)))
// Extract arrays from the query params
 //console.log(fruit_size.fruit_size.fruit_size)
  const plant_type_array= Array.from(plant_type_data).map(specie =>(
    // return a list of fruit color
  specie.tree_type)) 
console.log("plant_type_array")
console.log(plant_type_array)

// manage states of checked plant type
const [checkedStatePlantType, setCheckedStatePlantType] = useState(
    new Array(plant_type_array.length).fill(false)
  );

// handle Change events when fruit color box is checked
const handleOnChangePlantType = (position) => {
    const updatedCheckedStatePlantType = checkedStatePlantType.map((item, index) =>
    position === index ? !item : item,
      );
      setCheckedStatePlantType(updatedCheckedStatePlantType)
    const PlantTypeIndex=updatedCheckedStatePlantType.flatMap((bool,index)=>bool? index:[]) //extract only true values index
    const len=PlantTypeIndex.length
    const fr=PlantTypeIndex.map((i)=>
    plant_type_array[i])
    setQuery(prevQueryInfo => ({...prevQueryInfo,plant_types:fr})) //setting state in dictionary
  }

//plant latex
// plant latex data data
console.log("plant_latex_data")

console.log(latex_data)
console.log(Array.from(latex_data).map(specie =>(
 // return a list of fruit shape
specie.latex_description)))
// Extract arrays from the query params
//console.log(fruit_size.fruit_size.fruit_size)
 const plant_latex_array= Array.from(latex_data).map(specie =>(
   // return a list of fruit color
 specie.latex_description))
console.log("plant_latex_array")
console.log(plant_latex_array)

// plant spines data data
console.log("plant_spines_data")

console.log(spines_data)
console.log(Array.from(spines_data).map(specie =>(
 // return a list of fruit shape
specie.thorns_spines)))
// Extract arrays from the query params
//console.log(fruit_size.fruit_size.fruit_size)
 const plant_spines_array= Array.from(spines_data).map(specie =>(
   // return a list of fruit color
 specie.thorns_spines))
console.log("plant_spines_array")
console.log(plant_spines_array)


// manage states of checked fruit shape
const [checkedStatePlantSpnines, setCheckedStatePlantSpnines] = useState(
   new Array(plant_spines_array.length).fill(false)
 );


// handle Change events when fruit color box is checked
const handleOnChangePlantSpnines = (position) => {
   const updatedCheckedStatePlantSpnines = checkedStatePlantSpnines.map((item, index) =>
   position === index ? !item : item,
     );
     setCheckedStatePlantSpnines(updatedCheckedStatePlantSpnines)
   const PlantSpninesIndex=updatedCheckedStatePlantSpnines.flatMap((bool,index)=>bool? index:[]) //extract only true values index
   const len=PlantSpninesIndex.length
   const fr=PlantSpninesIndex.map((i)=>
   plant_spines_array[i])
   setQuery(prevQueryInfo => ({...prevQueryInfo,plant_spines:fr})) //setting state in dictionary
 }



// manage states of checked plant latex box
const [checkedStatePlantLatex, setCheckedStatePlantLatex] = useState(
   new Array(plant_latex_array.length).fill(false)
 );


// handle Change events when plant latex box is checked
const handleOnChangePlantLatex = (position) => {
   const updatedCheckedStatePlantLatex = checkedStatePlantLatex.map((item, index) =>
   position === index ? !item : item,
     );
     setCheckedStatePlantLatex(updatedCheckedStatePlantLatex)
   const PlantLatexIndex=updatedCheckedStatePlantLatex.flatMap((bool,index)=>bool? index:[]) //extract only true values index
   const len=PlantLatexIndex.length
   const fr=PlantLatexIndex.map((i)=>
   plant_latex_array[i])
   setQuery(prevQueryInfo => ({...prevQueryInfo,plant_latex:fr})) //setting state in dictionary
 }



//fruit size data
console.log('fruit_size_data') 
console.log(Array.from(fruit_size_data).map(specie =>(
  // return a list of species
specie.size)) ) // data object with list of dictionaries
//console.log('fruit_color-data') 
const fruit_size_array= Array.from(fruit_size_data).map(specie =>(
  // return a list of species
specie.size)) 
//manage state of fruit size 
const [checkedStateSize, setCheckedStateSize] = useState(
  new Array(fruit_size_array.length).fill(false)
);

// handle change of events when fruit size box is checked
const handleOnChangeSize = (position) => {
  const updatedCheckedStateSize = checkedStateSize.map((item, index) =>
    index === position ? !item : item,
    );
    const fruitSizeIndex=updatedCheckedStateSize.flatMap((bool,index)=>bool? index:[]) //extract only true values index
    const len=fruitSizeIndex.length
    const fr=fruitSizeIndex.map((i)=>
    fruit_size_array[i])
  setCheckedStateSize(updatedCheckedStateSize)
  setQuery(prevQueryInfo => ({...prevQueryInfo,fruit_sizes:fr})) //setting state in dictionary
}



//fruit color data
console.log(Array.from(fruit_color_data).map(specie =>(
  // return a list of fruit color
specie.color)) ) 
// Extract arrays from the query params
 //console.log(fruit_size.fruit_size.fruit_size)
  const fruit_color_array= Array.from(fruit_color_data).map(specie =>(
    // return a list of fruit color
  specie.color)) 

// manage states of checked fruit colors
const [checkedStateColor, setCheckedStateColor] = useState(
    new Array(fruit_color_array.length).fill(false)
  );

// handle Change events when fruit color box is checked
const handleOnChangeColor = (position) => {
    const updatedCheckedStateColor = checkedStateColor.map((item, index) =>
    position === index ? !item : item,
      );
    setCheckedStateColor(updatedCheckedStateColor)
    const fruitColorIndex=updatedCheckedStateColor.flatMap((bool,index)=>bool? index:[]) //extract only true values index
    const len=fruitColorIndex.length
    const fr=fruitColorIndex.map((i)=>
    fruit_color_array[i])
    setQuery(prevQueryInfo => ({...prevQueryInfo,fruit_colors:fr})) //setting state in dictionary
    // setQuery.fruit[fr]
    //const fruitSizeIndex=checkedStateColor.flatMap((bool,index)=>bool? index:[]) //extract only true values index
    // loop over selected values and append to the list for query
    
  }

//Fruit type data
// fruit type data
console.log("fruit_type_data")


console.log(fruit_type_data)
console.log(Array.from(fruit_type_data).map(specie =>(
 // return a list of fruit color
specie.tree_type)))
// Extract arrays from the query params
//console.log(fruit_size.fruit_size.fruit_size)
 const fruit_type_array= Array.from(fruit_type_data).map(specie =>(
   // return a list of fruit color
 specie.type_of_fruit))
console.log("fruit_type_array")


console.log(fruit_type_array)
console.log(fruit_color_array)


// manage states of checked fruit type
const [checkedStateFruitType, setCheckedStateFruitType] = useState(
   new Array(fruit_type_array.length).fill(false)
 );


// handle Change events when fruit color box is checked
const handleOnChangeFruitType = (position) => {
   const updatedCheckedStateFruitType = checkedStateFruitType.map((item, index) =>
   position === index ? !item : item,
     );
     setCheckedStateFruitType(updatedCheckedStateFruitType)
   const FruitTypeIndex=updatedCheckedStateFruitType.flatMap((bool,index)=>bool? index:[]) //extract only true values index
   const len=FruitTypeIndex.length
   const fr=FruitTypeIndex.map((i)=>
   fruit_type_array[i])
   setQuery(prevQueryInfo => ({...prevQueryInfo,fruit_types:fr})) //setting state in dictionary
 }


 //Fruit shape data
 // fruit shape data
console.log("fruit_shape_data")
console.log(fruit_shape_data)
console.log(Array.from(fruit_shape_data).map(specie =>(
 // return a list of fruit shape
specie.tree_type)))
// Extract arrays from the query params
//console.log(fruit_size.fruit_size.fruit_size)
 const fruit_shape_array= Array.from(fruit_shape_data).map(specie =>(
   // return a list of fruit color
 specie.shape))
console.log("fruit_shape_array")
console.log(fruit_shape_array)

// manage states of checked fruit shape
const [checkedStateFruitShape, setCheckedStateFruitShape] = useState(
   new Array(fruit_shape_array.length).fill(false)
 );


// handle Change events when fruit color box is checked
const handleOnChangeFruitShape = (position) => {
   const updatedCheckedStateFruitShape = checkedStateFruitShape.map((item, index) =>
   position === index ? !item : item,
     );
     setCheckedStateFruitShape(updatedCheckedStateFruitShape)
   const FruitShapeIndex=updatedCheckedStateFruitShape.flatMap((bool,index)=>bool? index:[]) //extract only true values index
   const len=FruitShapeIndex.length
   const fr=FruitShapeIndex.map((i)=>
   fruit_shape_array[i])
   setQuery(prevQueryInfo => ({...prevQueryInfo,fruit_shapes:fr})) //setting state in dictionary
 }

//leaf type data
console.log("leaf_type_data")
console.log(plants_data)
console.log(Array.from(plants_data).map(specie =>(
 // return a list of fruit shape
specie.leaf_type)))
// Extract arrays from the query params
//console.log(fruit_size.fruit_size.fruit_size)
 const leaf_type_array= Array.from(plants_data).map(specie =>(
   // return a list of fruit color
 specie.leaf_type))
console.log("leaf_type_array")
console.log(leaf_type_array)


// manage states of checked leaf type 
const [checkedStateLeafType, setCheckedStateLeafType] = useState(
   new Array(leaf_type_array.length).fill(false)
 );

// handle Change events when leaf type  box is checked
const handleOnChangeLeafType = (position) => {
   const updatedCheckedStateLeafType = checkedStateLeafType.map((item, index) =>
   position === index ? !item : item,
     );
     setCheckedStateLeafType(updatedCheckedStateLeafType)
   const LeafTypeIndex=updatedCheckedStateLeafType.flatMap((bool,index)=>bool? index:[]) //extract only true values index
   const len=LeafTypeIndex.length
   const fr=LeafTypeIndex.map((i)=>
   leaf_type_array[i])
   setQuery(prevQueryInfo => ({...prevQueryInfo,leaf_types:fr})) //setting state in dictionary
 }

 // plant leaf margin data data
console.log("leaf_margins_data")


console.log(leaf_margin_data)
console.log(Array.from(leaf_margin_data).map(specie =>(
 // return a list of fruit shape
specie.type_of_leaf_margin)))
// Extract arrays from the query params
//console.log(fruit_size.fruit_size.fruit_size)
 const leaf_margins_array= Array.from(leaf_margin_data).map(specie =>(
   // return a list of fruit color
 specie.type_of_leaf_margin))
console.log("leaf_margins_array")
console.log(leaf_margins_array)

// manage states of checked leaf margin boxes
const [checkedStateLeafMargins, setCheckedStateLeafMargins] = useState(
   new Array(leaf_margins_array.length).fill(false)
 );


// handle Change events when leaf margin box is checked
const handleOnChangeLeafMargins = (position) => {
   const updatedCheckedStateLeafMargins = checkedStateLeafMargins.map((item, index) =>
   position === index ? !item : item,
     );
     setCheckedStateLeafMargins(updatedCheckedStateLeafMargins)
   const LeafMarginsIndex=updatedCheckedStateLeafMargins.flatMap((bool,index)=>bool? index:[]) //extract only true values index
   const len=LeafMarginsIndex.length
   const fr=LeafMarginsIndex.map((i)=>
   leaf_margins_array[i])
   setQuery(prevQueryInfo => ({...prevQueryInfo,leaf_margins:fr})) //setting state in dictionary
 }


 // plant leaf arrangement data data
console.log("leaf_arrangement_data")

console.log(leaf_arrangement_data)
console.log(Array.from(leaf_arrangement_data).map(specie =>(
 // return a list of leaf arrangement
specie.arrangement)))
// Extract arrays from the query params
//console.log(fruit_size.fruit_size.fruit_size)
 const leaf_arrangement_array= Array.from(leaf_arrangement_data).map(specie =>(
   // return a list of fruit color
 specie.arrangement))
console.log("leaf_arrangement_array")
console.log(leaf_arrangement_array)


// manage states of checked fruit shape
const [checkedStateLeafArrangement, setCheckedStateLeafArrangement] = useState(
   new Array(leaf_arrangement_array.length).fill(false)
 );


// handle Change events when fruit color box is checked
const handleOnChangeLeafArrangement = (position) => {
   const updatedCheckedStateLeafArrangement = checkedStateLeafArrangement.map((item, index) =>
   position === index ? !item : item,
     );
     setCheckedStateLeafArrangement(updatedCheckedStateLeafArrangement)
   const LeafArrangementIndex=updatedCheckedStateLeafArrangement.flatMap((bool,index)=>bool? index:[]) //extract only true values index
   const len=LeafArrangementIndex.length
   const fr=LeafArrangementIndex.map((i)=>
   leaf_arrangement_array[i])
   setQuery(prevQueryInfo => ({...prevQueryInfo,leaf_arrangements:fr})) //setting state in dictionary
 }





// handle Query function 
 const handleData = () => {
  if (query.plant_types.length === 0  && query.plant_latex.length === 0 && query.fruit_shapes.length === 0 &&
    query.fruit_colors.length === 0 && query.fruit_sizes.length === 0 && query.leaf_types.length === 0 && 
    query.fruit_types.length === 0 && query.leaf_types.length && query.leaf_margins.length && 
    query.leaf_arrangements.length) {
      getCurrent();
    return 'No query param selected';
  } 
  else {
    // const history = useHistory();
    const i = JSON.stringify(query);
      fetch('api/multipleEntry/multipleentry?filters=' + i)
        .then((res) => res.json())
        .then((result) => {
          // Set the data in the store
          if (result && result.length > 0) {
            const data = result.map((r) => r.species_name);
            Router.push({
              pathname: '/multipleentry/trial',
              state: { data: result }
            });
          }
        },
        (error) => {
          setLoaded(true);
          setError(error);
        }
      );
  };
};

// const router = useRouter();
//     const i = JSON.stringify(query);
//   const fetchData = (i) => {
//     fetch('api/multipleEntry/multipleentry?filters=' + i)
//       .then((res) => res.json())
//       .then(
//         (result) => {
//           setData(result);

//           // Check if the result contains at least one item
//           if (result && result.length > 0) {
//             // Navigate to the detail page of the first item
//             router.push(`/plants/${result[0].id}`);
//           } else {
//             // If there are no items, navigate to the home page
//             router.push('/');
//           }
//         },
//         (error) => {
//           setLoaded(true);
//           setError(error);
//         }
//       );
//   };






// Handle data states and select functionality
const [selectedSpecies, setSelectedSpecies] = useState("");
const selectSpecieHandler = (value) => setSelectedSpecies(value);
// handle change of events when user cancels selections
const handleCancel=()=>{
    //states for check box
    setCheckedStateColor(new Array(fruit_color_array.length).fill(false))
    setCheckedStateSize(new Array(fruit_size_array.length).fill(false))
    setCheckedStatePlantType(new Array(plant_type_array.length).fill(false))
    setCheckedStateFruitType(new Array(fruit_type_array.length).fill(false))
    setCheckedStateFruitShape(new Array(fruit_shape_array.length).fill(false))
    setCheckedStatePlantType(new Array(plant_type_array.length).fill(false))
    setCheckedStateLeafType(new Array(leaf_type_array.length).fill(false))
    setCheckedStatePlantLatex(new Array(plant_latex_array.length).fill(false))
    setCheckedStatePlantSpnines(new Array(plant_spines_array.length).fill(false))
    setCheckedStateLeafMargins(new Array(leaf_margins_array.length).fill(false))
    setCheckedStateLeafArrangement(new Array(leaf_arrangement_array.length).fill(false))
  //states for query
    setQuery(prevQueryInfo => ({...prevQueryInfo,plant_types:[]})) //setting state in dictionary
    setQuery(prevQueryInfo => ({...prevQueryInfo,plant_latex:[]})) //setting state in dictionary
    // setQuery(prevQueryInfo => ({...prevQueryInfo,plant_thorns:[]})) //setting state in dictionary
    setQuery(prevQueryInfo => ({...prevQueryInfo,fruit_colors:[]})) //setting state in dictionary
    setQuery(prevQueryInfo => ({...prevQueryInfo,fruit_shapes:[]})) //setting state in dictionary
    setQuery(prevQueryInfo => ({...prevQueryInfo,fruit_sizes:[]})) //setting state in dictionary
    setQuery(prevQueryInfo => ({...prevQueryInfo,fruit_types:[]})) //setting state in dictionary
    setQuery(prevQueryInfo => ({...prevQueryInfo,leaf_types:[]})) //setting state in dictionary
    setQuery(prevQueryInfo => ({...prevQueryInfo,leaf_margins:[]})) //setting state in dictionary
    setQuery(prevQueryInfo => ({...prevQueryInfo,leaf_arrangements:[]})) //setting state in dictionary
    setQuery(prevQueryInfo => ({...prevQueryInfo,plant_spines:[]})) //setting state in dictionary

    setData([])
}

console.log('query')
console.log(query)
console.log('JSON.stringfy(query)')
console.log(JSON.stringify(query))
const j= JSON.stringify(query)
console.log('/api/plants/multipleEntry/multipleentry?filters='+j)
//console.log(checkedStateSize)
console.log('checkedStateColor')
console.log(checkedStateColor)
// console.log(query)
// console.log('fruit_size_array')
// console.log(fruit_size_array)
console.log('query')
console.log(query)
  //console.log(fr)
//console.log('data')
console.log(Array.from(data))
console.log('data')
console.log(data)
console.log(selectedSpecies)

const handle=()=>{
  //states for check box

   setCheckedStateLeafArrangement(new Array(leaf_arrangement_array.length).fill(false))
}//states for query}
//extract species name
// console.log(selectedSpecies.split(' ').slice(1, ).join(' '))// split with space, splice to get species name
// console.log('/plants/prisma_api/'+ selectedSpecies.split(' ').slice(1, ).join(' '))// split with space, splice to get species name


  // const plant_type_array = ["type1", "type2", "type3"]; // Replace with your own data
  const [selectedPlantTypes, setSelectedPlantTypes] = useState([]);

  const handlePlantTypeChange = (event) => {
    setSelectedPlantTypes(event.target.value);}
    const [showAllOptions, setShowAllOptions] = useState(false);
// display the number of items selected
    const message_plant_type = query.plant_types.length >0
    ? (checkedStatePlantType.filter(state => state).length+ ' item(s) selected')
    : "None selected";


  const message_plant_latex = query.plant_latex.length >0
  ? (checkedStatePlantLatex.filter(state => state).length+ ' item(s) selected')
  : "None selected";

  const message_plant_spines = query.plant_spines.length >0
  ? (checkedStatePlantSpnines.filter(state => state).length+ ' item(s) selected')
  : "None selected";

  const message_type = query.fruit_types.length >0
  ? (checkedStateFruitType.filter(state => state).length+ ' item(s) selected')
  : "None selected";
  const message_fruit_color = query.fruit_colors.length >0
  ? (checkedStateColor.filter(state => state).length+ ' item(s) selected')
  : "None selected";
  const message_fruit_shape = query.fruit_shapes.length >0
  ? (checkedStateFruitShape.filter(state => state).length+ ' item(s) selected')
  : "None selected";
  const message_fruit_size = query.fruit_sizes.length >0
  ? (checkedStateSize.filter(state => state).length+ ' item(s) selected')
  : "None selected";
  const message_leaf_type= query.leaf_types.length >0
  ? (checkedStateLeafType.filter(state => state).length+ ' item(s) selected')
  : "None selected";
  const message_leaf_margin = query.leaf_margins.length >0
  ? (checkedStateLeafMargins.filter(state => state).length+ ' item(s) selected')
  : "None selected";
  const message_leaf_arrangements = query.leaf_arrangements.length >0
  ? (checkedStateLeafArrangement.filter(state => state).length+ ' item(s) selected')
  : "None selected";

const useStyles = makeStyles({
  component: {
    height: "220px",
    overflowY: "auto",
    border: "1px solid #ccc",
    borderRadius: "4px",
    width: "270px",
    boxShadow: "2px 2px 2px rgba(0, 0, 0, 0.1)",
    padding: "10px",
    marginLeft:"0.5rem",
    marginBottom:"0.5rem"
  }, 
  component1: {
    height: "220px",
    overflowY: "auto",
    border: "1px solid #ccc",
    borderRadius: "4px",
    width: "270px",
    boxShadow: "2px 2px 2px rgba(0, 0, 0, 0.1)",
    padding: "10px",
    marginLeft:"0.5rem",
    marginBottom:"0.5rem"
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
  horizontalboundary:{display:"flex",
  border: "1px solid #ccc", 
  borderRadius: "4px",
   width:"100%",
   marginTop:"0.5rem",
   marginBottom:"0.5rem"},
});
  const classes = useStyles();
  // const [checkedStatePlantType, setCheckedStatePlantType] = useState(
  //   new Array(plant_type_array.length).fill(false)
  // );

  return (
  <Box>
    <Box className={classes.horizontalboundary}>
      <Box sx={{paddingLeft:'0.5rem'}}>
        <Box sx={{paddingLeft:"0.5rem"}}>
          <Typography sx={{color: "maroon",fontWeight:"bold"}}>
          Plant  
          </Typography>
          <Typography variant="subtitle1" sx={{color: "maroon"}}>
          Type <Box sx={{ display: "inline-flex", alignItems: "flex-end",marginLeft:'6rem'}}>{message_plant_type}</Box>

          </Typography>
        </Box>
          <Box className={classes.component}>
            {[...plant_type_array]
            .sort((a, b) => {
             if (a === "tree") return -1;
             if (b === "tree") return 1;
             if (a === "shrub") return -1;
             if (b === "shrub") return 1;
             return a.localeCompare(b);
             })
            .map((type, index) => (
            <div
              key={type}
              onClick={() => handleOnChangePlantType(index)}
              className={`${classes.item} ${
                checkedStatePlantType[index] ? classes.itemChecked : ""
               }`}>{type}
            </div>))}
          </Box>
      </Box>
      <Box sx={{paddingLeft:'0rem'}}>
        <Box sx={{paddingLeft:"2rem",paddingTop:'1.5rem'}}>
          <Typography variant="subtitle1" sx={{color: "maroon"}}>
          Thorns <Box sx={{ display: "inline-flex", alignItems: "flex-end",marginLeft:'4rem'}}>{message_plant_spines}</Box>
          </Typography>
        </Box>
          <Box className={classes.component1}>
            {plant_spines_array.map((spine, index) => (
            <div
              key={spine}
              onClick={() => handleOnChangePlantSpnines(index)}
              className={`${classes.item} ${
                checkedStatePlantSpnines[index] ? classes.itemChecked : ""
               }`}>{spine}
            </div>))}
          </Box>
      </Box>

      <Box sx={{paddingLeft:'0rem'}}>
        <Box sx={{paddingLeft:"2rem",paddingTop:'1.5rem'}}>
          <Typography variant="subtitle1" sx={{color: "maroon"}}>
          Latex <Box sx={{ display: "inline-flex", alignItems: "flex-end",marginLeft:'6rem'}}>{message_plant_latex}</Box>
          </Typography>
        </Box>
          <Box className={classes.component1}>
            {plant_latex_array.map((spine, index) => (
            <div
              key={spine}
              onClick={() => handleOnChangePlantLatex(index)}
              className={`${classes.item} ${
                checkedStatePlantLatex[index] ? classes.itemChecked : ""
               }`}>{spine}
            </div>))}
          </Box>
      </Box>

        <Box sx={{marginLeft:'5rem',marginTop:'2rem'}}>
          <Box sx={{padding:3}}>
            <Button
             color='success'
             variant="contained" // add background
             onClick={() => {handleData()}}> Submit Query
           </Button>
          </Box>

          <Box sx={{padding:3}}>
            <Button
              variant="contained" // add
             color='error'
             onClick={() => {
              handleCancel() }}>Clear Query
            </Button>
            </Box>
        </Box>
    </Box>  
      <Box className={classes.horizontalboundary}>
      <Box sx={{paddingLeft:'0.5rem'}}>
        <Box sx={{paddingLeft:"1rem"}}>
          <Typography sx={{color: "red",fontWeight:'bold'}}>
          Fruit  
          </Typography>
          <Typography variant="subtitle1" sx={{color: "red"}}>
          Type <Box sx={{ display: "inline-flex", alignItems: "flex-end",marginLeft:'6rem'}}>{message_type}</Box>
          </Typography>
        </Box>
          <Box className={classes.component}>
            {fruit_type_array.map((type, index) => (
            <div
              key={type}
              onClick={() => handleOnChangeFruitType(index)}
              className={`${classes.item} ${
                checkedStateFruitType[index] ? classes.itemChecked : ""
               }`}>{type}
            </div>))}
          </Box>
     </Box>
      <Box sx={{paddingLeft:'0rem'}}>
        <Box sx={{paddingLeft:"2rem",paddingTop:'1.5rem'}}>
          <Typography variant="subtitle1" sx={{color: "red"}}>
          Color <Box sx={{ display: "inline-flex", alignItems: "flex-end",marginLeft:'4rem'}}>{message_fruit_color}</Box>

          </Typography>
        </Box>
          <Box className={classes.component1}>
            {fruit_color_array.map((spine, index) => (
            <div
              key={spine}
              onClick={() => handleOnChangeColor(index)}
              className={`${classes.item} ${
                checkedStateColor[index] ? classes.itemChecked : ""
               }`}>{spine}
            </div>))}
          </Box>
      </Box>

      <Box sx={{paddingLeft:'0rem'}}>
        <Box sx={{paddingLeft:"2rem",paddingTop:'1.5rem'}}>
          <Typography variant="subtitle1" sx={{color: "red"}}>
          Shape <Box sx={{ display: "inline-flex", alignItems: "flex-end",marginLeft:'3rem'}}>{message_fruit_shape}</Box>
          </Typography>
        </Box>
          <Box className={classes.component1}>
            {fruit_shape_array.map((spine, index) => (
            <div
              key={spine}
              onClick={() => handleOnChangeFruitShape(index)}
              className={`${classes.item} ${
                checkedStateFruitShape[index] ? classes.itemChecked : ""
               }`}>{spine}
            </div>))}
          </Box>
      </Box>

      <Box sx={{paddingLeft:'0rem'}}>
        <Box sx={{paddingLeft:"2rem",paddingTop:'1.5rem'}}>
          <Typography variant="subtitle1" sx={{color: "red"}}>
          Size <Box sx={{ display: "inline-flex", alignItems: "flex-end",marginLeft:'4rem'}}>{message_fruit_size}</Box>

          </Typography>
        </Box>
          <Box className={classes.component1}>
            {fruit_size_array.map((spine, index) => (
            <div
              key={spine}
              onClick={() => handleOnChangeSize(index)}
              className={`${classes.item} ${
                checkedStateSize[index] ? classes.itemChecked : ""
               }`}>{spine}
            </div>))}
          </Box>
      </Box>
    </Box>  

      <Box className={classes.horizontalboundary}>
      <Box sx={{paddingLeft:'0.5rem'}}>
        <Box sx={{paddingLeft:"1rem"}}>
          <Typography sx={{color: "green",fontWeight:'bold'}}>
          Leaf  
          </Typography>
          <Typography variant="subtitle1" sx={{color: "green"}}>
          Type <Box sx={{ display: "inline-flex", alignItems: "flex-end",marginLeft:'4rem'}}>{message_leaf_type}</Box>
          </Typography>
        </Box>
          <Box className={classes.component}>
            {leaf_type_array.map((type, index) => (
            <div
              key={type}
              onClick={() => handleOnChangeLeafType(index)}
              className={`${classes.item} ${
                checkedStateLeafType[index] ? classes.itemChecked : ""
               }`}>{type}
            </div>))}
          </Box>
      </Box>
      <Box sx={{paddingLeft:'0rem'}}>
        <Box sx={{paddingLeft:"1rem",paddingTop:'1.5rem'}}>
          <Typography variant="subtitle1" sx={{color: "green"}}>
          Margin <Box sx={{ display: "inline-flex", alignItems: "flex-end",marginLeft:'3rem'}}>{message_leaf_margin}</Box>
          </Typography>
        </Box>
          <Box className={classes.component1}>
            {leaf_margins_array.map((spine, index) => (
            <div
              key={spine}
              onClick={() => handleOnChangeLeafMargins(index)}
              className={`${classes.item} ${
                checkedStateLeafMargins[index] ? classes.itemChecked : ""
               }`}>{spine}
            </div>))}
          </Box>
      </Box>

      <Box sx={{paddingLeft:'0rem'}}>
        <Box sx={{paddingLeft:"1rem",paddingTop:'1.5rem'}}>
          <Typography variant="subtitle1" sx={{color: "green"}}>
          Arrangement <Box sx={{ display: "inline-flex", alignItems: "flex-end",marginLeft:'1rem'}}>{message_leaf_arrangements}</Box>
          </Typography>
        </Box>
          <Box className={classes.component1}>
            {leaf_arrangement_array.map((spine, index) => (
            <div
              key={spine}
              onClick={() => handleOnChangeLeafArrangement(index)}
              className={`${classes.item} ${
                checkedStateLeafArrangement[index] ? classes.itemChecked : ""
               }`}>{spine}
            </div>))}
          </Box>
    </Box>
    </Box>  
  </Box>

  );
  
}

// Form control - controls the size of the form

  