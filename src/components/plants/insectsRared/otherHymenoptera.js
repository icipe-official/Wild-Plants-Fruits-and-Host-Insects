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

export default function OtherHymenoptera({ other_hymenoptera_data }) {
  const classes = useStyles();
  // const [otherHymenopteraData, setOtherHymenoptera] = useState([]);
  const [loaded, setLoaded] = useState(false);
  // const [error, setError] = useState(null);
  //   const classes = useStyles();
  const router = useRouter();
  // Set the default species to "abutilum hirtum"
  const species = router.query.speciesName;
  // const species = router.query.speciesName;
  console.log("species");
  console.log(species);
  // useEffect(() => {
  //   fetch(`/api/plants/insectsReared/Otherhymenoptera/${species}`)
  //     .then((res) => res.json())
  //     .then(
  //       (result) => {
  //         setLoaded(true);
  //         setOtherHymenoptera(result);
  //       },
  //       (error) => {
  //         setLoaded(true);
  //         setError(error);
  //       }
  //     );
  // }, []);
  const fetcher = (url) => fetch(url).then((r) => r.json());

  const { data, error } = useSWR(
    `/api/plants/insectsReared/OtherHymenoptera/${species}`,
    fetcher
  );

  // fetch(`/api/plantsPage/${species}`)
  if (error) return <div>Failed to load</div>;
  if (!data) return <div>Loading...</div>;
  console.log("otherHymenopteraData client side");
  console.log(data);

  return (
    <Box
      sx={{
        marginTop: 2,
        width: "100%",
        marginBottom: "1rem",
      }}
    >
      <Table className={classes.table}>
        <TableHead sx={{ color: "red" }}>
          Other Hymenoptera
          <TableRow>
            <TableCell className={classes.cell}>Family</TableCell>
            <TableCell className={classes.cell}>Species</TableCell>
            <TableCell className={classes.cell}>Photo</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {data?.map((otherhym) => (
            <TableRow key={otherhym.id}>
              <TableCell key={otherhym.id} className={classes.cell}>
                {otherhym.insect_families.family_name}
              </TableCell>
              <TableCell key={otherhym.id} className={classes.cell}>
                {otherhym.insect_genera.genus_name +
                  " " +
                  otherhym.species_name}
              </TableCell>
              <TableCell key={otherhym.id} className={classes.cell}>
                {/* <img src={insect.photo} alt={`${insect.species} photo`} /> */}
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </Box>
  );
}
