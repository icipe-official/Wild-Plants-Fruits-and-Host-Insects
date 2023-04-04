import { useState, useEffect } from "react";
import { Box, Button, InputLabel } from '@mui/material'
import { makeStyles } from "@mui/styles";
//styles
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
    color: 'black',
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

export default function Hymenoptera({ other_hymenoptera_data,hym_ichumonoidae_data,hymenoptera_bracon_opiinae_data}) {
  const [uniqueColeopteraData, setUniqueColeopteraData] = useState([]);
  const [selectedGenus, setSelectedGenus] = useState('')
    const uniqueBraconidaeData = Array.from(new Set(hymenoptera_bracon_opiinae_data.map(item => item.insect_sub_families.sub_family_name))).map(name => {
      return hymenoptera_bracon_opiinae_data.find(item => item.insect_sub_families.sub_family_name === name);
    });
    const uniqueIchumonidaeData = Array.from(new Set(hym_ichumonoidae_data.map(item => item.insect_sub_families.sub_family_name))).map(name => {
        return hym_ichumonoidae_data.find(item => item.insect_sub_families.sub_family_name === name);
      });
      const uniqueOtherHymData = Array.from(new Set(other_hymenoptera_data.map(item => item.insect_families.family_name))).map(name => {
        return other_hymenoptera_data.find(item => item.insect_families.family_name === name);
      });
// const first25Genera = uniqueOtherHymData.slice(0, 32);
// const remainingGenera = uniqueOtherHymData.slice(32);
console.log("hymenoptera_bracon_opiinae_data")
console.log(hymenoptera_bracon_opiinae_data)
console.log("unique hymenoptera_bracon_opiinae_data")
console.log(uniqueBraconidaeData)
// console.log(hym_ichumonoidae_data)

const handleClick=(event)=>{
  setSelectedGenus(item)
}

  const classes = useStyles();

  return (
    <Box sx={{display:'flex'}}>
    <Box sx={{display:'column'}}>
    <Box sx={{color:'red',marginLeft:'1rem'}}>
      Hymenoptera (wasps)
      <br/>
      Braconidae
        {uniqueBraconidaeData.map((item) => (
          <ul key={item.id} className={classes.ul}>
           <Button onClick={()=>setSelectedGenus(item.insect_genera.genus_name)}
            classes={{root: classes.button}}>
            {item.insect_sub_families.sub_family_name}
          </Button>
          </ul>
        ))}
      </Box>

      <Box sx={{color:'red',marginLeft:'1rem'}}>
       Ichneumonidae
        {uniqueIchumonidaeData.map((item) => (
          <ul key={item.id} className={classes.ul}>
           <Button onClick={()=>setSelectedGenus(item.insect_genera.genus_name)}
            classes={{root: classes.button}}>
            {item.insect_sub_families.sub_family_name}
          </Button>
          </ul>
        ))}
      </Box>
      </Box>
      <Box sx={{color:'red',marginLeft:'1rem',paddingTop:'1rem'}}>
      Other Hymenoptera
        {uniqueOtherHymData.map((item) => (
          <ul key={item.id} className={classes.ul}>
           <Button onClick={()=>setSelectedGenus(item.insect_genera.genus_name)}
            classes={{root: classes.button}}>
            {item.insect_families.family_name}
          </Button>
          </ul>
        ))}
      </Box>
      
    </Box>
  );
}
