import { Box } from "@mui/material";
import React, { useState } from "react";

export default function NewickDownload({newick,data}) {
//   const [data, setData] = useState([]);
if(newick,data){

  const handleDownloadNewick = () => {
   
    // Create a new Blob object with the converted data and specify the MIME type
    const blob = new Blob([newick], { type: "text/plain" });

    // Create a new URL object with the Blob object and create a download link
    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.href = url;
    link.download = `${data[0].plant_genera.plant_families.family_name}.newick`;
    document.body.appendChild(link);
    link.click();

    // Clean up by revoking the URL object
    URL.revokeObjectURL(url);
    document.body.removeChild(link);
  };
  return (
    <Box>
      <button onClick={handleDownloadNewick}>Download newick</button>
    </Box>
  );
}}
