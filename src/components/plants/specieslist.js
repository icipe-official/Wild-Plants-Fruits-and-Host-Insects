import { useState, useEffect } from "react";
import { useRouter } from "next/router";
import Box from "@mui/material/Box";
import Link from "next/link";
import { Button } from "@mui/material";
// import { Route, Router } from "react-router-dom";
import Router from "next/router";
import {useMediaQuery} from "@mui/material";
export default function Insectspecies({ data }) {
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));

  const [selectedIndex, setSelectedIndex] = useState(0);
  const handleItemClick = (index) => {
    setSelectedIndex(index);
  };
  const handlebacknavigate = (event) => {
    Router.back(
);
  };
  return (
    <Box>
      <Box sx={{ marginTop: "1rem", fontWeight: "bold" }}>
        {data.length} Plant species retrived. Click for more details
      </Box>
      <Box sx={{ display: "flex" }}>
        <Box
          sx={{
            height: "8rem",
            overflowY: "scroll",
            width:isSmallScreen? "100%": "70%",
            border: "1px solid #ccc",
          }}
        >
          {data.map((dat, index) => (
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
              }}
              onClick={() => handleItemClick(index)}
            >
              <Link
                href={`/plants/${dat.id}`}
                style={{ textDecoration: "none", color: "black" }}
              >
                {dat.plant_genera.genus_name} {dat.species_name}
              </Link>
            </Box>
            
          ))}
        </Box>
        
      </Box>
      <Box sx={{ marginTop: "1rem", fontWeight: "bold" }}>
        <Button onClick={handlebacknavigate}  textDecoration={"none"}>Back to multiple entry page</Button>

      </Box>
    </Box>
  );
}
