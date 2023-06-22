// import { useState, useEffect } from 'react';
// import { useRouter } from 'next/router';
import Box from "@mui/material/Box";
import { useState } from "react";
import Link from "next/link";

// import { Container,ButtonBase } from '@mui/material';
// import Link from 'next/link';
export default function FruitsReared({ fruits_reared_data }) {
  const [selectedIndexPlant, setSelectedIndexPlant] = useState(0);
  const [selected, setSelectedItem] = useState(null);
  const [selectedIndex, setSelectedIndex] = useState(0);
  // const base_url = "http://localhost:3000";

  ////console.log(fruits_reared_data);
  const fruits = fruits_reared_data.map((fruit) =>
    fruit.plants_insects.map((specie) => specie.plants)
  )[0]; // [0] extract the first object
  ////console.log('fruits reatred Fruits functionsl component');
  ////console.log(fruits);

  const handleItemClick = (index) => {
    setSelectedIndex(index);
  };
  return (
    <Box sx={{ paddingBottom: "1rem" }}>
      <Box sx={{ marginTop: "1rem", fontWeight: "bold" }}>
        {fruits.length} Fruits from which the insect was reared. click for
        details
      </Box>
      <Box
        sx={{
          height: "6rem",
          overflowY: "scroll",
          width: "100%",
          border: "1px solid #ccc",
        }}
      >
        {fruits.map((dat, index) => (
          <Box
            key={dat.id}
            // sx={{
            //   backgroundColor:
            //     index === 0 && selectedIndexPlant !== 0
            //       ? "inherit"
            //       : selectedIndexPlant === index
            //       ? "gray"
            //       : "inherit",
            //   color: selectedIndexPlant === index ? "white" : "black",
            // }}
          >
            <Link
              href={`/plants/${dat.id}`}
              style={{ textDecoration: "none", color: "black" }}
            >
              {dat.plant_genera.genus_name} {dat.species_name}
            </Link>
          </Box>
        ))}
        <Box />
      </Box>
    </Box>
  );
}
