// import { useState, useEffect } from 'react';
// import { useRouter } from 'next/router';
import Box from "@mui/material/Box";
import { useState } from "react";
import Link from "next/link";

// import { Container,ButtonBase } from '@mui/material';
// import Link from 'next/link';
export default function RegionsInsect({ regions_collected_data }) {
  //regions collected
  console.log("regions_collected_data");

  console.log(regions_collected_data);
  return (
    <Box sx={{ marginBottom: 2 }}>
      <Box sx={{fontWeight: "bold" }}>
        Regions collected
      </Box>
      <Box
        sx={{
          height: 50,
          overflowY: "scroll",
          width: "100%",
          border: "1px solid #ccc",
        }}
      >
        {regions_collected_data.map((specie, index) =>
          specie.insects_regions.map((region) => region.regions.region + ", ")
        )}
      </Box>
    </Box>
  );
}
