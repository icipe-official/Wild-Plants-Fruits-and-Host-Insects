import { useRouter } from "next/router";
import { useState } from "react";
import { Box, TextField, IconButton } from "@mui/material";
import SearchIcon from "@mui/icons-material/Search";
import ClearIcon from "@mui/icons-material/Clear";
import useSWR from "swr";

const fetcher = (url) => fetch(url).then((r) => r.json());

export default function CombinedSearchPlantsInsects({ defaultValues }) {
  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
  const {
    data: plantData,
    error: plantError,
    isLoading: plantIsLoading,
  } = useSWR(`${base_url}/api/plants/species`, fetcher, {
    revalidateOnMount: false,
    shouldRetryOnError: false,
    refreshWhenHidden: false,
    refreshWhenOffline: false,
    refreshInterval: 0,
  });
  const {
    data: insectData,
    error: insectError,
    isLoading: insectIsLoading,
  } = useSWR(`${base_url}/api/insects/species`, fetcher, {
    revalidateOnMount: false,
    shouldRetryOnError: false,
    refreshWhenHidden: false,
    refreshWhenOffline: false,
    refreshInterval: 0,
  });
  const router = useRouter();
  const [searchTerm, setSearchTerm] = useState("");
  const isSearchTermEmpty = searchTerm.trim() === "";

  const handleSearch = () => {
    // Search logic for plants
    const filteredPlantSpecies = plantData?.filter((species) => {
      const speciesName = `${species.plant_genera.genus_name} ${species.species_name}`;
      const regex = new RegExp(`\\b${searchTerm}\\b`, "i");
      return regex.test(speciesName);
    });

    if (filteredPlantSpecies?.length > 0) {
      const speciesId = filteredPlantSpecies[0];
      router.push({
        pathname: `/plants/${speciesId.id}`,
        query: {
          familyName: speciesId.plant_genera.plant_families.family_name,
          genusName: speciesId.plant_genera.genus_name,
        },
      });
      return;
    }

    // Search logic for insects
    const filteredInsectSpecies = insectData.filter((species) => {
      const speciesName = `${species.insect_genera.genus_name} ${species.species_name}`;
      const regex = new RegExp(`\\b${searchTerm}\\b`, "i");
      return regex.test(speciesName);
    });

    if (filteredInsectSpecies.length > 0) {
      const speciesId = filteredInsectSpecies[0];
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
  };

  const handleCancel = () => {
    setSearchTerm("");
  };

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
          placeholder="Search Species..."
          sx={{
            flex: 1,
          }}
        />
        {searchTerm && (
          <IconButton
            onClick={handleCancel}
            sx={{
              position: "absolute",
              right: "48px",
              top: "50%",
              transform: "translateY(-50%)",
            }}
          >
            <ClearIcon />
          </IconButton>
        )}
        <IconButton
          onClick={handleSearch}
          disabled={isSearchTermEmpty}
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
