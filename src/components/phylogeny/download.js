import { Box } from "@mui/material";
import React, { useState } from "react";

export default function SequenceDownload({data}) {
//   const [data, setData] = useState([]);
if(data){

  const handleDownload = () => {
    // Convert the data into a string in FASTA format
    const fastaString = data.map((sequence) => {
        if (sequence.matk!=='Nan'){
        const { plant_genera: { genus_name }, species_name, matk } = sequence;
      const header = `>${genus_name} ${species_name}\n`;
      return header + matk;
   } }).join('\n');

    // Create a new Blob object with the converted data and specify the MIME type
    const blob = new Blob([fastaString], { type: "text/plain" });

    // Create a new URL object with the Blob object and create a download link
    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.href = url;
    link.download = `${data[0].plant_genera.plant_families.family_name}.fasta`;
    document.body.appendChild(link);
    link.click();

    // Clean up by revoking the URL object
    URL.revokeObjectURL(url);
    document.body.removeChild(link);
  };
  return (
    <Box>
      <button onClick={handleDownload}>Download data in FASTA format</button>
    </Box>
  );
}}
