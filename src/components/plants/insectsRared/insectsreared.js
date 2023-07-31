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
import Link from "next/link";
const useStyles = makeStyles({
  // table: {
  width: "100%",
  // },
  cell: {
    border: "1px solid black",
    padding: "3px",
  },
});

export default function InsectsReared({ data }) {
  const classes = useStyles();
  //   const [coleopteraData, setcoleopteraData] = useState([]);
  //   const [loaded, setLoaded] = useState(false);
  // const [error, setError] = useState(null);
  // //   const classes = useStyles();
  // const router = useRouter();
  // // Set the default species to "abutilum hirtum"
  // const species = router.query.speciesName;
  // // const species = router.query.speciesName;
  // ////console.log("species");
  // ////console.log(species);
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
  // const fetcher = (url) => fetch(url).then((r) => r.json());

  // const { data, error } = useSWR(
  //   `/api/plants/insectsReared/Coleoptera/${species}`,
  //   fetcher
  // );

  // // fetch(`/api/plantsPage/${species}`)
  // if (error) return <div>Failed to load</div>;
  // if (!data) return <div>Loading...</div>;
  ////console.log("coleoptera_data client side");
  ////console.log(data);

  // const [data, setData] = useState([]);
  // useEffect(() => {
  //   setData(coleoptera_data);
  // }, [coleoptera_data]);
  if (data) {
    return (
      <Box sx={{ marginTop: 1, width: "100%", marginBottom: 2 }}>
        <Table className={classes.table}>
          <TableHead sx={{ color: "maroon" }}>
            {/* Coleoptera */}
            <TableRow>
              <TableCell className={classes.cell}>Family</TableCell>
              <TableCell className={classes.cell}>Species</TableCell>
              <TableCell className={classes.cell}>Link</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {data?.map((col) => (
              <TableRow key={col.id}>
                <TableCell className={classes.cell}>
                  {col.insect_families.family_name}
                </TableCell>
                <TableCell className={classes.cell}>
                  {col.insect_genera.genus_name + " " + col.species_name}
                </TableCell>
                <TableCell className={classes.cell}>
                  <Link
                    href={{
                      pathname: `/insects/${col.insect_genera.id}`,
                      query: {
                        genus: col.insect_genera.id,
                        species: col.id,
                        speciesName:
                          col.insect_genera.genus_name +
                          " " +
                          col.species_name.replace(/\.\s*\d+/g, "").trim(),
                        order: col.insect_orders.order_name,
                      },
                    }}
                    // as={`/insects/${col.insect_genera.id}`}
                  >
                    Go to Insect detail page
                  </Link>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </Box>
    );
  }
}

// const handleClick = (genus) => {
//   Router.push({
//     pathname: `/insects/${genus.insect_genera.id}`,
//     query: {
//       genus: genus.insect_genera.id,
//       species: genus.id,
//     },
//   });
// };
