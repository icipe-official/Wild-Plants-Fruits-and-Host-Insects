import { useState, useEffect } from "react";
import { Box, Button, InputLabel } from '@mui/material'
import { makeStyles } from "@mui/styles";
import Router from 'next/router';

// custom MUIstyles
const useStyles = makeStyles({
  root: {
    margin: 0,
    padding: 0,
    listStyle: 'none',
  },

  ul: {
    margin: 0,
    padding: 0,
    display: 'flex',
    flexDirection: 'row',
    flexWrap: 'wrap',
    alignItems: 'center',
    justifyContent: 'flex-start',
    gap: '1px',
    marginBottom: '-1px',

  },
  button: {
    border: '1px solid rgba(0.0, 0, 0, 0.3)',
    padding: '5px 0',
    textTransform: 'none',
    margin: 0,
    height: 'auto',
    lineHeight: '1',
    fontSize: '16px',
    fontWeight: '400',
    borderRadius: '4px',
    backgroundColor: 'transparent',
    color: 'blue',
    paddingBottom: 0,
    minWidth: 0,
    width:'200px',
    transition: 'none',
    '&:hover': {
      backgroundColor: 'transparent',
    },
    '&:focus': {
      outline: 'none',
    },
    '&::before': {
      display: 'none',
    },
    '&::after': {
      display: 'none',
    },
    '&:not(:first-child)': {
      borderLeft: '1px solid rgba(0, 0, 0, 0.1)',
    },
  },

});
import Link from 'next/link';
import { connect } from 'react-redux'

import { useState, useEffect } from "react";
import { Box, Button, InputLabel } from '@mui/material'
import { makeStyles } from "@mui/styles";
import Router from 'next/router';
import { setSelectedGenus } from '../../../redux/actions';


import Link from 'next/link';
import { connect } from 'react-redux'


function DipteraTephridiaeredux({ diptera_tephritideae_data, other_diptera_data, selectedGenus, setSelectedGenus }) {
 const [uniqueColeopteraData, setUniqueColeopteraData] = useState([]);
 useEffect(() => {
   const uniqueData = Array.from(new Set(diptera_tephritideae_data.map(item => item.insect_genera.genus_name))).map(name => {
     return diptera_tephritideae_data.find(item => item.insect_genera.genus_name === name);
   });
   setUniqueColeopteraData(uniqueData);
 }, [diptera_tephritideae_data]);


 const classes = useStyles();


 return (
   <Box sx={{color:'blue',marginLeft:'1rem'}}>
     Diptera (flies)
     <br/>
     Tephritidae (fruit flies)
       {firstThreeGenera.map((genus) => (
         <ul key={genus.id} className={classes.ul}>
          <Button onClick={() => setSelectedGenus(genus.insect_genera.genus_name)}
           classes={{root: classes.button}}>
           {genus.insect_genera.genus_name}
         </Button>
         </ul>
       ))}
    
     {remainingGenera.length > 0 && (
       <Box>
         <Button onClick={() => setSelectedGenus(remainingGenera)}
           classes={{root: classes.button}}>
           Other genera
         </Button>
       </Box>
     )}
     {selectedGenus && (
       <Box>
         {remainingGenera.map((item) => (
           <ul key={item.id} className={classes.ul}>
           <Button onClick={() => setSelectedGenus(item.insect_genera.genus_name)}
           classes={{root: classes.button}}>
             {item.insect_genera.genus_name}
           </Button>
           </ul>
         ))}
       </Box>
     )}


       <Box sx={{fontWeight:'bold',marginLeft:'1rem',color:'black'}}>
       Other families</Box>


        {unique_other_diptera_data.map((item) => (
         <ul key={item.id} className={classes.ul}>
          <Button onClick={() => setSelectedGenus(item.insect_families.family_name)}
          classes={{root: classes.button}}>
           {item.insect_families.family_name}
         </Button>
         </ul>
       ))}
   </Box>
 );
}


function mapStateToProps(state) {
 return { selectedGenus: state.selectedGenus }
}


function mapDispatchToProps(dispatch) {
 return {
   setSelectedGenus: (genus) => dispatch(setSelectedGenus(genus))
 }
}


export default connect(mapStateToProps, mapDispatchToProps)(DipteraTephridiae2);