import { Box } from "@mui/system";
import { useState, useEffect } from "react";
import { useRouter } from "next/router";
import useSWR from "swr";
import KsectorValues from "./distribution/KsectorValues";
import UKWFValues from "./distribution/ukwfareas/ukwfvalues";

export default function KsectorUKFKeyValues() {
  const [ksectorData, setksectorData] = useState([]);
  const [loaded, setLoaded] = useState(false);
  //   const [error, setError] = useState(null);
  //   const classes = useStyles();
  const router = useRouter();
  const species = router.query.speciesName;
  ////console.log('species');
  ////console.log(species);
  //   useEffect(() => {
  //     fetch(`/api/plantsPage/${species}`)
  //       .then((res) => res.json())
  //       .then(
  //         (result) => {
  //           setLoaded(true);
  //           setksectorData(result);
  //         },
  //         (error) => {
  //           setLoaded(true);
  //           setError(error);
  //         }
  //       );
  //   }, []);
  const fetcher = (url) => fetch(url).then((r) => r.json());

  const { data, error } = useSWR(`/api/plantsPage/${species}`, fetcher);

  // fetch(`/api/plantsPage/${species}`)
  if (error) return <div>Failed to load</div>;
  if (!data) return <div>Loading...</div>;
  ////console.log('ksector client side');
  ////console.log(ksectorData);
  return (
    <Box sx={{ display: "flex", marginLeft: 2 }}>
      <Box>
        <UKWFValues />
      </Box>
      <Box>
        <KsectorValues />
      </Box>
    </Box>
  );
}
