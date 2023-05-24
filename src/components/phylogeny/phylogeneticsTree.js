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

import CalculateSimilarityMatrix from "./generateDistanceMatrix";
import { NeighborJoining } from "./generateDistanceMatrix";
import CalculateSimilarityMatrixModified from "./modifiedKTurple";
import ConverttoFasta from "./inputsequence";
import { makeStyles } from "@mui/styles";

import { kMaxLength } from "buffer";
// export default function Newick() {
import FastaToDict from "./inputsequence";
const useStyles = makeStyles({
  root: {
    display: "row",
  },
});
export default function TreeTrial() {
  const classes = useStyles();
  const [selectedOrganism, setSelectedOrganism] = useState("plants");
  // const base_url = "http://localhost:3000";

  // const fetcher = (url) => fetch(url).then((r) => r.json());
  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
  const base_path = process.env.NEXT_PUBLIC_BASE_PATH ? `${process.env.NEXT_PUBLIC_BASE_PATH}` : "";
  const fetcher = async (url) => {
    const response = await fetch(url);
    const data = await response.json();
    return data;
  };

  // When the selected organism changes, clear the previous data
  // Event handler for updating the selected organism
  const handleOrganismChange = (event) => {
    // const newOrganism = event.target.value;

    // Clear the previous data and refetch based on selecetd organism and change api to that of selected organism
    mutate(`${base_url}/api/plants/species`, null, false);
    mutate(`${base_url}/api/insects/all/coi`, null, false);

    // Update the selected organism
    setSelectedOrganism(event.target.value);
    // setfilteredFamily("")
    handleChange(event);
  };
  // Create the URL based on the selected organism
  const url = `${base_url}/api/${selectedOrganism}/species`;

  const { data, error, isLoading } = useSWR(url, fetcher);
  console.log(data);
  const [newickData, setNewickData] = useState(
    "((Avicennia_marina_India:2.5945481885695,Avicennia_marina_India:2.421634775175007):1.1444710519935573,((((((Avicennia_marina_India:10.442779113449433,Avicennia_marina_India:10.039623934933584):9.024870676155427,Avicennia_marina_India:8.651805348156174):7.728809363806545,Avicennia_marina_India:7.421956114418514):6.4343228505276695,Avicennia_marina_India:6.193599414325327):5.0925923673062075,Avicennia_marina_India:4.903811288091093):3.7965310549573257,Avicennia_marina_South Africa:3.673962054353434):1.1444710519935573):0.5722355259967786"
  );
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
    if (event) {
      if (selectedOrganism === "plants") {
        console.log("kmer at handlechange");
        // if(data){
        const selectedValue =
          (event.target && event.target.value) || "Select family"; // assign default value if target value is not defined

        setSelectedFamily(selectedValue);

        const filteredData = data.filter(
          (dat) => dat.plant_genera.plant_families.family_name === selectedValue
        );

        // const selectedValue = event.target.value;
        // console.log("selectedValue");
        // console.log(selectedValue);

        setSelectedFamily(selectedValue);
        setfilteredFamily(filteredData);
        // const filteredData = data.filter(dat=>dat.plant_genera.plant_families.family_name===selectedFamily);
        console.log("filteredData");
        console.log(filteredData);

        const sequences = Object.values(filteredData)
          .map((obj) => {
            if (obj.plants_matk.length > 0) {
              return obj.plants_matk.map((plant) => {
                if (plant.nucleotide !== null) {
                  const name =
                    obj.plant_genera.genus_name +
                    "_" +
                    obj.species_name.split(" ")[0] +
                    "_" +
                    plant.country;
                  return {
                    name: name,
                    sequence: plant.nucleotide,
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
        console.log("sequences");
        console.log(sequences);
        var result = CalculateSimilarityMatrixModified(sequences, kmer);
        // var result = CalculateSimilarityMatrix(sequences);

        var newick = NeighborJoining(result.dist_mat, result.names);
        console.log("newick");
        setNewickData(newick);
        setSelectedFamily(selectedValue);
        setDownload(sequences);
        console.log(" after main handle change");

        console.log(kmer);
        // setkmer(5)
      } else {
        if (selectedOrganism == "insects") {
          console.log("insect kmer at handlechange");
          // if(data){
          const selectedValue =
            (event.target && event.target.value) || "Select family"; // assign default value if target value is not defined
          setSelectedOrder(selectedValue);

          const filteredData = data.filter(
            (dat) => dat.insect_families.family_name === selectedValue
          );

          // const selectedValue = event.target.value;
          // console.log("selectedValue");
          // console.log(selectedValue);

          setSelectedOrder(selectedValue);
          setFilteredOrder(filteredData);
          // const filteredData = data.filter(dat=>dat.plant_genera.plant_families.family_name===selectedFamily);
          console.log("insect filteredData");
          console.log(filteredData);

          const sequences = Object.values(filteredData)
            .map((obj) => {
              if (obj.insects_coi.length > 0) {
                return obj.insects_coi.map((insect) => {
                  //check if there is nucleotide sequence
                  if (insect.nucleotide !== null) {
                    const name =
                      obj.insect_genera.genus_name +
                        "_" +
                        obj.species_name.split(" ")[0] +
                        "_" +
                        insect.country +
                        "_" +
                        obj.plants_insects[0]?.plants.plant_genera
                          ?.genus_name ?? null + "_";
                    obj.plants_insects[0]?.species_name?.split(" ")[1];
                    return {
                      name: name,
                      sequence: insect.nucleotide,
                    };
                    //avoid processing any undefined values if there is no sequence
                  } else {
                    return null;
                  }
                });
              } else {
                return null;
              }
            })
            .filter(Boolean)
            .flat()
            .filter((value) => value !== null); // retuns one array from the nested arrays and remove null values
          console.log("insect sequences");
          console.log(sequences.filter((value) => value !== null));
          var result = CalculateSimilarityMatrixModified(sequences, kmer);
          // var result = CalculateSimilarityMatrix(sequences);

          var newick = NeighborJoining(result.dist_mat, result.names);
          console.log("newick");
          setNewickData(newick);
          setSelectedOrder(selectedValue);
          setDownload(sequences);
          console.log(" after main handle change");

          console.log(kmer);
        }
      }
    } //option 2 when genus is selected
    else {
      if (selectedOrganism == "plants") {
        const filteredData = data.filter(
          (dat) =>
            dat.plant_genera.plant_families.family_name === selectedFamily
        );

        console.log("filteredData");
        console.log(filteredData);
        //dictionary of sequences and name
        const sequences = Object.values(filteredData)
          .map((obj) => {
            if (obj.plants_matk.length > 0) {
              return obj.plants_matk.map((plant) => {
                if (plant.nucleotide !== null) {
                  console.log("plant has null nucleotide");
                  const name =
                    obj.plant_genera.genus_name +
                    "_" +
                    obj.species_name.split(" ")[0] +
                    "_" +
                    plant.country;
                  return {
                    name: name,
                    sequence: plant.nucleotide,
                  };
                }
                // avoid processing any undefine
                else {
                  return null;
                }
              });
            }
          })
          .filter(Boolean)
          .flat()
          .filter((value) => value !== null); // retuns one array from the nested arrays and remove null values
        console.log("plant sequences");
        console.log(sequences);

        var result = CalculateSimilarityMatrixModified(sequences, kmer);
        // var result = CalculateSimilarityMatrix(sequences);

        var newick = NeighborJoining(result.dist_mat, result.names);
        console.log("plant newick");
        setNewickData(newick);
        setDownload(sequences);
        // setSelectedFamily(selectedValue)
      } else if (selectedOrganism === "insects") {
        console.log("insect selecteorder");

        console.log(selecteorder);
        const filteredData = data.filter(
          (dat) => dat.insect_families.family_name === selecteorder
        );

        console.log("insect filteredData on selecting insect order");
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
    }
  }

  //selection of kmer

  //  const handleChangekmer= (event) => {
  //   setkmer(event.target.value);
  //   console.log("Selected integer: " + event.target.value);
  //   console.log("kmer before selecting")

  //   console.log(kmer)
  //   handleChange()
  //   console.log("kmer after selecting kmer")

  //   console.log(kmer)

  // };
  const handleChangekmer = (event) => {
    const newKmer = event.target.value;
    setkmer(newKmer);
    handleChange();
  };
  const handleInputChangefasta = (event) => {
    setFastaInput(event.target.value);
  };
  //handle input fasta sequence
  const handleSubmitfasta = (event) => {
    if (fastaInput) {
      //remove current family name
      setSelectedFamily("Select family");

      console.log("fasta array");
      console.log(fastaInput);

      setNewickData("");
      event.preventDefault();
      const fastaLines = fastaInput.trim().split("\n");
      let currentSequenceName = "";
      let currentSequence = "";
      const fastaArray = [];
      for (let line of fastaLines) {
        if (line.startsWith(">")) {
          if (currentSequenceName !== "") {
            console.log("currentSequenceName");

            console.log(
              currentSequenceName.slice(1).split(" ").slice(0, 2).join("-")
            );
            fastaArray.push({
              name: currentSequenceName
                .slice(1)
                .split(" ")
                .slice(0, 2)
                .join("-"),
              sequence: currentSequence,
            });
            currentSequence = "";
          }
          currentSequenceName = line;
        } else {
          currentSequence += line.trim();
        }
      }
      fastaArray.push({
        name: currentSequenceName.slice(1).split(" ").slice(0, 2).join("-"),
        sequence: currentSequence,
      });
      setFastaArray(fastaArray);
      console.log("fastaArray");
      if (fastaArray) {
        setSelectedFamily("Select family");

        console.log(fastaArray);
        var result = CalculateSimilarityMatrixModified(fastaArray, kmer);
        // var result = CalculateSimilarityMatrix(sequences);

        var newick = NeighborJoining(result.dist_mat, result.names);
        console.log("newick");
        setNewickData(newick);
        setDownload(newick);
      }
    }
    setFastaInput("");
    setSelectedFamily("");
  };

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

  if (data) {
    if (selectedOrganism === "plants") {
      let families = new Set(
        data.map((species) => species.plant_genera.plant_families.family_name)
      );
      const families_list = [...families]; // Convert set to array
      console.log("familes");

      console.log(families);
      const filteredData = data.filter(
        (dat) => dat.plant_genera.plant_families.family_name === selectedFamily
      );

      return (
        <Container sx={{ marginTop: 10 }}>
          {/* <ConverttoFasta></ConverttoFasta> */}
          <Box sx={{ display: "flex" }}>
            <Box>
              <FormControl>
                <InputLabel>select organism</InputLabel>
                <Select
                  value={selectedOrganism}
                  onChange={handleOrganismChange}
                >
                  <MenuItem value="plants">Plants</MenuItem>
                  <MenuItem value="insects">Insects</MenuItem>
                </Select>
              </FormControl>
            </Box>
            <Box sx={{ marginLeft: 2 }}>
              <FormControl fullWidth variant="outlined">
                <InputLabel>Select family</InputLabel>
                <Select
                  value={selectedFamily}
                  onChange={(event) => handleChange(event)}
                  label="Families"
                  //   IconComponent={ArrowDropDown}
                >
                  {families_list.map((family, index) => (
                    <MenuItem key={index} value={family}>
                      {family}
                    </MenuItem>
                  ))}
                </Select>
              </FormControl>
            </Box>
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
              <form onSubmit={handleSubmitfasta}>
                <label>
                  <textarea
                    value={fastaInput}
                    onChange={handleInputChangefasta}
                    placeholder="Enter FASTA sequence"
                    autoFocus
                  ></textarea>
                </label>
                <br />
                <button type="submit">Submit</button>
              </form>
            </Box>
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
                      selectdFamily={selectedFamily}
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
              src={`${base_path}/phylotree.html?newickData=${newickData}`}
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
    } else {
      //render insects phylogeny
      console.log("insects");
      if (selectedOrganism === "insects") {
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
        return (
          <Container sx={{ marginTop: 10 }}>
            {/* <ConverttoFasta></ConverttoFasta> */}
            <Box sx={{ display: "flex" }}>
              <Box>
                <FormControl>
                  <InputLabel> select organism</InputLabel>
                  <Select
                    value={selectedOrganism}
                    onChange={handleOrganismChange}
                  >
                    <MenuItem value="plants">Plants</MenuItem>
                    <MenuItem value="insects">Insects</MenuItem>
                  </Select>
                </FormControl>
              </Box>
              <Box sx={{ marginLeft: 2 }}>
                <FormControl fullWidth variant="outlined">
                  <InputLabel>Select order</InputLabel>
                  <Select
                    value={selecteorder}
                    onChange={(event) => handleChange(event)}
                    label="orders"
                    //   IconComponent={ArrowDropDown}
                  >
                    {orders_list.map((order, index) => (
                      <MenuItem key={index} value={order}>
                        {order}
                      </MenuItem>
                    ))}
                  </Select>
                </FormControl>
              </Box>
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
                <form onSubmit={handleSubmitfasta}>
                  <label>
                    <textarea
                      value={fastaInput}
                      onChange={handleInputChangefasta}
                      placeholder="Enter FASTA sequence"
                      autoFocus
                    ></textarea>
                  </label>
                  <br />
                  <button type="submit">Submit</button>
                </form>
              </Box>
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
                src={`${base_path}/phylotree.html?newickData=${newickData}`}
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
  }
}
