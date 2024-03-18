import React from "react";
import { Description } from "@mui/icons-material";
import { Box, Container, Divider } from "@mui/material";

export default function Disclaimer() {
  return (
    <Container>
      <Box sx={{ marginTop: 12, justifyContent: "center" }}>
        <h3>
          <a name="disclaimer" class="anchor">
            Disclaimer
          </a>
        </h3>
        The biocollections were not sent for bacoding, we downloaded the barcode
        sequences from BOLD that matched target plants and insects that were
        identified by species names in the biocollection records. The link to
        BOLD databse as well as NCBI links of the barcodes are can be accessed
        upon right clicking the species in the phylogeny tree that brings a n
        option with links to BOLD database and/or NCBI.
      </Box>
      {/* <Divider /> */}
    </Container>
  );
}
