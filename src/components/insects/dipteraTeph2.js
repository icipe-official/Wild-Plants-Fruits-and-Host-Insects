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
    width:'210px',
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

export default function DipteraTephridiae2Trial({ diptera_tephritideae_data, other_diptera_data }) {
  const [uniqueColeopteraData, setUniqueColeopteraData] = useState([]);
  const [selectedGenus, setSelectedGenus] = useState(null)
 
  useEffect(() => {
    const uniqueData = Array.from(new Set(diptera_tephritideae_data.map(item => item.insect_genera.genus_name))).map(name => {
      return diptera_tephritideae_data.find(item => item.insect_genera.genus_name === name);
    });
    setUniqueColeopteraData(uniqueData);
  }, [diptera_tephritideae_data]);
console.log(selectedGenus)
console.log(other_diptera_data)

//obtain frst four genus nanmes 
const firstThreeGenera = uniqueColeopteraData.slice(0, 4);
const remainingGenera = uniqueColeopteraData.slice(3);
const unique_other_diptera_data= Array.from(new Set(other_diptera_data.map(item => item.insect_families.family_name))).map(name => {
  return other_diptera_data.find(item => item.insect_families.family_name === name);
});
//pass the status to the insect details page
// on click, the selected genus name will be passed to getserverside prop function

const handleClick = (genus) => {
    Router.push(`/insects/${genus.species_name}`,
    )
  }
function mapStateToProps(state) {
  return { count: state.count }
}

console.log(selectedGenus)
  const classes = useStyles();

  return (
    <Box sx={{color:'blue',marginLeft:'1rem'}}>
      Order: Diptera (flies)
      <br/>
      Family: Tephritidae (fruit flies)
        {firstThreeGenera.map((genus) => (
          <ul key={genus.id} className={classes.ul}>
           <Button onClick={()=>{
            handleClick(genus)}}
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
            <Button
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
           <Button onClick={()=>setSelectedGenus(item.insect_families.family_name)}
           classes={{root: classes.button}}>
            {item.insect_families.family_name}
          </Button>
          </ul>
        ))}
    </Box>
  );
}
