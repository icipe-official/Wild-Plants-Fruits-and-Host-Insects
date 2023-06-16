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
const useStyles = makeStyles({
  table: {
    width: "100%",
  },
  cell: {
    border: "1px solid black",
    padding: "3px",
  },
});

export default function OtherDiptera() {
  const classes = useStyles();
  // const [otherDipteraData, setOtherDiptera] = useState([]);
  const [loaded, setLoaded] = useState(false);
  // const [error, setError] = useState(null);
  //   const classes = useStyles();
  const router = useRouter();
  // const species = router.query.speciesName;
  // Set the default species to "abutilum hirtum"
  const species = router.query.speciesName;
  console.log("species");
  console.log(species);
  // useEffect(() => {
  //   fetch(`/api/plants/insectsReared/OtherDiptera/${species}`)
  //     .then((res) => res.json())
  //     .then(
  //       (result) => {
  //         setLoaded(true);
  //         setOtherDiptera(result);
  //       },
  //       (error) => {
  //         setLoaded(true);
  //         setError(error);
  //       }
  //     );
  // }, []);
  const fetcher = (url) => fetch(url).then((r) => r.json());

  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
  const { data, error } = useSWR(
    `${base_url}/api/plants/insectsReared/OtherDiptera/${species}`,
    fetcher
  );

  // fetch(`/api/plantsPage/${species}`)
  if (error) return <div>Failed to load</div>;
  if (!data) return <div>Loading...</div>;
  console.log("otherDiptera client side");
  console.log(data);

  return (
    <Box sx={{ marginTop: 2, width: "100%" }}>
      <Table className={classes.table}>
        <TableHead sx={{ color: "blue" }}>
          Other Diptera
          <TableRow>
            <TableCell className={classes.cell}>Family</TableCell>
            <TableCell className={classes.cell}>Species</TableCell>
            <TableCell className={classes.cell}>Photo</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {data?.map((otherdip) => (
            <TableRow key={otherdip.id}>
              <TableCell key={otherdip.id} className={classes.cell}>
                {otherdip.insect_families.family_name}
              </TableCell>
              <TableCell key={otherdip.id} className={classes.cell}>
                {otherdip.insect_genera.genus_name +
                  " " +
                  otherdip.species_name}
              </TableCell>
              <TableCell key={otherdip.id} className={classes.cell}>
                {/* <img src={insect.photo} alt={`${insect.species} photo`} /> */}
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </Box>
  );
}
