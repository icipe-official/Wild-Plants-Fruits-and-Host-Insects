import {
  Table,
  TableHead,
  TableRow,
  TableCell,
  TableBody,
} from "@mui/material";
import { Box } from "@mui/system";
import { makeStyles } from "@mui/styles";
import { useState, useEffect } from "react";
import { useRouter } from "next/router";
import useSWR from "swr";
import InsectsReared from "./insectsreared";
export default function InsectsRearedfromPlants() {
  const [coleopteraData, setcoleopteraData] = useState([]);
  const [loaded, setLoaded] = useState(false);
  // const [error, setError] = useState(null);
  //   const classes = useStyles();
  const router = useRouter();
  // Set the default species to "abutilum hirtum"
  const species = router.query.species;
  // const species = router.query.speciesName;
  console.log("species");
  console.log(species);
  // useEffect(() => {
  //   fetch(`/api/plants/insectsReared/coleoptera/${species}`)
  //     .then((res) => res.json())
  //     .then(
  //       (result) => {
  //         setLoaded(true);
  //         setcoleopteraData(result);
  //       },
  //       (error) => {
  //         setLoaded(true);
  //         setError(error);
  //       }
  //     );
  // }, []);
  const fetcher = (url) => fetch(url).then((r) => r.json());

  // const base_url = "http://localhost:3000";
  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

  const { data, error } = useSWR(
    `${base_url}/api/plants/Allinsectsreared/${species}`,
    fetcher
  );

  // fetch(`/api/plantsPage/${species}`)
  if (error) return <div>Failed to load</div>;
  if (!data) return <div>Loading...</div>;
  console.log("coleoptera_data client side");
  //coleoptera data
  const coleopteraOrders = data.filter(
    (insect) => insect.insect_orders.order_name == "Coleoptera"
  );
  console.log("coleopteraOrders");

  console.log(coleopteraOrders);
  //lepidoptera
  const lepidopteraOrders = data.filter(
    (insect) => insect.insect_orders.order_name == "Lepidoptera"
  );
  console.log("lepidopteraOrders");

  console.log(lepidopteraOrders);
  //Diptera tehritideae
  const diptertephritidaeOrders = data.filter(
    (insect) =>
      insect.insect_orders.order_name === "Diptera" &&
      insect.insect_families.family_name === "Tephritidae"
  );
  console.log("lepidopteraOrders");

  console.log(lepidopteraOrders);
  //Other Diptera
  const otherdipteraOrders = data.filter(
    (insect) =>
      insect.insect_orders.order_name === "Diptera" &&
      insect.insect_families.family_name !== "Tephritidae"
  );
  console.log("lepidopteraOrders");

  console.log(otherdipteraOrders);
  //Hymenoptera (Braconidae: Opina)
  const hymenopteraBraconidae = data.filter(
    (insect) =>
      insect.insect_orders.order_name === "Hymenoptera" &&
      insect.insect_families.family_name === "Braconidae"
  );

  // other hymenoptera
  //Hymenoptera (Braconidae: Opina)
  const otherhymenopteraBraconidae = data.filter(
    (insect) =>
      insect.insect_orders.order_name === "Hymenoptera" &&
      insect.insect_families.family_name !== "Braconidae"
  );

  return (
    <Box sx={{ marginTop: 0 }}>
      <Box sx={{ color: "green" }}>Coleoptera (beetles)</Box>
      <InsectsReared data={coleopteraOrders} />
      <Box sx={{ marginBottom: 0, color: "maroon" }}>
        Lepidoptera (moths and butterflies)
      </Box>
      <InsectsReared data={lepidopteraOrders} />
      <Box sx={{ marginBottom: 0, color: "blue" }}>
        {" "}
        Diptera Tephridae(fruit flies)
      </Box>
      <InsectsReared data={diptertephritidaeOrders} />
      <Box sx={{ marginBottom: 0, color: "blue" }}>
        {" "}
        Other Diptera (fruit flies)
      </Box>
      <InsectsReared data={otherdipteraOrders} />
      <Box sx={{ marginBottom: 0, color: "red" }}>
        Hymenoptera (Braconidae: Opinae) (wasps)
      </Box>
      <InsectsReared data={hymenopteraBraconidae} />
      <Box sx={{ marginBottom: 0, color: "red" }}>
        {" "}
        Other Hymenoptera (wasps)
      </Box>
      <InsectsReared data={otherhymenopteraBraconidae} />
    </Box>
  );
}
