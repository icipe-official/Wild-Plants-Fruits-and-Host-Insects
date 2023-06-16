import UKWFValues from "./distribution/ukwfareas/ukwfvalues";
import { Box } from "@mui/system";
import KsectorValues from "./distribution/KsectorValues";
import { useState, useEffect } from "react";
import { useRouter } from "next/router";
import useSWR from "swr";

export default function KsectorUKFKeyValues() {
  const [ksectorData, setksectorData] = useState([]);
  const [loaded, setLoaded] = useState(false);
  //   const [error, setError] = useState(null);
  //   const classes = useStyles();
  const router = useRouter();
  const species = router.query.speciesName;
  console.log("species");
  console.log(species);
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

  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
  const { data, error } = useSWR(`${base_url}/api/plantsPage/${species}`, fetcher);

  // fetch(`/api/plantsPage/${species}`)
  if (error) return <div>Failed to load</div>;
  if (!data) return <div>Loading...</div>;
  console.log("ksector client side");
  console.log(ksectorData);
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
