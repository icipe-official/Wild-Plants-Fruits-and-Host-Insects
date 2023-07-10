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
          variant="h6"
          sx={{
            fontWeight: "bold",
            fontSize: 50,
            color: "maroon",
            marginLeft: 3,
          }}
        >
          Insects Associated With Wild Fruits of Kenya
        </Typography>
        <CombinedSearchPlantsInsects />
        <HomePage />
        {/* <Insectssearch /> */}
      </>
    </Container>
  );
}
