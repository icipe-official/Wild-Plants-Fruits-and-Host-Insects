import useSWR, { mutate } from "swr";
import { useEffect, useState } from "react";
import { useRef } from "react";
import { Box, FormControl, InputLabel, MenuItem, Select } from "@mui/material";
import { useRouter } from "next/router";
import { Container } from "@mui/material";
import SequenceDownload from "./download";
import NewickDownload from "./downloadnewick";
import { TreeView, TreeItem } from "@mui/lab";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import ChevronRightIcon from "@mui/icons-material/ChevronRight";
// import DistancematrixToNewick from "./neigbourjoining";
// import CalculateSimilarityMatrix from "./generateDistanceMatrix";
// import { NeighborJoining } from "./generateDistanceMatrix";

import { NeighborJoining } from "./modifiedKTurple";
import CalculateSimilarityMatrixModified from "./modifiedKTurple";
import { makeStyles } from "@mui/styles";

// export default function Newick() {
import FastaToDict from "./inputsequence";
import { inspect } from "util";
const useStyles = makeStyles({
  root: {
    display: "row",
  },
});
export default function PlantsInsectsPhylogeny() {
  const classes = useStyles();
  const [selectedOrganism, setSelectedOrganism] = useState("plants");
  // const base_url = "http://localhost:3000";

  // const fetcher = (url) => fetch(url).then((r) => r.json());
  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
  const base_path = process.env.NEXT_PUBLIC_BASE_PATH ? `${process.env.NEXT_PUBLIC_BASE_PATH}` : "";
  const fetcher = (url) => fetch(url).then((r) => r.json());

  const { data, error, isLoading } = useSWR(
    `${base_url}/api/insects/species`,
    fetcher
  );

  console.log(data);
  const [newickData, setNewickData] = useState("");
  // "((A:0.1,B:0.2)80:0.3,(C:0.4,D:0.5)95:0.6)90;"
  const [selectedFamily, setSelectedFamily] = useState("Acanthaceae");
  const [kmer, setkmer] = useState(9);
  const [filteredFamily, setfilteredFamily] = useState("Acanthaceae");
  const [selecteorder, setSelectedOrder] = useState("Braconidae");
  const [filteredOrder, setFilteredOrder] = useState("Braconidae");
  const [download, setDownload] = useState([]);

  //handle input sequences
  const [fastaInput, setFastaInput] = useState("");
  const [fastaArray, setFastaArray] = useState([]);
  const [newickInput, setNewickInput] = useState("");

  //control drop down tree for download
  const [selectedNode, setSelectedNode] = useState(null);

  const handleNodeSelect = (event, nodeId) => {
    setSelectedNode(nodeId);
  };

  const iframeRef = useRef(null);
  const router = useRouter();
  useEffect(() => {
    if (newickData && iframeRef.current) {
      // Wait for the iframe to load
      iframeRef.current.addEventListener("load", () => {
        // Send data to the iframe
        iframeRef.current.contentWindow.postMessage({ newickData }, "*");
      });
    }
  }, [newickData]);

  //handle new set kmer
  useEffect(() => {
    if (data) {
      console.log("selectedFamily changed to:", selectedFamily);
      handleChange();
    }
  }, [selectedFamily, kmer]);

  function handleChange(event) {
    //option 2 when genus is selected
    console.log("dataaa");
    console.log(
      data.map((dat) =>
        dat.plants_insects.map(
          (insect) => insect.plants.plant_genera.plant_families.family_name
        )
      )
    );
    //filter only dat with insects reared
    const filteredData = data.filter((dat) => {
      const filteredInsects = dat.plants_insects.filter(
        (insect) =>
          insect.plants.plant_genera.plant_families.family_name ===
            "Rubiaceae" && dat.insects_coi.length > 0
      );
    });

    console.log("insect filteredData based on selected family");
    console.log(filteredData);
    //dictionary of sequences and name
    const sequences = Object.values(filteredData)
      .map((obj) => {
        if (obj.insects_coi.length > 0) {
          return obj.insects_coi.map((insect) => {
            if (insect.nucleotide !== null) {
              const name =
                obj.insect_genera.genus_name +
                  "_" +
                  obj.species_name.split(" ")[0] +
                  "_" +
                  insect.country +
                  "_" +
                  obj.plants_insects[0]?.plants.plant_genera?.genus_name ??
                null + +"_";
              obj.plants_insects[0]?.species_name?.slice(0, 5);
              return {
                name: name,
                sequence: insect.nucleotide,
              };
              //avoid processing any undefined values if there is no sequence
            } else {
              return null;
            }
          });
        }
      })
      .filter(Boolean)
      .flat()
      .filter((value) => value !== null); // retuns one array from the nested arrays and remove null values
    console.log("insect sequences");
    console.log(sequences);
    var result = CalculateSimilarityMatrixModified(sequences, kmer);
    // var result = CalculateSimilarityMatrix(sequences);

    var newick = NeighborJoining(result.dist_mat, result.names);
    console.log("insect newick");
    setNewickData(newick);
    setDownload(sequences);
  }

  //selection of kmer

  const handleChangekmer = (event) => {
    const newKmer = event.target.value;
    setkmer(newKmer);
    handleChange();
  };
  const handleInputChangefasta = (event) => {
    setFastaInput(event.target.value);
  };
  if (isLoading) {
    return <Container sx={{ height: "100%" }}>Loading</Container>;
  }

  if (data) {
    //render insects phylogeny
    console.log("insects");

    const orders = new Set(
      data.map((species) => species.insect_families.family_name)
    );

    const orders_list = [...orders]; // Convert set to array
    console.log("orders");

    console.log(orders);
    const filteredData = data.filter(
      (dat) => dat.insect_orders.order_name == selecteorder
    );
    console.log("insect filteredData");

    console.log(filteredData);
    //handle input of newick
    const handleInputChangenewick = (event) => {
      setNewickInput(event.target.value);
    };
    //handle input data
    const handleSubmitnewick = (event) => {
      event.preventDefault();

      if (newickInput) {
        setSelectedFamily("Select family");

        console.log("newick input");
        console.log(newickInput);
        console.log("newick input");
        setNewickData(newickInput);
        setDownload(newickInput);
      }
      // delete newick input on submit
      setNewickInput("");
    };

    return (
      <Container sx={{ marginTop: 10 }}>
        {/* <ConverttoFasta></ConverttoFasta> */}
        <Box sx={{ display: "flex" }}>
          <Box sx={{ marginLeft: 2 }}></Box>
          {/* </Box> */}
          <Box sx={{ marginLeft: 3 }}>
            {" "}
            kmer
            <FormControl>
              <InputLabel>Integer</InputLabel>
              <Select value={kmer} onChange={handleChangekmer}>
                <MenuItem value={4}>4</MenuItem>
                <MenuItem value={5}>5</MenuItem>
                <MenuItem value={6}>6</MenuItem>
                <MenuItem value={7}>7</MenuItem>
                <MenuItem value={8}>8</MenuItem>
                <MenuItem value={9}>9</MenuItem>
              </Select>
            </FormControl>
          </Box>
          {/* <Box sx={{marginLeft:2}}>          <FastaToDict/>
</Box> */}

          <Box sx={{ marginLeft: 2 }}>
            <TreeView
              className={classes.root}
              defaultCollapseIcon={<ExpandMoreIcon />}
              defaultExpandIcon={<ChevronRightIcon />}
              selected={selectedNode}
              onNodeSelect={handleNodeSelect}
            >
              <TreeItem nodeId="1" label="Download">
                <TreeItem nodeId="2" label="Sequences in fasta format">
                  <SequenceDownload
                    data={download}
                    selectdFamily={selecteorder}
                    kmer={kmer}
                  />

                  {/* <TreeItem nodeId="4" label="Grandchild 2" /> */}
                </TreeItem>

                <TreeItem nodeId="5" label="Newick file">
                  <NewickDownload newick={newickData} data={filteredData} />
                </TreeItem>
              </TreeItem>
            </TreeView>
          </Box>
          <Box sx={{ marginLeft: 2 }}>
            <form onSubmit={handleSubmitnewick}>
              <label>
                <textarea
                  value={newickInput}
                  onChange={handleInputChangenewick}
                  placeholder="Enter newick sequence"
                  autoFocus
                ></textarea>
              </label>
              <br />
              <button type="submit">Submit</button>
            </form>
          </Box>
        </Box>{" "}
        <Box>
          <iframe
            ref={iframeRef}
            onLoad={handleIframeLoad}
            src={iframeSrc}
            style={{
              position: "relative",
              top: 3,
              left: 2,
              width: "100%", // Set a fixed width
              height: "100vh", // Set a fixed height
            }}
          />
        </Box>
      </Container>
    );
  }
}
