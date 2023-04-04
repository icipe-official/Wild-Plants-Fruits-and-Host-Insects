import { Box, Container, Stack } from "@mui/material";
import { makeStyles } from "@mui/styles";

const useStyles = makeStyles((theme) => ({
  maroonText: {
    color: 'maroon',
  },
  boldText: {
    fontWeight: 'bold',
    color: 'black',
  },
}));

export default function PlantSpecieFamilyGenusResult({plants_data}) {
  const classes = useStyles();

  return (
    plants_data.map((specie)=>
    <Box key={specie.id} sx={{marginTop:"2rem",marginLeft:"8rem"}}>
    <span className={classes.maroonText}>
      {specie.plant_genera.genus_name + " "}{specie.species_name}
    </span>
    <br/>
    <span className={classes.boldText}>
      Family: 
    </span>
    <span className={classes.maroonText}>
      {" "+specie.plant_genera.plant_families.family_name} 
    </span>
  </Box>
    )
  );
}
