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
import Router from "next/router";
import useSWR from "swr";
import SearchIcon from "@mui/icons-material/Search";
import ClearIcon from "@mui/icons-material/Clear"; // Import the ClearIcon component

const fetcher = (url) => fetch(url).then((r) => r.json());

export default function Insectssearch({ defaultValues }) {
  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
  const { data, error, isLoading } = useSWR(
    `${base_url}/api/insects/species`,
    fetcher
  );
  const router = useRouter();
  const [searchTerm, setSearchTerm] = useState("");

  const handleSearch = () => {
    if (searchTerm.length > 1) {
      const filteredSpecies = data.filter((species) => {
        const speciesName = `${species.insect_genera.genus_name.trim()} ${species.species_name.trim()}`;
        const regex = new RegExp(`\\b${searchTerm}\\b`, "i");
        return regex.test(speciesName);
      });

      if (filteredSpecies.length > 0) {
        const speciesId = filteredSpecies[0];
        router.push({
          pathname: `/insects/${speciesId.insect_genera.id}`,
          query: {
            genus: speciesId.insect_genera.id,
            species: speciesId.id,
            speciesName:
              speciesId.insect_genera.genus_name +
              " " +
              speciesId.species_name.replace(/\.\s*\d+/g, "").trim(),
            order: speciesId.insect_orders.order_name,
          },
        });
      }
    }
  };

  const handleCancel = () => {
    setSearchTerm(""); // Clear the search term
  };

  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));
  if (data)
    return (
      <Box>
        <Box
          display="flex"
          alignItems="center"
          sx={{
            position: "relative",
            width: "100%",
            marginBottom: 2,
          }}
        >
          <TextField
            type="text"
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            placeholder="Search Insect Species..."
            sx={{
              flex: 1,
            }}
          />
          {searchTerm && ( // Render the ClearIcon if there is a search term
            <IconButton
              onClick={handleCancel}
              sx={{
                position: "absolute",
                right: isSmallScreen ? "36px" : "48px", // Adjust the positioning based on screen size
                top: "50%",
                transform: "translateY(-50%)",
              }}
            >
              <ClearIcon />
            </IconButton>
          )}
          <IconButton
            onClick={handleSearch}
            sx={{
              position: "absolute",
              right: "0",
              top: "50%",
              transform: "translateY(-50%)",
            }}
          >
            <SearchIcon />
          </IconButton>
        </Box>
      </Box>
    );
}
