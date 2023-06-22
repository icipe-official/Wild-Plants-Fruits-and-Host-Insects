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

export default function Insectssearch({ defaultValues }) {
  // manage sate  of the data for family, genus and species
  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
  const { data, error, isLoading } = useSWR(
    `${base_url}/api/insects/species`,
    fetcher
  );
  const router = useRouter();
  // manage sate of id's of selected plant family genus and species
  const [searchTerm, setSearchTerm] = useState("");

  const handleSearch = () => {
    // Filter the data based on the search term
    const filteredSpecies = data.filter((species) => {
      // console.log("species");

      // console.log(
      //   `${species.insect_genera.genus_name.trim()} ${species.species_name.trim()}`
      // );
      const speciesName = `${species.insect_genera.genus_name.trim()} ${species.species_name.trim()}`;
      return speciesName.toLowerCase().includes(searchTerm.toLowerCase());
    });

    if (filteredSpecies.length > 0) {
      const speciesId = filteredSpecies[0];
      console.log(" insect speciesId");

      console.log(speciesId);

      // Redirect to the species detail page
      router.push({
        pathname: `/insects/${speciesId.insect_genera.id}`,
        query: {
          genus: speciesId.insect_genera.id,
          species: speciesId.id,
        },
      });
    }
  };

  ////console.log(speciesId);
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));
  if (data)
    return (
      <Container>
        <Box display="flex" alignItems="center" sx={{ position: "relative" }}>
          <TextField
            type="text"
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            placeholder="Search species..."
          />
          <IconButton
            onClick={handleSearch}
            sx={{
              position: "absolute",
              right: "0",
              marginRight: "8px",
            }}
          >
            <SearchIcon />
          </IconButton>
        </Box>
      </Container>
    );
}
