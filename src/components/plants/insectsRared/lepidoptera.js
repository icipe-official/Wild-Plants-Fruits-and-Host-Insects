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

export default function Lepidoptera({ lepidoptera_data }) {
  const classes = useStyles();
  const router = useRouter();
  const species = router.query.speciesName;

  const fetcher = (url) => fetch(url).then((r) => r.json());

  const { data, error } = useSWR(
    `/api/plants/insectsReared/Lepidoptera/${species}`,
    fetcher
  );

  if (error) return <div>Failed to load</div>;
  if (!data) return <div>Loading...</div>;

  return (
    <Box sx={{ marginTop: 2, width: "100%" }}>
      <Table className={classes.table}>
        <TableHead sx={{ color: "green" }}>
          Lepidoptera
          <TableRow>
            <TableCell className={classes.cell}>Family</TableCell>
            <TableCell className={classes.cell}>Species</TableCell>
            <TableCell className={classes.cell}>Photo</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {data?.map((lep) => (
            <TableRow key={lep.id}>
              <TableCell key={lep.id} className={classes.cell}>
                {lep.insect_families.family_name}
              </TableCell>
              <TableCell key={lep.id} className={classes.cell}>
                {lep.insect_genera.genus_name + " " + lep.species_name}
              </TableCell>
              <TableCell key={lep.id} className={classes.cell}>
                {/* <img src={insect.photo} alt={`${insect.species} photo`} /> */}
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </Box>
  );
}
