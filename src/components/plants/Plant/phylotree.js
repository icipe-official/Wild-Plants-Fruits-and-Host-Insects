import { phylotree } from "phylotree";
import ReactDOMServer from "react-dom/server";
import { useState, useEffect } from "react";
import { Box } from "@mui/material";

export default function PhyloTree({ newick }) {
  const [renderedTree, setRenderedTree] = useState(null);

  useEffect(() => {
    const tree = new phylotree(newick);
    const height = 500;
    const width = 500;

    const colorNodesByName = (node) => {
      // Your node color styling logic here
    };

    const colorEdgesByTarget = (edge) => {
      // Your edge color styling logic here
    };

    const rt = tree.render({
      height: height,
      width: width,
      "left-right-spacing": "fit-to-size",
      "align-tips": true,
      "node-styler": colorNodesByName,
      "edge-styler": colorEdgesByTarget,
    });

    rt.nodeLabel((n) => {
      return n.data.name + " HELLO";
    });

    setRenderedTree(rt);
  }, []);

  return <Box sx={{ marginTop: 3 }}>{renderedTree && renderedTree.svg}</Box>;
}
