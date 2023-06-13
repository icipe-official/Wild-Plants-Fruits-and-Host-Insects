import { Box } from "@mui/material";
import useSWR from "swr";
import TreeTrial from "components/phylogeny/phylogeneticsTree";
import PhylogenyMafft from "components/phylogeny/phylogenyMafftIqtree";

export default function () {
  return <PhylogenyMafft />;
}
