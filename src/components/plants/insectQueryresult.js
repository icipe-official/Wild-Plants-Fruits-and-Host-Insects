import { useState, useEffect } from "react";
import { useRouter } from "next/router";
import Box from "@mui/material/Box";
import { Container, ButtonBase } from "@mui/material";
export default function ({ data }) {
  return (
    <Box sx={{ paddingTop: "2rem", marginLeft: 2 }}>
      <Box>
        <Box sx={{ marginTop: "1rem", fontWeight: "bold" }}>
          {species_list.length} Plant species returned based on your search
          query
        </Box>
        <Box sx={{ display: "flex" }}>
          <Box
            sx={{
              height: "8rem",
              overflowY: "scroll",
              width: "70%",
              border: "1px solid #ccc",
            }}
          >
            {species_list.map((dat, index) => (
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
                  href={`/plants/${dat.species_name}`}
                  style={{ textDecoration: "none", color: "black" }}
                >
                  {dat.plant_genera.genus_name} {dat.species_name}
                </Link>
              </Box>
            ))}
          </Box>
        </Box>
      </Box>
    </Box>
  );
}
