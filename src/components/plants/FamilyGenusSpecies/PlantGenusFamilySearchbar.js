//This functional component implements cascading drop downs for plant Family-Genus-Species
//Import required libraries
// define state variables
//By default, family drop down shows the families available for user to select
// Selecting family calls the api for genus for the selected family 
// and clears any available data of genus and species from previous search
// Selecting genus calls an api for fetching species data which are filterd based on the selected genus
// use Material UI to custom the styles of the page

//1. Import required libraries
import { useState } from "react";
import { useEffect } from "react";
import Link from 'next/link';
import { Box,FormControl, InputLabel,useMediaQuery } from '@mui/material'
import Select from '@mui/material/Select'
import MenuItem from '@mui/material/MenuItem'

export default function  PlantFamilyGenusSpecies() {
    //manage sate of id's of selected plant family genus and species
    const [familyId,setFamilyId]=useState('')
    const [genusId,setGenusId]=useState('')
    const [speciesId,setSpeciesId]=useState('')

    //manage sate  of the data for family, genus and species
    const [familyData,setfamilyData]=useState([])
    const [genusData,setGenusData]=useState([])
    const [speciesData,setSpeciesData]=useState([])
    const [loaded,setLoaded]=useState(false)
    const [error,setError]=useState(null)
    
    // By default, plant family will be fetched upon opening the website
    //use family API to fetch plant families and their id's
    useEffect(() => {
                fetch('/api/plants/families')
                    .then((res) => res.json()) 
                    .then(
                        (result) => {
                            setLoaded(true);
                            setfamilyData(result);
                        },
                        (error) => {
                            setLoaded(true);
                            setError(error);
                        }
                    );
            }, []);
//
console.log('FamilyData')
console.log('familyId')
console.log(familyId)
console.log('speciesId')
console.log(speciesId)

    //fetch genus based on genus selected
    //set the family id to the clicked family
    //set the family data to the fetched family data  
    const OnFamilyChange = (e) => {
      fetch('/api/plants/genus')
            .then((res) => res.json())
            .then(
                (result) => {
                    const filteredgenus= result.filter((genus) => {
                    return genus.family_id == e.target.value});
                    setLoaded(true);
                    setGenusData(filteredgenus)  
                },
                (error) => {
                    setLoaded(true);
                    setError(error);
                }
            );
        setFamilyId(e.target.value)
        setGenusId("")
        setSpeciesId( "")
        setSpeciesData([])
    };
    console.log('family data')
    console.log(familyData)

    console.log('Genus data')
    console.log(genusData)

    console.log('genusId')
    console.log(genusId)

    console.log('genus_data')
    console.log(genusData)
    console.log('genusId')

    console.log(genusId)
    console.log('speciesId')
    console.log(speciesId)

    const OnGenusChange = (e) => {
            // fetch species names based on family and genus selected
            // use the clicked family id 
                    fetch('/api/plants/plantSpecies')
                        .then((res) => res.json())
                        .then(
                            (result) => {
                                const filteredspecies= result.filter((specie) => {
                                return specie.genus_id == e.target.value &&
                                        specie.plant_genera.family_id==familyId});    /// mapping ids of family with that stored in familyid
                                setLoaded(true);
                                setSpeciesData(filteredspecies)
                                
                            },
                            (error) => {
                                setLoaded(true);
                                setError(error);
                            }
                        );

        setGenusId(e.target.value)
        setSpeciesId("")
        

    };
  
    const OnSpeciesChange = (e) => {
        setSpeciesId(e.target.value);
        // console.log(speciesId)

    };
    console.log('species_data')
    console.log(speciesData)
    console.log('speciesId')

    console.log(speciesId)
    const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));
      return (
<Box sx={{ display: isSmallScreen ? 'block':'flex',marginTop:isSmallScreen?'0rem':'1rem'}}>
    <Box sx={{display:'flex'}}>
    <Box sx={{marginTop: isSmallScreen? '0.5rem':'3.5rem',fontWeight:"bold"}}>Family </Box>
    {/* <Box sx={{padding:0}}> */}
    <FormControl sx={{ width: '100%',marginTop:isSmallScreen?'0rem':'2rem',marginLeft:'1.5rem'}}> 

            <InputLabel id="Input label">Select</InputLabel>
             <Select
                 name='family'
                 style={{ width: isSmallScreen ? "100%" : "200px",marginTop: isSmallScreen? '0rem':'1rem',height:'60%'}}
                 value={familyId}
                 onChange={(e) => OnFamilyChange(e)}
                 >
                 {familyData.map((family, index) => (
                    <MenuItem key={index} value= {family.id}>{family.family_name}
                    </MenuItem>
                     ))}
            </Select>  
        </FormControl> 
        {/* </Box> */}
    </Box>
<Box sx={{display:'flex'}}>
<Box sx={{marginTop: isSmallScreen? '0rem':'3.5rem',marginLeft: isSmallScreen?"1.5":"12",fontWeight:"bold"}}>Genus </Box>

    {/* <Box sx={{padding:0.5}}> */}
    <FormControl sx={{ width: '100%',marginTop:isSmallScreen?'0rem':'2rem',marginLeft:isSmallScreen?'1.5rem':0.5}}> 
 <InputLabel id="Input label">Select</InputLabel>
     <Select
    labelId="demo-simple-select-label"
        name='genus'
        style={{ width: isSmallScreen ? "100%" : "200px",marginTop: isSmallScreen? '0rem':'1rem',height:'60%'}}

        defaultValue={"value"}
       value={genusId}
       onChange={(e) => OnGenusChange(e)}       >
       {genusData.map((genus, index) => (
           <MenuItem key={index} value= {genus.id}>{genus.genus_name}
           </MenuItem>
         ))}
     </Select>  
     </FormControl> 

{/* </Box> */}
</Box>
<Box sx={{display:'flex'}}>
<Box sx={{marginTop: isSmallScreen? '0rem':'3.5rem',marginLeft: isSmallScreen?"0":"12",fontWeight:"bold"}}>Species </Box>
<FormControl sx={{ width: '100%',marginTop:isSmallScreen?'0rem':'2rem',marginLeft:'0.5rem'}}> 

 <InputLabel   id="demo-simple-select-helper-label"
>Select</InputLabel>
     <Select
    labelId="demo-simple-select-helper-label"
    id="demo-simple-select-helper"
    label="Age"
    name='species'
    style={{ width: isSmallScreen ? "100%" : "200px",marginTop: isSmallScreen? '':'1rem',height:'60%'}}


    //    defaultValue={"value"}
       value={speciesId}
       onChange={(e) => OnSpeciesChange(e)}>
       {speciesData.map((specie, index) => (
        // value must be equal to e.target.value
           <MenuItem key={index} value= {specie.plant_genera.genus_name+ ' '+specie.species_name}> 
            <Link href={`/plants/${specie.species_name}`}style={{ textDecoration:'none',color:"black"}}>{specie.plant_genera.genus_name+ ' '+specie.species_name}</Link>
           </MenuItem>
         ))}
     </Select>  
     </FormControl>   
</Box>
</Box>

)}
 