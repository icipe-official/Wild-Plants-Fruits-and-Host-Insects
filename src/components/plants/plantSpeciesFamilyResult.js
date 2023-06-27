import { Box, Container, Stack, useMediaQuery } from "@mui/material";
import { makeStyles } from "@mui/styles";

const useStyles = makeStyles((theme) => ({
  maroonText: {
    color: "maroon",
  },
  boldText: {
    fontWeight: "bold",
    color: "black",
  },
}));

export default function PlantSpecieFamilyGenusResult({ plants_data }) {
  const isSmallScreen = useMediaQuery(`(max-width: 1282px)`);

  const classes = useStyles();
  return plants_data.map((specie) => (
    <Box
      key={specie.id}
      sx={{
        marginTop: isSmallScreen ? 2 : 0,
        marginLeft: isSmallScreen ? "0" : "8rem",
        fontWeight: "bold",
      }}
    >
      Species:
      <span className={classes.maroonText}>
        {`${specie.plant_genera.genus_name} `}
        {specie.species_name}
      </span>
      <br />
      <span className={classes.boldText}>Family:</span>
      <span className={classes.maroonText}>
        {` ${specie.plant_genera.plant_families.family_name}`}
      </span>
    </Box>
  ));
}
