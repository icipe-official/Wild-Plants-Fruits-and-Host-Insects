import { Box, Container, Stack } from "@mui/material";
import { makeStyles } from "@mui/styles";
import { useMediaQuery } from "@mui/material";

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
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));

  const classes = useStyles();
  return plants_data.map((specie) => (
    <Box
      key={specie.id}
      sx={{
        marginTop: 2,
        marginLeft: isSmallScreen ? "0" : "8rem",
        fontWeight: "bold",
      }}
    >
      Species:
      <span className={classes.maroonText}>
        {specie.plant_genera.genus_name + " "}
        {specie.species_name}
      </span>
      <br />
      <span className={classes.boldText}>Family:</span>
      <span className={classes.maroonText}>
        {" " + specie.plant_genera.plant_families.family_name}
      </span>
    </Box>
  ));
}
