import { Box, Container, Typography } from "@mui/material";
import HomePage from "components/home/home";
import Insectssearch from "components/insects/search";
import CombinedSearchPlantsInsects from "components/plants/searchplants";
export default function Home() {
  return (
    <Container sx={{ marginTop: 10 }}>
      <>
        {" "}
        <Typography
          variant="h1"
          sx={{
            fontWeight: "bold",
            fontSize: 40,
            color: "maroon",
            marginLeft: 3,
          }}
        >
          WiPFIM: A digital platform for interlinking insects associated with
          wild fruits of Kenya
        </Typography>
        <CombinedSearchPlantsInsects />
        <HomePage />
        {/* <Insectssearch /> */}
      </>
    </Container>
  );
}
