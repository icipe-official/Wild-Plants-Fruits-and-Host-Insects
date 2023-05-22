import { Box, Container, Stack } from "@mui/material";
import { makeStyles } from "@mui/styles";
import { useState, useEffect } from "react";
import { useRouter } from "next/router";
import useSWR from "swr";
// const Index = () => {
//   const router = useRouter()
//   const {id} = router.query

//   return(<div>{id}</div>)
// }

const useStyles = makeStyles((theme) => ({
  maroonText: {
    color: "maroon",
  },
  boldText: {
    fontWeight: "bold",
    color: "black",
  },
}));
// const fetcher = (...args) => fetch(...args).then((res) => res.json());
// const fetcher = (...args) => fetch(...args).then((res) => res.json());
const fetcher = (url) => fetch(url).then((r) => r.json());

export default function PlantSpecieFamilyGenus(props) {
  // const [familyData, setFamilyData] = useState([]);
  const [loaded, setLoaded] = useState(false);
  // const [error, setError] = useState(null);
  const router = useRouter();
  // const species = router.query.speciesName;
  // Set the default species to "abutilum hirtum"
  const species = parseInt(router.query.species);
  const classes = useStyles();
  console.log("species plantfamily component");
  console.log(typeof species);
  // useEffect(() => {
  //   fetch(`/api/plantsPage/${species}`)
  //     .then((res) => res.json())
  //     .then(
  //       (result) => {
  //         setLoaded(true);
  //         setFamilyData(result);
  //       },
  //       (error) => {
  //         setLoaded(true);
  //         setError(error);
  //       }
  //     );
  // }, []);
  // const { data, error } = useSWR(key, fetcher);
  // const base_url = "http://localhost:3000";

  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

  const { data, error } = useSWR(
    `${base_url}/api/plants/plantsPage/${species}`,
    fetcher
  );
  // fetch(`/api/plantsPage/${species}`)
  if (error) return <div>Failed to load</div>;
  if (!data) return <div>Loading...</div>;
  console.log("familyData");
  console.log(data);
  console.log("species");
  console.log(species);
  // return data;
  return data.map((specie, index) => (
    <Box key={index} sx={{ marginTop: "0rem", fontWeight: "bold" }}>
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
