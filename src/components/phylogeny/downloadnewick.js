import { Box } from "@mui/material";
import React, { useState } from "react";

export default function NewickDownload({ newick, data }) {
  //   const [data, setData] = useState([]);
  if ((newick, data)) {
    const handleDownloadNewick = () => {
      // Create a new Blob object with the converted data and specify the MIME type
      const blob = new Blob([newick], { type: "text/plain" });

      // Create a new URL object with the Blob object and create a download link
      const url = URL.createObjectURL(blob);
      const link = document.createElement("a");
      link.href = url;
      if (data.length > 0) {
        data[0].plant_genera
          ? (link.download = `${data[0].plant_genera.plant_families.family_name}.newick`)
          : (link.download = `${data[0].insect.plant_families.family_name}.newick`);
      } else {
        link.download = "newick_download.newick";
      }
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
  }
}
