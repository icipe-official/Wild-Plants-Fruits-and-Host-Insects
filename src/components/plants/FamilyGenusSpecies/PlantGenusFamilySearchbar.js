// This functional component implements cascading drop downs for plant Family-Genus-Species
// Import required libraries
// define state variables
// By default, family drop down shows the families available for user to select
// Selecting family calls the api for genus for the selected family
// and clears any available data of genus and species from previous search
// Selecting genus calls an api for fetching species data which are filterd based on the selected genus
// use Material UI to custom the styles of the page

// 1. Import required libraries
import { useRouter } from "next/router";
import { useState } from "react";
import { useEffect } from "react";
import Link from "next/link";
import {
  Box,
  Container,
  FormControl,
  IconButton,
  InputLabel,
  TextField,
  useMediaQuery,
} from "@mui/material";
import Select from "@mui/material/Select";
import MenuItem from "@mui/material/MenuItem";
// import { Router } from "next/router";
import Router from "next/router";
import useSWR from "swr";
import SearchIcon from "@mui/icons-material/Search";
const fetcher = (url) => fetch(url).then((r) => r.json());

export default function PlantFamilyGenusSpecies({ defaultValues }) {
  const router = useRouter();
  // manage sate of id's of selected plant family genus and species
  const [familyId, setFamilyId] = useState("");
  const [genusId, setGenusId] = useState("");
  const [speciesId, setSpeciesId] = useState("");
  // const {defaultValue} = props;

  ////console.log('Default Values: ', defaultValues);
  //handle search dunctionality
  const [searchTerm, setSearchTerm] = useState("");
  const [searchedSpecies, setSearchedSpecies] = useState([]);
  const [searchQuery, setSearchQuery] = useState("");
  const handleSearchChange = (e) => {
    setSearchQuery(e.target.value);
  };

  const handleSearch = () => {
    setFamilyId("");
    setGenusId("");
    setSpeciesData([]);
    setFamilyData([]);
    setSpeciesId("");

    // Filter the data based on the search term
    const filteredSpecies = data.filter((species) => {
      const speciesName = `${species.plant_genera.genus_name} ${species.species_name}`;
      return speciesName.toLowerCase().includes(searchTerm.toLowerCase());
    });

    if (filteredSpecies.length > 0) {
      const speciesId = filteredSpecies[0].id;
      // Redirect to the species detail page
      router.push(`/plants/${speciesId}`);
    }
  };

  // manage sate  of the data for family, genus and species
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

  const OnFamilyChange = (e) => {
    const filteredgenus = data.filter(
      (genus) => genus.plant_genera.plant_families.family_name == e.target.value
    );
    Router.push(`/plants/${filteredgenus.map((specie) => specie.id)[0]}`);

    const sortedgenus = filteredgenus.sort((a, b) => {
      if (a.genus < b.genus) {
        return -1;
      }
      if (a.genus > b.genus) {
        return 1;
      }
      return 0;
    });
    // setLoaded(true);
    setFamilyData(sortedgenus);

    setFamilyId(e.target.value);
    setGenusId("");
    setSpeciesId("");
    setSearchTerm("");
    setSpeciesData([]);
  };
  const handleDoubleClick = (e) => {
    Router.push({
      pathname: "/phylogeny",
      query: {
        plantFamily: familyData[0].plant_genera.plant_families.family_name,
      },
    });
  };
  const OnGenusChange = (e) => {
    const filterespecies = familyData.filter(
      (specie) => specie.plant_genera.genus_name == e.target.value
    );
    // setLoaded(true);
    ////console.log('filterespecies');

    ////console.log(filterespecies);
    setGenusData(filterespecies);
    // (error) => {
    //   setLoaded(true);
    //   setError(error);
    // }

    setGenusId(e.target.value);
    setSpeciesId("");
    setSearchTerm("");
  };

  const OnSpeciesChange = (e, specie) => {
    setSpeciesId(`${specie.plant_genera.genus_name} ${specie.species_name}`);

    Router.push(`/plants/${specie.id}`);

    // Router.push;
    ////console.log(speciesId);
  };
  const isSmallScreen = useMediaQuery(`(max-width: 1282px)`);

  if (data) {
    // convert the sets vto list
    const families = [
      ...new Set(
        data.map((species) => species.plant_genera.plant_families.family_name)
      ),
    ].sort();
    const genus = [
      ...new Set(familyData.map((species) => species.plant_genera.genus_name)),
    ];

    return (
      <Container
        sx={{
          display: isSmallScreen ? "block" : "flex",
          marginTop: isSmallScreen ? 12 : 6,
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
              onDoubleClick={(e) => handleDoubleClick(e)}
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
              marginLeft: isSmallScreen ? "1.5" : "3rem",
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
              defaultValue="value"
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
              marginLeft: isSmallScreen ? "0" : "3rem",
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
                  value={`${specie.plant_genera.genus_name} ${specie.species_name}`}
                  onClick={(e) => OnSpeciesChange(e, specie)}
                >
                  {`${specie.plant_genera.genus_name} ${specie.species_name}`}
                </MenuItem>
              ))}
            </Select>
          </FormControl>
          <Box
            sx={{
              marginTop: isSmallScreen ? "0rem" : "3rem",
              marginLeft: isSmallScreen ? "1.5rem" : 0,
              width: "100%",
            }}
          >
            <Box
              display="flex"
              // height={3}
              alignItems="center"
              sx={{ position: "relative" }}
            >
              <TextField
                type="text"
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                placeholder="Search species..."
                // sx={{ height: "60%" }} // Set the width to 80%
              />
              <IconButton
                onClick={handleSearch}
                sx={{
                  position: "absolute",
                  right: "0",
                  marginRight: "8px", // Adjust the margin as needed
                }}
              >
                <SearchIcon />
              </IconButton>
            </Box>
          </Box>
        </Box>
      </Container>
    );
  }
}
