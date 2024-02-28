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
        The barcodes that have been used for constructing the phylogeny tree of
        respective biocollections were obtained from the BOLD database with
        assumption that taxonomically identified individuals share identical
        barcodes with the species that have been barcoded. The link to BOLD
        databse as well as NCBI links of the barcodes are can be accessed upon
        right clicking the species in the phylogeny tree that brings a n option
        with links to BOLD database and/or NCBI.
      </Box>
      {/* <Divider /> */}
    </Container>
  );
}
