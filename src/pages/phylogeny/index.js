
// import { useRef, useEffect, useState } from "react";


// export default function MyComponent() {
//  const data = {
//    newick:
//      "((Chrysopilus_laevis:0.034324,(Culicoides_imicola:0.056458,Simulium_damnosum:0.054925):0.023192):0.024599,((Drosophila_melanogaster:0.045603,Drosophila_virilis:0.048838):0.010688,(Musca_domestica:0.028555,Calliphora_vicina:0.035931):0.033036):0.018612,((Eristalis_arbustorum:0.051443,Eristalis_tenax:0.052172):0.007342,(Tabanus_sudeticus:0.039647,(Rhagio_scolopaceus:0.047358,(Tachina_fera:0.036210,(Empis_tessellata:0.030793,Empis_striata:0.034902):0.018703):0.012322):0.011284):0.015309):0.013881)",
//  };
//  const [newickData, setNewickData] = useState(null);
//  const iframeRef = useRef(null);


//  useEffect(() => {
//    setNewickData(data.newick);
//  }, []);


//  useEffect(() => {
//    if (newickData && iframeRef.current) {
//      // Wait for the iframe to load
//      iframeRef.current.addEventListener("load", () => {
//        // Send data to the iframe
//        iframeRef.current.contentWindow.postMessage({ newickData }, "*");
//      });
//    }
//  }, [newickData]);


//  return (
//    <div>
//      <iframe
//        ref={iframeRef}
//        src={`/phylotree.html?newickData=${newickData}`}
//        style={{
//          position: "absolute",
//          top: 3,
//          left: 2,
//          width: "100%",
//          height: "100%",
      
//        }}
//      />
//    </div>
//  );
// }

import { Box } from "@mui/material";
import useSWR from "swr";
import Tree from "components/phylogeny/tree";
import TreeTrial from "components/phylogeny/treetrialworking";

export default function () {
  return <TreeTrial />;
}
