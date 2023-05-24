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
import Link from "next/link";
import {
  Box,
  Container,
  FormControl,
  InputLabel,
  useMediaQuery,
} from "@mui/material";
import Select from "@mui/material/Select";
import MenuItem from "@mui/material/MenuItem";
// import { Router } from "next/router";
import Router from "next/router";
import useSWR from "swr";
const fetcher = (url) => fetch(url).then((r) => r.json());

export default function PlantFamilyGenusSpecies({ defaultValues }) {
  //manage sate of id's of selected plant family genus and species
  const [familyId, setFamilyId] = useState("");
  const [genusId, setGenusId] = useState("");
  const [speciesId, setSpeciesId] = useState("");
  // const {defaultValue} = props;

  console.log("Default Values: ", defaultValues);

  //manage sate  of the data for family, genus and species
  const [familyData, setFamilyData] = useState([]);
  const [genusData, setGenusData] = useState([]);
  const [speciesData, setSpeciesData] = useState([]);
  const [loaded, setLoaded] = useState(false);
  // const [error, setError] = useState(null);
  // const base_url = "http://localhost:3000";
  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
  const { data, error, isLoading } = useSWR(
    `${base_url}/api/plants/species`,
    fetcher
    // {
    //   revalidateOnMount: false,
    // }
  );
  console.log("FamilyData");
  console.log("familyId");
  console.log(familyId);
  console.log("dataaa");
  console.log(data);

  //fetch genus based on genus selected
  //set the family id to the clicked family
  //set the family data to the fetched family data
  const OnFamilyChange = (e) => {
    // fetch(`${base_url}/api/plants/genus`)
    //   .then((res) => res.json())
    //   .then(
    //     (result) => {
    const filteredgenus = data.filter((genus) => {
      return genus.plant_genera.plant_families.family_name == e.target.value;
    });
    // setLoaded(true);
    setFamilyData(filteredgenus);
    console.log("filtered genus after clicking");

    console.log(filteredgenus);

    //     (error) => {
    //       setLoaded(true);
    //       setError(error);
    //     }
    //   );
    setFamilyId(e.target.value);
    setGenusId("");
    setSpeciesId("");
    setSpeciesData([]);
  };
  console.log("family data");
  console.log(familyData);

  console.log("Genus data");
  console.log(genusData);

  console.log("genusId");
  console.log(genusId);

  console.log("genus_data");
  console.log(genusData);
  console.log("genusId");

  console.log(genusId);
  console.log("speciesId");
  console.log(speciesId);

  const OnGenusChange = (e) => {
    // fetch species names based on family and genus selected
    // use the clicked family id
    // fetch(`${base_url}/api/plants/plantSpecies`)
    //   .then((res) => res.json())
    //   .then(
    //     (result) => {
    // const filteredspecies = familyData.filter((specie) => {
    //   return (
    //     // specie.plant_genera.genus_id == e.target.value &&
    //     specie.plant_genera.family_id == familyId
    //   );
    // }); /// mapping ids of family with that stored in familyid
    // // setLoaded(true);
    console.log(e);
    console.log(familyData);
    const filterespecies = familyData.filter((specie) => {
      return specie.plant_genera.genus_name == e.target.value;
    });
    // setLoaded(true);
    console.log("filterespecies");

    console.log(filterespecies);
    setGenusData(filterespecies);
    // (error) => {
    //   setLoaded(true);
    //   setError(error);
    // }

    setGenusId(e.target.value);
    setSpeciesId("");
  };

  const OnSpeciesChange = (e, specie) => {
    setSpeciesId(specie.plant_genera.genus_name + " " + specie.species_name);
    // const filteredspecies = genusData.filter((specie) => {

    //   return (
    //     // specie.plant_genera.genus_id == e.target.value &&
    //     specie.id == familyId
    //   );
    //   setSpeciesData(filteredspecies)
    // });
    console.log("speciesId");

    console.log(speciesId);
    Router.push(`/plants/${specie.id}`);

    Router.push;
    console.log(speciesId);
  };
  console.log("species_data");
  console.log(speciesId);
  console.log("speciesId");

  // // update form with default values on load
  // if (defaultValues != null) {
  //   setFamilyId("Malvaceae")
  // }

  console.log(speciesId);
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));
  if (data) {
    //convert the sets vto list
    const families = [
      ...new Set(
        data.map((species) => species.plant_genera.plant_families.family_name)
      ),
    ];
    const genus = [
      ...new Set(familyData.map((species) => species.plant_genera.genus_name)),
    ];
    // const species= [...new Set(genusData.map(species=>species.species_name))];

    console.log("families plant data");

    console.log(families);

    return (
      <Container
        sx={{
          display: isSmallScreen ? "block" : "flex",
          marginTop: isSmallScreen ? 8 : 3,
        }}
      >
        <Box sx={{ display: "flex" }}>
          <Box
            sx={{
              marginTop: isSmallScreen ? "0.5rem" : "3.5rem",
              fontWeight: "bold",
            }}
          >
            Family{" "}
          </Box>
          {/* <Box sx={{padding:0}}> */}
          <FormControl
            sx={{
              width: "100%",
              marginTop: isSmallScreen ? "0rem" : "2rem",
              marginLeft: "1.5rem",
            }}
          >
            <InputLabel id="Input label">Select</InputLabel>
            <Select
              name="family"
              style={{
                width: isSmallScreen ? "100%" : "200px",
                marginTop: isSmallScreen ? "0rem" : "1rem",
                height: "60%",
              }}
              value={familyId}
              onChange={(e) => OnFamilyChange(e)}
            >
              {families.map((family, index) => (
                <MenuItem key={index} value={family}>
                  {family}
                </MenuItem>
              ))}
            </Select>
          </FormControl>
          {/* </Box> */}
        </Box>
        <Box sx={{ display: "flex" }}>
          <Box
            sx={{
              marginTop: isSmallScreen ? "0rem" : "3.5rem",
              marginLeft: isSmallScreen ? "1.5" : "8rem",
              fontWeight: "bold",
            }}
          >
            Genus{" "}
          </Box>

          {/* <Box sx={{padding:0.5}}> */}
          <FormControl
            sx={{
              width: "100%",
              marginTop: isSmallScreen ? "0rem" : "2rem",
              marginLeft: isSmallScreen ? "1.5rem" : 0.5,
            }}
          >
            <InputLabel id="Input label">Select</InputLabel>
            <Select
              labelId="demo-simple-select-label"
              name="genus"
              style={{
                width: isSmallScreen ? "100%" : "200px",
                marginTop: isSmallScreen ? "0rem" : "1rem",
                height: "60%",
              }}
              defaultValue={"value"}
              value={genusId}
              onChange={(e) => OnGenusChange(e)}
            >
              {genus.map((genus, index) => (
                <MenuItem key={index} value={genus}>
                  {genus}
                </MenuItem>
              ))}
            </Select>
          </FormControl>

          {/* </Box> */}
        </Box>
        <Box sx={{ display: "flex" }}>
          <Box
            sx={{
              marginTop: isSmallScreen ? "0rem" : "3.5rem",
              marginLeft: isSmallScreen ? "0" : "8rem",
              fontWeight: "bold",
            }}
          >
            Species{" "}
          </Box>
          <FormControl
            sx={{
              width: "100%",
              marginTop: isSmallScreen ? "0rem" : "2rem",
              marginLeft: "0.5rem",
            }}
          >
            <InputLabel id="demo-simple-select-helper-label">Select</InputLabel>
            <Select
              labelId="demo-simple-select-helper-label"
              id="demo-simple-select-helper"
              label="Age"
              name="species"
              style={{
                width: isSmallScreen ? "100%" : "200px",
                marginTop: isSmallScreen ? "" : "1rem",
                height: "60%",
              }}
              //    defaultValue={"value"}
              value={speciesId}
            >
              {genusData.map((specie, index) => (
                // value must be equal to e.target.value
                <MenuItem
                  key={index}
                  value={
                    specie.plant_genera.genus_name + " " + specie.species_name
                  }
                  onClick={(e) => OnSpeciesChange(e, specie)}
                >
                  {specie.plant_genera.genus_name + " " + specie.species_name}
                </MenuItem>
              ))}
            </Select>
          </FormControl>
        </Box>
      </Container>
    );
  }
}
