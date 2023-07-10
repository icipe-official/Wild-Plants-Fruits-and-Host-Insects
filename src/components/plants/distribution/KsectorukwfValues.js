import { Box } from "@mui/system";
import useSWR from "swr";
import { useRouter } from "next/router";
import UKWFValues from "./ukwfareas/ukwfvalues";
import KsectorValues from "./KsectorValues";

export default function KsectorUKWFValues({ data }) {
  // const fetcher = (url) => fetch(url).then((r) => r.json());

  // const router = useRouter();
  // const species = router.query.speciesName;
  // //   const classes = useStyles();
  // ////console.log("species");
  // ////console.log(species);
  // const { data, error } = useSWR(`/api/plantsPage/${species}`, fetcher);

  // // fetch(`/api/plantsPage/${species}`)
  // if (error) return <div>Failed to load</div>;
  // if (!data) return <div>Loading...</div>;
  return (
    <Box sx={{ display: "column" }}>
      <Box>
        <KsectorValues k_sector_data={data} />
      </Box>
      <Box>
        <UKWFValues ukwf_area_data={data} />
      </Box>
    </Box>
  );
}
