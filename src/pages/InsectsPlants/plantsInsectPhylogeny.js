import { Box } from "@mui/material";
import useSWR from "swr";
import Tree from "components/phylogeny/tree";
import PlantsInsectsPhylogeny from "components/phylogeny/plantInsectPhylogenyTree";
export default function () {
  return <PlantsInsectsPhylogeny />;
}
