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
    color: 'maroon',
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

export default function Lepidoptera({ lepidoptera_data }) {
  const [uniqueColeopteraData, setUniqueColeopteraData] = useState([]);
  const [selectedGenus, setSelectedGenus] = useState(null)

  useEffect(() => {
    const uniqueData = Array.from(new Set(lepidoptera_data.map(item => item.insect_families.family_name))).map(name => {
      return lepidoptera_data.find(item => item.insect_families.family_name === name);
    });
    setUniqueColeopteraData(uniqueData);
  }, [lepidoptera_data]);
  const classes = useStyles();


//   const firstTwenty = uniqueColeopteraData.slice(0, 19);
//   const remainingGenera = uniqueColeopteraData.slice(19);
  
  return (
    <Box sx={{display:'flex',marginLeft:'1rem'}}>
    <Box sx={{color:"maroon"}}>
       Lepidoptera
      <br/>
      (moths and buttaflies)
      {uniqueColeopteraData.map((item) => (
          <ul key={item.id} className={classes.ul}>
           <Button onClick={()=>setSelectedGenus(item.insect_genera.genus_name)}
            classes={{root: classes.button}}>
            {item.insect_families.family_name}
          </Button>
          </ul>
        ))}
      
      </Box>
      {/* <Box sx={{marginTop:'3rem',marginLeft:'-3rem'}}>
      {remainingGenera.map((item) => (
          <ul key={item.id} className={classes.ul}>
           <Button onClick={()=>setSelectedGenus(item.insect_genera.genus_name)}
            classes={{root: classes.button}}>
            {item.insect_families.family_name}
          </Button>
          </ul>
        ))}
      </Box> */}
    </Box>
  );
}
