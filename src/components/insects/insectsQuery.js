import { useState, useEffect } from "react";
import { useRouter } from "next/router";
import Box from "@mui/material/Box";
import Link from "next/link";
import useSWR from "swr";
import Router from "next/router";
import { Button } from "@mui/material";

export default function InsectQueryComponent({ genus_data }) {
  const [selectedSpecies, setSelectedSpecies] = useState(null);
  const [data, setData] = useState(genus_data); // Add state for genus_data
  const router = useRouter();
  const { genus, species } = router.query;

  useEffect(() => {
    // Find the species object whose ID matches the query parameter
    const selectedSpecies = genus_data.find(
      (specie) => specie.id === parseInt(species)
    );
    if (selectedSpecies) {
      setSelectedSpecies(selectedSpecies);
    }

    // Move the selected species to the beginning of the array
    if (selectedSpecies && genus_data.length > 1) {
      const filteredSpecies = genus_data.filter(
        (specie) => specie.id !== selectedSpecies.id
      );
      setSelectedSpecies(selectedSpecies);
      setData([selectedSpecies, ...filteredSpecies]); // Use setData to update genus_data
    }
  }, [species, genus_data]);

  const handleItemClick = (specie) => {
    setSelectedSpecies(specie);
  };

  const handleBackNavigate = () => {
    const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
    Router.push(`${base_url}/insects`);
  };

  if (data) {
    // Update variable name from genus_data to data
    return (
      <Box sx={{ marginTop: 6 }}>
        <Box sx={{ marginTop: "1rem", fontWeight: "bold" }}>
          {data.length} Insect Species retrieved. Click each specie for details
        </Box>
        <Box>
          <Button onClick={handleBackNavigate}>Back to Insects page</Button>
        </Box>
        <Box
          sx={{
            height: "8rem",
            overflowY: "scroll",
            width: "100%",
            border: "1px solid #ccc",
          }}
        >
          {data.map((specie) => (
            <Box
              key={specie.id}
              sx={{
                backgroundColor:
                  selectedSpecies && selectedSpecies.id === specie.id
                    ? "gray"
                    : "inherit",
                color:
                  selectedSpecies && selectedSpecies.id === specie.id
                    ? "white"
                    : "black",
              }}
              onClick={() => handleItemClick(specie)}
            >
              <Link
                href={{
                  pathname: `/insects/${specie.insect_genera.id}`,
                  query: {
                    genus: specie.insect_genera.id,
                    species: specie.id,
                  },
                }}
                style={{ textDecoration: "none", color: "black" }}
              >
                {specie.insect_genera.genus_name} {specie.species_name}
              </Link>
            </Box>
          ))}
        </Box>
        <Box sx={{ marginTop: "1rem", fontWeight: "bold" }} />
      </Box>
    );
  }

  return null;
}
