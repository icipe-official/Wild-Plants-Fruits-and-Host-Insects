import React from "react";
import { Description } from "@mui/icons-material";
import { Box, Container, Divider } from "@mui/material";

export default function Disclaimer() {
  return (
    <Container>
      <Box sx={{ marginTop: 12, justifyContent: "center" }}>
        <h3>
          <a name="disclaimer" className="anchor">
            Disclaimer
          </a>
        </h3>
        The barcodes that have been used for constructing the phylogeny tree of
        respective biocollections were obtained from the BOLD database with
        assumption that taxonomically identified individuals share identical
        barcodes with the species that have been barcoded. The link to the
        barcodes are provided upon clicking each species in the phylogeny tree
      </Box>
      {/* <Divider /> */}
    </Container>
  );
}
