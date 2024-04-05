import { Box } from "@mui/material";
import React, { useState } from "react";

export default function SequenceDownload({ data, selectdFamily, kmer }) {
  //   const [data, setData] = useState([]);
  if (data) {
    const handleDownload = () => {
      // Convert the data into a string in FASTA format
      // Convert sequences to FASTA format
      let fastaString = "";
      Object.entries(data).forEach(([name, sequence]) => {
        fastaString += `>${name}\n${sequence}\n`;
      });

      // const fastaString = data
      //   .map((seq) => {
      //     const header = `>${seq.name}\n`;
      //     return header + seq.sequence;
      //   })
      //   .join("\n");

      // Create a new Blob object with the converted data and specify the MIME type
      const blob = new Blob([fastaString], { type: "text/plain" });

      // Create a new URL object with the Blob object and create a download link
      const url = URL.createObjectURL(blob);
      const link = document.createElement("a");
      link.href = url;
      link.download = `${selectdFamily}.fasta`;
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
  }
}
