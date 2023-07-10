import { useState } from "react";
import Box from "@mui/material/Box";
import { Button, useMediaQuery } from "@mui/material";
import Router from "next/router";

export default function Insectspecies({ data, onSpeciesSelect }) {
  if (typeof data !== "undefined") {
    const isSmallScreen = useMediaQuery((theme) =>
      theme.breakpoints.down("sm")
    );
    const [selectedIndex, setSelectedIndex] = useState(0); // Updated: Set initial index to 0
    const handleItemClick = (index) => {
      setSelectedIndex(index);
      const selectedSpecies = data[index];
      onSpeciesSelect(selectedSpecies);
    };

    const handlebacknavigate = (event) => {
      Router.back();
    };

    return (
      <Box>
        <Box sx={{ marginTop: "1rem", fontWeight: "bold" }}>
          {data?.length} Plant species retrieved. Click for more details
        </Box>
        <Box sx={{ display: "flex" }}>
          <Box
            sx={{
              height: "8rem",
              overflowY: "scroll",
              width: isSmallScreen ? "100%" : "70%",
              border: "1px solid #ccc",
            }}
          >
            {data?.map((dat, index) => (
              <Box
                key={dat.id}
                sx={{
                  backgroundColor:
                    index === 0 && selectedIndex !== 0
                      ? "inherit"
                      : selectedIndex === index
                      ? "gray"
                      : "inherit",
                  color: selectedIndex === index ? "white" : "black",
                  cursor: "pointer", // Add this line
                }}
                onClick={() => handleItemClick(index)}
              >
                {/*             
                href={`/plants/${dat.id}`}
                style={{ textDecoration: "none", color: "black" }}
              > */}
                {dat.plant_genera.genus_name} {dat.species_name}
              </Box>
            ))}
          </Box>
        </Box>
        <Box sx={{ marginTop: "1rem", fontWeight: "bold" }}>
          <Button onClick={handlebacknavigate} textDecoration="none">
            Back to multiple entry page
          </Button>
        </Box>
      </Box>
    );
  }
}
