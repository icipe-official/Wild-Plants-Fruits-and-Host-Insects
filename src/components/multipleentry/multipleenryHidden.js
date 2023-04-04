// Use PascalCase for React components, or lowercase for HTML elements.
// //Material UI working
import React, { useState } from 'react'
// import makeStyles from '@mui/material/styles/makeStyles'
import FormGroup from '@mui/material/FormGroup'
import FormControlLabel from '@mui/material/FormControlLabel'
import Checkbox from '@mui/material/Checkbox'
import Stack from '@mui/material/Stack'
import { spacing } from '@mui/system'
import { Box, Button, Container, FormControl, InputLabel } from '@mui/material'
import { makeStyles } from '@mui/styles';  // custom component  styles
import Select from '@mui/material/Select'
import MenuItem from '@mui/material/MenuItem'
import Link from 'next/link'
import { useRouter } from 'next/router'
//import { useEffect, useState } from 'react';

export default function Groupcheckbox({fruit_color_data,fruit_size_data}){
  const [selected, setSelected] = useState(true);
  // const theme=useTheme()
  const [data,setData]=useState([])
  const [loaded,setLoaded]=useState(false)
  const [error,setError]=useState(null)
  const [query,setQuery]=useState({'colors':[],'sizes':[]})

//   export default function CheckboxGroup() {
    const useStyles = makeStyles((theme) => ({
        formControl: {
          margin: theme.spacing(0),
          color:'yellow'
        },
      }))
console.log('fruit_size_data') 
console.log(Array.from(fruit_size_data).map(specie =>(
  // return a list of species
specie.size)) ) // data object with list of dictionaries
//console.log('fruit_color-data') 
console.log(Array.from(fruit_color_data).map(specie =>(
  // return a list of fruit color
specie.color)) ) 
// Extract arrays from the query params
 //console.log(fruit_size.fruit_size.fruit_size)
 const fruit_size_array= Array.from(fruit_size_data).map(specie =>(
    // return a list of species
  specie.size)) 

  const fruit_color_array= Array.from(fruit_color_data).map(specie =>(
    // return a list of fruit color
  specie.color)) 

// manage states
const [checkedStateColor, setCheckedStateColor] = useState(
    new Array(fruit_color_array.length).fill(false)
  );

const [checkedStateSize, setCheckedStateSize] = useState(
  new Array(fruit_size_array.length).fill(false)
);

// handle Change events
const handleOnChangeColor = (position) => {
    const updatedCheckedStateColor = checkedStateColor.map((item, index) =>
    position === index ? !item : item,
      );
    setCheckedStateColor(updatedCheckedStateColor)
    const fruitColorIndex=updatedCheckedStateColor.flatMap((bool,index)=>bool? index:[]) //extract only true values index
    const len=fruitColorIndex.length
    const fr=fruitColorIndex.map((i)=>
    fruit_color_array[i])
    setQuery(prevQueryInfo => ({...prevQueryInfo,colors:fr})) //setting state in dictionary
    // setQuery.fruit[fr]
    //const fruitSizeIndex=checkedStateColor.flatMap((bool,index)=>bool? index:[]) //extract only true values index
    // loop over selected values and append to the list for query
    
  }

  const handleOnChangeSize = (position) => {
  const updatedCheckedStateSize = checkedStateSize.map((item, index) =>
    index === position ? !item : item,
    );
    const fruitSizeIndex=updatedCheckedStateSize.flatMap((bool,index)=>bool? index:[]) //extract only true values index
    const len=fruitSizeIndex.length
    const fr=fruitSizeIndex.map((i)=>
    fruit_size_array[i])
  setCheckedStateSize(updatedCheckedStateSize)
  setQuery(prevQueryInfo => ({...prevQueryInfo,sizes:fr})) //setting state in dictionary

  // setQuery.fruit[fr]
  // loop over selected values and append to the list for query
}

// handle Query function
const handleData = () => {
    if(query.colors.length==0){
        return(
            'No query param selected'
        )
    }
    else{
    const i=JSON.stringify(query)
    //fetch genus based on genus selected
    // convert Query to JSON string
      fetch(
          'api/plants/prisma_api/multipleEntry/multipletrial?filters='+i

      )
          .then((res) => res.json())
          .then((result) => 
                  setData(result),
              (error) => {
                  setLoaded(true);
                  setError(error);
              }
          );
          // setCheckedStateColor(new Array(fruit_color_array.length).fill(false))
          // setCheckedStateSize(new Array(fruit_size_array.length).fill(false))
            }
    //   {data.map((d)=>{
    // return(
    //   <ul> {d.genus.genus_name+ ' '+d.species_name}</ul>
    //  )} )}
        };
// Handle data states and select functionality
const [selectedSpecies, setSelectedSpecies] = useState("");
const selectSpecieHandler = (value) => setSelectedSpecies(value);
// handle navigation link to plant details page
  const species_name = selectedSpecies.split(' ').slice(1, ).join(' ') //pass this variable to item list
//   return (
//     <li>
//       <Link href="/plants/prisma_api/[speciesName]" as={`/plants/prisma_api${species_name}`}>
//         <a>Item {species_name}</a>
//       </Link>
//     </li>
//   )
// }
const speciesDetailsHandler = () => {
 // const species_name = selectedSpecies.split(' ').slice(1, ).join(' ')
  return (
    <li>
      <Link href='/'>gg</Link>
    </li>
  )
}
//Handle Query cancelled
const handleCancel=()=>{
    setCheckedStateColor(new Array(fruit_color_array.length).fill(false))
    setCheckedStateSize(new Array(fruit_size_array.length).fill(false))
     setData([])
}
console.log('query')
console.log(query)
console.log('JSON.stringfy(query)')
console.log(JSON.stringify(query))
const j= JSON.stringify(query)
console.log('/api/plants/prisma_api/multipleEntry/multipletrial?filters='+j)
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

return(
    <>
    <Box sx={{ display:'flex',padding:3}}>
        <Box>
        <p>Fruit Color</p>

        <Select style={{ width: "200px" }}
>

        {fruit_color_array.sort().map((color, index) =>(
            <FormGroup key={color}>
                <FormControlLabel            
                    control={<Checkbox checked={checkedStateColor[index]} onChange={() => handleOnChangeColor(index)}/>}
                    label={color}/>
            
            </FormGroup>))}
            </Select>
        </Box>
        <Box>
    <p>Fruit Size</p>

    <Select style={{ width: "200px" }}>
 {fruit_size_array.map((size, index) => {
        return(
          
        <FormGroup key={size}> 
            <FormControlLabel            
            control={<Checkbox checked={checkedStateSize[index]} onChange={() => handleOnChangeSize(index)}/>}
            label={size}/>
        </FormGroup>)})}</Select>
        </Box>
        <Box sx={{padding:3}}>
    <Button
      color='success'
      variant="contained" // add background
      onClick={() => {
        // handleOnChangeColor();
        // handleOnChangeSize();
        handleData()
        setQuery({'colors':[],'sizes':[]})
        }}>
                Submit Query
             </Button>
</Box>
<Box sx={{padding:3}}>
    <Button
    variant="contained" // add
    color='error'
      onClick={() => {
        handleCancel()  // cancel any box checked
        }}>Clear Query
             </Button>
</Box>
</Box>
<Box>
<Box>
{/* <p>{data.length} Records found based on your search creteria</p>
  {data.map((d)=>(
      <ul key={d.id}> 
      {d.genus.genus_name+ ' '+d.species_name}
      </ul>
     ))} */}
  
 <p>{data.length} Records found based on your search creteria</p>
 <FormControl> 
 {/* <InputLabel id="Input label">Select</InputLabel> */}
     <Select
        //  defaultMenuIsOpen
      // renderValue={(o) => o.label}  // add this line
      //   autofocus
      //   menuisopen='true'
      displayEmpty={true}
      native={false}
      labelId= "Input label"
      // id= "Select"
      autoWidth={true}
      defaultOpen={true}
       style={{ width: "400px" }}
       defaultValue={"value"}
       value={selectedSpecies}
       onChange={(e) => {
        selectSpecieHandler(e.target.value);
        // speciesDetailsHandler();
        }}>
       {!!data?.length &&  
         data.map((specie, index) => (
           <MenuItem key={index} value= {specie.genus.genus_name+ ' '+specie.species_name}>
             <Link href={`/plants/prisma_api/${specie.species_name}`} style={{ textDecoration:'none' }}>{specie.genus.genus_name+ ' '+specie.species_name}</Link>
           </MenuItem>
         ))}
     </Select>  
     </FormControl> 
</Box>
</Box>
</>
  );


// Form control - controls the size of the form

  }