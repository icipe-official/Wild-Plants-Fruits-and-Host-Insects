import { Box, useMediaQuery } from "@mui/material";
import { makeStyles } from "@mui/styles";
import { useRouter } from "next/router";
import useSWR from "swr";
import { useState } from "react";
const useStyles = makeStyles((theme) => ({
  maroonText: {
    color: "maroon",
  },
  boldText: {
    fontWeight: "bold",
    color: "black",
  },
}));

const fetcher = (url) => fetch(url).then((r) => r.json());

export default function PlantSpecieFamilyGenus(props) {
  const router = useRouter();
  const species = parseInt(router.query.species);
  const classes = useStyles();
  const isSmallScreen = useMediaQuery(`(max-width: 1282px)`);

  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

  const { data, error } = useSWR(
    `${base_url}/api/plants/plantsPage/${species ? species : 1}`,
    fetcher
  );

  if (error) return <div>Failed to load</div>;
  if (!data) return <div>Loading...</div>;

  return data.map((specie, index) => (
    <Box
      key={index}
      sx={{
        fontWeight: "bold",
        marginTop: isSmallScreen ? 3 : 2,
        marginBottom: isSmallScreen ? 2 : 0,
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
