// import { useState, useEffect } from 'react';
// import { useRouter } from 'next/router';
import Box from "@mui/material/Box";
import { useState, useEffect } from "react";
import Link from "next/link";
import { connect } from "react-redux";
import useSWR from "swr";
import RegionsInsect from "./regeons";
import { useRouter } from "next/router";
import Router from "next/router";
import { Button } from "@mui/material";
// import { Container,ButtonBase } from '@mui/material';
// import Link from 'next/link';
export default function InsectQueryComponent({ genus_data }) {
  const [selectedIndexPlant, setSelectedIndexPlant] = useState(0);
  const [selected, setSelectedItem] = useState(null);
  const router = useRouter();
  const genus = router.query.genus;
  console.log("species");
  console.log(genus);
  const [selectedIndex, setSelectedIndex] = useState(0);
  function mapStateToProps(state) {
    return { count: state.count };
  }
  console.log("genus list  side");
  console.log(genus_data);
  const species = genus_data[selectedIndex].species_name;

  const handleItemClick = (specie, index) => {
    setSelectedIndex(index);
  };
  const handlebacknavigate = (event) => {
    const base_url = "http://192.168.43.92:3000";
    Router.push(`${base_url}/insects`);
  };
  if (genus_data) {
    return (
      <Box sx={{ marginTop: 6 }}>
        <Box sx={{ marginTop: "1rem", fontWeight: "bold" }}>
          {genus_data.length} Insect Species retrieved. Click each specie for
          details
        </Box>
        <Box>
          <Button onClick={() => handlebacknavigate(event)}>
            Back to Insects page
          </Button>
        </Box>
        <Box
          sx={{
            height: "8rem",
            overflowY: "scroll",
            width: "100%",
            border: "1px solid #ccc",
          }}
        >
          {" "}
          {genus_data.map((specie, index) => (
            <Box
              key={specie.id}
              sx={{
                backgroundColor:
                  index === 0 && selectedIndex !== 0
                    ? "inherit"
                    : selectedIndex === index
                    ? "gray"
                    : "inherit",
                color: selectedIndex === index ? "white" : "black",
              }}
              onClick={() => handleItemClick(specie, index)}
            >
              <Link
                href={{
                  pathname: `/insects/${specie.insect_genera.id}`,
                  query: {
                    genus: specie.insect_genera.id,
                    species: specie.id,
                  },
                }}
                // as={`/insects/${specie.insect_genera.genus_name}`}
                style={{ textDecoration: "none", color: "black" }}
              >
                {" "}
                {specie.insect_genera.genus_name} {specie.species_name}
              </Link>
            </Box>
          ))}
        </Box>
        <Box sx={{ marginTop: "1rem", fontWeight: "bold" }}></Box>
      </Box>
    );
  }
}
