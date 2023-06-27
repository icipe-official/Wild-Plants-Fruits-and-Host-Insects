import {
  Table,
  TableHead,
  TableRow,
  TableCell,
  TableBody,
} from "@mui/material";
import { Box } from "@mui/system";
import { makeStyles } from "@mui/styles";
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
  const router = useRouter();
  const species = router.query.speciesName;

  const fetcher = (url) => fetch(url).then((r) => r.json());

  const { data, error } = useSWR(
    `/api/plants/insectsReared/OtherDiptera/${species}`,
    fetcher
  );

  if (error) return <div>Failed to load</div>;
  if (!data) return <div>Loading...</div>;

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
          {data.map((otherdip) => (
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
