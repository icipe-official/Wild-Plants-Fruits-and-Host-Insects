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

export default function OtherHymenoptera() {
  const classes = useStyles();
  const router = useRouter();
  const species = router.query.speciesName;

  const fetcher = (url) => fetch(url).then((r) => r.json());

  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
  const { data, error } = useSWR(
    `${base_url}/api/plants/insectsReared/OtherHymenoptera/${species}`,
    fetcher
  );

  if (error) return <div>Failed to load</div>;
  if (!data) return <div>Loading...</div>;

  return (
    <Box sx={{ marginTop: 2, width: "100%", marginBottom: "1rem" }}>
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
