import { useState, useEffect } from "react";
import { useRouter } from "next/router";
import Box from "@mui/material/Box";
import { Container, ButtonBase } from "@mui/material";
import insectQueryresult from "./insectQueryresult";
import Link from "next/link";
import useSWR from "swr";
import Router from "next/router";
import PlantDetailsFeaturesValues from "./plantFruitsLeafMultipleEntry";
import PlantDetailValues from "./Plant/plantDetailValuesMUI";
import FruitDetailValues from "./Fruit/fruitDetailValues";
import PlantSpecieFamilyGenusResult from "./plantSpeciesFamilyResult";
import LeafDetailValues from "./Leaf/leafDetailValues";
import KsectorValues from "./distribution/KsectorValues";
import UKWFValues from "./distribution/ukwfareas/ukwfvalues";
import PlantDescription from "./plantDescriptionCard";
import PhotosComponent from "./photos/photosmain";
import InsectsReared from "./insectsRared/insectsreared";
import Insectspecies from "./specieslist";
import Grid from "@mui/material/Grid";

export default function QueryResult({ query_data }) {
  const router = useRouter();
  const d = router.query.query;
  const [selectedIndex, setSelectedIndex] = useState(-1);
  // const base_url = "http://localhost:3000";
  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

  console.log("query data params");
  console.log(d);

  const [first, setFirst] = useState("");
  const fetcher = (url) => fetch(url).then((r) => r.json());
  const { data: species_list, error: specieserror } = useSWR(
    `${base_url}/api/multipleEntry/multipleentry?filters=${d}`,
    fetcher
  );

  const { data: species_list1, error: specieserror1 } = useSWR(
    `${base_url}/api/plants/plantsPage/${first}`,
    fetcher
  );
  const { data: insectsreared, error: insectserror } = useSWR(
    `${base_url}/api/plants/Allinsectsreared/${first}`,
    fetcher
  );

  useEffect(() => {
    if (species_list && species_list.length > 0) {
      setFirst(species_list[0].id); // pass the id of the species
    }
  }, [species_list]);
  const isLoading = !insectsreared && !insectserror;
  if (specieserror)
    return (
      <Container
        sx={{
          backgroundColor: "lightbrown",
          overflowY: "scroll",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          height: "100%",
          paddingBottom: "65%", // Adjust this value to create space for the footer
        }}
      >
        {/* Content goes here */}
        <Box sx={{ marginTop: 6 }}>Failed to load</Box>;
      </Container>
    );

  if (isLoading)
    return (
      <Container
        sx={{
          backgroundColor: "lightbrown",
          overflowY: "scroll",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          height: "100%",
          paddingBottom: "65%", // Adjust this value to create space for the footer
        }}
      >
        {/* Content goes here */}
        <Box sx={{ marginTop: 12 }}>Loading...</Box>
        {/* Footer goes here */}
      </Container>
    );
  if (species_list1 && species_list.length > 0 && insectsreared) {
    //https://stackoverflow.com/questions/66666983/calling-multiple-endpoints-using-nextjs-and-the-swr-library
    console.log("first sepcies client side");
    // console.log(species_list);
    console.log("data multiple entry page");
    console.log(species_list);
    console.log("first");
    console.log(first);
    //coleoptera
    const coleopteraOrders = insectsreared.filter(
      (insect) => insect.insect_orders.order_name == "Coleoptera"
    );
    console.log("coleopteraOrders");

    console.log(coleopteraOrders);
    //lepidoptera
    const lepidopteraOrders = insectsreared.filter(
      (insect) => insect.insect_orders.order_name == "Lepidoptera"
    );
    console.log("lepidopteraOrders");

    console.log(lepidopteraOrders);
    //Diptera tehritideae
    const diptertephritidaeOrders = insectsreared.filter(
      (insect) =>
        insect.insect_orders.order_name === "Diptera" &&
        insect.insect_families.family_name === "Tephritidae"
    );
    console.log("lepidopteraOrders");

    console.log(lepidopteraOrders);
    //Other Diptera
    const otherdipteraOrders = insectsreared.filter(
      (insect) =>
        insect.insect_orders.order_name === "Diptera" &&
        insect.insect_families.family_name !== "Tephritidae"
    );
    console.log("lepidopteraOrders");

    console.log(otherdipteraOrders);
    //Hymenoptera (Braconidae: Opina)
    const hymenopteraBraconidae = insectsreared.filter(
      (insect) =>
        insect.insect_orders.order_name === "Hymenoptera" &&
        insect.insect_families.family_name === "Braconidae"
    );

    // other hymenoptera
    //Hymenoptera (Braconidae: Opina)
    const otherhymenopteraBraconidae = insectsreared.filter(
      (insect) =>
        insect.insect_orders.order_name === "Hymenoptera" &&
        insect.insect_families.family_name !== "Braconidae"
    );

    return (
      // <Box sx={{ paddingTop: "2rem", marginLeft: 2 }}>
      //   <Box sx={{ display: "flex" }}>
      //     <Insectspecies data={species_list} />
      //     <Box>
      //       <PlantSpecieFamilyGenusResult plants_data={species_list1} />
      //     </Box>
      //   </Box>
      //   <Box sx={{ display: "flex" }}>
      //     <Box>
      //       <PlantDetailValues plants_data={species_list1} />
      //       <FruitDetailValues fruits_data={species_list1} />
      //       <LeafDetailValues leaves_data={species_list1} />
      //     </Box>
      //     <Box>
      //       <Box sx={{ fontWeight: "bold", marginLeft: 0, marginTop: 2 }}>
      //         Distribution
      //       </Box>
      //       <Box>
      //         <KsectorValues k_sector_data={species_list1} />
      //         <UKWFValues ukwf_area_data={species_list1} />
      //         <PlantDescription plants_data={species_list1} />
      //         <PhotosComponent photos_data={species_list1} />
      //       </Box>
      //     </Box>
      //     <Box sx={{ marginTop: 2, marginLeft: 2 }}>
      //       <Box sx={{ fontWeight: "bold" }}> Insects reared</Box>
      //       <Box sx={{ color: "maroon" }}>Coleoptera</Box>
      //       <InsectsReared data={coleopteraOrders} />
      //       <Box sx={{ marginBottom: 0, color: "green" }}>Lepidoptera</Box>
      //       <InsectsReared data={lepidopteraOrders} />
      //       <Box sx={{ marginBottom: 0, color: "blue" }}>
      //         {" "}
      //         Diptera Tephridae
      //       </Box>
      //       <InsectsReared data={diptertephritidaeOrders} />
      //       <Box sx={{ marginBottom: 0, color: "blue" }}> Other Diptera</Box>
      //       <InsectsReared data={otherdipteraOrders} />
      //       <Box sx={{ marginBottom: 0, color: "red" }}>
      //         {" "}
      //         Hymenoptera (Braconidae: Opina)
      //       </Box>
      //       <InsectsReared data={hymenopteraBraconidae} />
      //       <Box sx={{ marginBottom: 0, color: "red" }}> Other Hymenoptera</Box>
      //       <InsectsReared data={otherhymenopteraBraconidae} />
      //     </Box>
      //   </Box>
      // </Box>
      //       <Grid container spacing={2}>
      //         <Grid item xs={12} sm={6} md={8} lg={9}>
      //           <Grid container spacing={2}>
      //             <Grid item xs={12} sm={6}>
      //               <FruitDetailValues fruits_data={species_list1} />
      //             </Grid>
      //             <Grid item xs={12} sm={6}>
      //               <LeafDetailValues leaves_data={species_list1} />
      //             </Grid>
      //             <Grid item xs={12}>
      //               <PlantDetailValues plants_data={species_list1} />
      //             </Grid>
      //             <Grid item xs={12}>
      //               <Box sx={{ fontWeight: "bold", marginTop: 2 }}>Distribution</Box>
      //               <KsectorValues k_sector_data={species_list1} />
      //               <UKWFValues ukwf_area_data={species_list1} />
      //               <PlantDescription plants_data={species_list1} />
      //               <PhotosComponent photos_data={species_list1} />
      //             </Grid>
      //           </Grid>
      //         </Grid>
      //         <Grid item xs={12} sm={6} md={4} lg={3}>
      //           <Box sx={{ fontWeight: "bold", marginTop: 2 }}>Insects reared</Box>
      //           <Box sx={{ color: "maroon" }}>Coleoptera</Box>
      //           <InsectsReared data={coleopteraOrders} />
      //           <Box sx={{ marginBottom: 0, color: "green" }}>Lepidoptera</Box>
      //           <InsectsReared data={lepidopteraOrders} />
      //           <Box sx={{ marginBottom: 0, color: "blue" }}> Diptera Tephridae</Box>
      //           <InsectsReared data={diptertephritidaeOrders} />
      //           <Box sx={{ marginBottom: 0, color: "blue" }}> Other Diptera</Box>
      //           <InsectsReared data={otherdipteraOrders} />
      //           <Box sx={{ marginBottom: 0, color: "red" }}>
      //             Hymenoptera (Braconidae: Opina)
      //           </Box>
      //           <InsectsReared data={hymenopteraBraconidae} />
      //           <Box sx={{ marginBottom: 0, color: "red" }}> Other Hymenoptera</Box>
      //           <InsectsReared data={otherhymenopteraBraconidae} />
      //         </Grid>
      //       </Grid>
      //     );
      //   }
      // }

      <Grid container columns={12} marginTop={8}>
        <Grid item xs={12} md={6}>
          <Insectspecies data={species_list} />
        </Grid>
        <Grid item xs={12} md={6}>
          <PlantSpecieFamilyGenusResult plants_data={species_list1} />
        </Grid>
        <Grid xs={12} sm={6} md={5} lg={3}>
          <Box>
            <PlantDetailValues plants_data={species_list1} />
            <FruitDetailValues fruits_data={species_list1} />
            <LeafDetailValues leaves_data={species_list1} />
          </Box>
        </Grid>
        <Grid xs={12} sm={6} md={5} lg={4}>
          <Box sx={{ fontWeight: "bold", marginTop: 2 }}>Distribution</Box>
          <KsectorValues k_sector_data={species_list1} />
          <UKWFValues ukwf_area_data={species_list1} />
          <PlantDescription plants_data={species_list1} />
          <PhotosComponent photos_data={species_list1} selectedIndex={0} />
        </Grid>
        {/* <Grid lg={3} spacing={1}>
          <OpenLayersMap />
        </Grid> */}
        <Grid xs={12} sm={6} md={5} lg={5} spacing={1}>
          <Box>
            <Box sx={{ marginLeft: 1, marginTop: 2 }}>
              <Box sx={{ fontWeight: "bold" }}>Insects reared</Box>
              <Box>
                <Box sx={{ color: "maroon" }}>Coleoptera</Box>
                <InsectsReared data={coleopteraOrders} />
                <Box sx={{ marginBottom: 0, color: "green" }}>Lepidoptera</Box>
                <InsectsReared data={lepidopteraOrders} />
                <Box sx={{ marginBottom: 0, color: "blue" }}>
                  {" "}
                  Diptera Tephridae
                </Box>
                <InsectsReared data={diptertephritidaeOrders} />
                <Box sx={{ marginBottom: 0, color: "blue" }}>
                  {" "}
                  Other Diptera
                </Box>
                <InsectsReared data={otherdipteraOrders} />
                <Box sx={{ marginBottom: 0, color: "red" }}>
                  Hymenoptera (Braconidae: Opina)
                </Box>
                <InsectsReared data={hymenopteraBraconidae} />
                <Box sx={{ marginBottom: 0, color: "red" }}>
                  {" "}
                  Other Hymenoptera
                </Box>
                <InsectsReared data={otherhymenopteraBraconidae} />
              </Box>
            </Box>
          </Box>
        </Grid>
      </Grid>
    );
  }
}
