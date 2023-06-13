import useSWR, { mutate } from "swr";
import { useEffect, useState } from "react";
import { useRef } from "react";
// import useMediaQuery from "@mui/material";
import {
  Box,
  FormControl,
  InputLabel,
  MenuItem,
  Select,
  useMediaQuery,
} from "@mui/material";
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
import ConverttoFasta from "./inputsequence";
import { makeStyles } from "@mui/styles";

import { kMaxLength } from "buffer";
// export default function Newick() {
import FastaToDict from "./inputsequence";
import { Download } from "@mui/icons-material";
const useStyles = makeStyles({
  root: {
    display: "row",
  },
});

const fetcher = (url) => fetch(url).then((r) => r.json());

export default function TreeTrial() {
  const classes = useStyles();
  const [selectedOrganism, setSelectedOrganism] = useState("plants");
  // const base_url = "http://localhost:3000";
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));

  // const fetcher = (url) => fetch(url).then((r) => r.json());
  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;
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
    "(Ampelocissus_africana_Mozambique_1:0.0076511049,(Cissus_integrifolia_Mozambique_1:0.0132548046,(Cissus_quadrangularis_Mozambique_1:0.0147342047,Cissus_rotundifolia_Mozambique_1:0.0034078082):0.0299014435):0.0119872426,((Cissus_integrifolia_Mozambique_2:0.0134894000,(Cissus_rotundifolia_Kenya_2:0.0000011601,Cissus_rotundifolia_Kenya_3:0.0000011601):0.0375793170):0.0075169886,(((Cyphostemma_cyphopetalum_Kenya_1:0.0000011601,((Cyphostemma_cyphopetalum_Kenya_2:0.0000011601,Cyphostemma_cyphopetalum_Kenya_3:0.0000011601):0.0000011601,Cyphostemma_cyphopetalum_Kenya_4:0.0000011601):0.0000011601):0.0057296080,(((Cyphostemma_serpens_Kenya_1:0.0000011601,Cyphostemma_serpens_Kenya_4:0.0000011601):0.0000011601,Cyphostemma_serpens_Kenya_3:0.0000011601):0.0000020490,Cyphostemma_serpens_Kenya_2:0.0000011601):0.0040926788):0.0304514307,((Rhoicissus_revoilii_South-Africa_1:0.0000011601,Rhoicissus_tridentata_South-Africa_1:0.0013107851):0.0000011601,Rhoicissus_revoilii_Mozambique_2:0.0000011601):0.0123113785):0.0055539448):1.1318167895);"
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

  //handle user added sequences
  const [userSequences, setUserSequences] = useState(false);

  const handleNodeSelect = (event, nodeId) => {
    setSelectedNode(nodeId);
  };
  //change view if small screen variable
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
      // console.log("selectedFamily changed to:", selectedFamily);
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
        // console.log(filteredData);

        const sequences = Object.values(filteredData)
          .map((obj) => {
            let counter = 1; // Initialize the counter variable
            if (obj.plants_matk.length > 0) {
              return obj.plants_matk.map((plant) => {
                if (plant.nucleotide !== null) {
                  const name =
                    obj.plant_genera.genus_name +
                    "_" +
                    obj.species_name.split(" ")[0] +
                    "_" +
                    plant.country.replace(/ /g, "-") +
                    "_" +
                    counter; // Append the counter to the name

                  counter++; // Increment the counter for the next occurrence

                  return {
                    name: name,
                    sequence: plant.nucleotide.replace(/-/g, ""),
                  };
                } else {
                  return null;
                }
              });
            }
          })
          .filter(Boolean)
          .flat()
          .filter((value) => value !== null);
        console.log("sequences on click family");
        // console.log(sequences);
        var result = CalculateSimilarityMatrixModified(sequences, kmer);
        // var result = CalculateSimilarityMatrix(sequences);

        var newick = NeighborJoining(result.dist_mat, result.names);
        console.log("newick");
        setNewickData(newick);
        setSelectedFamily(selectedValue);
        setDownload(sequences);
        console.log(" after main handle change");

        // console.log(kmer);
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
          // console.log(filteredData);

          const sequences = Object.values(filteredData)
            .map((obj) => {
              let counter = 1;
              if (obj.insects_coi.length > 0) {
                return obj.insects_coi.map((insect) => {
                  //check if there is nucleotide sequence
                  if (insect.nucleotide !== null) {
                    const name =
                      obj.insect_genera.genus_name +
                      "_" +
                      obj.species_name.split(" ")[0] +
                      "_" +
                      insect.country?.replace(/ /g, "") +
                      counter; // Append the counter to the name

                    counter++; // Increment the counter for the next occurrence; // if country has space in its name

                    "_" +
                      obj.plants_insects[0]?.plants.plant_genera?.genus_name ??
                      null + "_";
                    obj.plants_insects[0]?.species_name?.split(" ")[1];
                    return {
                      name: name,

                      sequence: insect.nucleotide.replace(/-/g, ""),
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
          // console.log(sequences.filter((value) => value !== null));
          var result = CalculateSimilarityMatrixModified(sequences, kmer);
          // var result = CalculateSimilarityMatrix(sequences);

          var newick = NeighborJoining(result.dist_mat, result.names);
          console.log("newick");
          setNewickData(newick);
          setSelectedOrder(selectedValue);
          setDownload(sequences);
          console.log(" after main handle change");

          // console.log(kmer);
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
        // console.log(filteredData);
        //dictionary of sequences and name
        const sequences = Object.values(filteredData)
          .map((obj) => {
            let counter = 1; // Initialize the counter variable
            if (obj.plants_matk.length > 0) {
              return obj.plants_matk.map((plant) => {
                if (plant.nucleotide !== null) {
                  const name =
                    obj.plant_genera.genus_name +
                    "_" +
                    obj.species_name.split(" ")[0] +
                    "_" +
                    plant.country.replace(/ /g, "-") +
                    "_" +
                    counter; // Append the counter to the name

                  counter++; // Increment the counter for the next occurrence

                  return {
                    name: name,
                    sequence: plant.nucleotide.replace(/-/g, ""),
                  };
                } else {
                  return null;
                }
              });
            }
          })
          .filter(Boolean)
          .flat()
          .filter((value) => value !== null);
        console.log("plant sequences");
        // console.log(sequences);

        var result = CalculateSimilarityMatrixModified(sequences, kmer);
        // var result = CalculateSimilarityMatrix(sequences);

        var newick = NeighborJoining(result.dist_mat, result.names);
        console.log("plant newick");
        setNewickData(newick);
        // setDownload(sequences);
        // setSelectedFamily(selectedValue)
      } else if (selectedOrganism === "insects") {
        console.log("insect selecteorder");

        // console.log(selecteorder);
        const filteredData = data.filter(
          (dat) => dat.insect_families.family_name === selecteorder
        );

        console.log("insect filteredData on selecting insect order");
        // console.log(filteredData);
        //dictionary of sequences and name
        const sequences = Object.values(filteredData)
          .map((obj) => {
            let counter = 1;
            if (obj.insects_coi.length > 0) {
              return obj.insects_coi.map((insect) => {
                if (insect.nucleotide !== null) {
                  const name =
                    obj.insect_genera.genus_name +
                    "_" +
                    obj.species_name.split(" ")[0] +
                    "_" +
                    insect.country.replace(/ /g, "-") +
                    counter; // Append the counter to the name

                  counter++; // Increment the counter for the next occurrence; // if country has space in its name

                  "_" +
                    obj.plants_insects[0]?.plants.plant_genera?.genus_name ??
                    null + +"_";
                  obj.plants_insects[0]?.species_name?.slice(0, 5);
                  return {
                    name: name,
                    //remove gap characters
                    sequence: insect.nucleotide.replace(/-/g, ""),
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
        // console.log(sequences);
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
  const handleSubmitfasta = (event) => {
    event.preventDefault();

    // setFastaInput(event.target.value);
    // handleSubmitfasta(event);
    handleInputChangefasta(event);
    // setFastaInput("");
  };
  //handle input fasta sequence
  const handleInputChangefasta = (event) => {
    setFastaInput(event.target.value);
    if (fastaInput) {
      //remove current family name
      setSelectedFamily("Select family");

      console.log("fasta array");
      // console.log(fastaInput);

      setNewickData("");
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

        // console.log(fastaArray);
        var result = CalculateSimilarityMatrixModified(fastaArray, kmer);
        // var result = CalculateSimilarityMatrix(sequences);

        var newick = NeighborJoining(result.dist_mat, result.names);
        console.log("newick");
        setNewickData(newick);
        setDownload(newick);
      }
    } else {
      if (fastaArray && userSequences) {
        setSelectedFamily("Select family");

        // console.log(fastaArray);
        //add suser sequences to existing sequences
        var result = CalculateSimilarityMatrixModified(
          [...fastaArray, ...Download],
          kmer
        );
        console.log("user plus existing sequences");
        console.log("Download");

        console.log(Download);
        console.log("fastaArray");

        console.log(fastaArray);

        // var result = CalculateSimilarityMatrix(sequences);

        var newick = NeighborJoining(result.dist_mat, result.names);
        console.log("newick");
        setNewickData(newick);
        setDownload(newick);
      }
    }
    setSelectedFamily("");
  };

  //handle input of newick
  const handleInputChangenewick = (event) => {
    event.preventDefault();
    setNewickInput(event.target.value);

    // setSelectedFamily("Select family");

    console.log("newick input");
    // console.log(newickInput);
    console.log("newick input");
    setNewickData(newickInput);
    setDownload(newickInput);

    // delete newick input on sub
  };
  //handle input data
  const handleSubmitnewick = (event) => {
    event.preventDefault();
    // setNewickData(event.target.value);

    handleInputChangenewick(event);
    // delete newick input on submit
    setNewickInput("");
  };

  //handle uploding newick
  const handleSubmitFile = (event) => {
    setSelectedFamily("");

    event.preventDefault(); // Prevent form submission

    // Access the selected file from the file input element
    const selectedFile =
      event.target.querySelector('input[type="file"]').files[0];

    if (selectedFile) {
      const reader = new FileReader();

      // Set up the FileReader onload event handler
      reader.onload = (e) => {
        const fileContents = e.target.result;
        // Use the file contents as needed
        console.log("File contents:", fileContents);
        setNewickData(fileContents);
      };

      // Clear the file input value
      event.target.querySelector('input[type="file"]').value = "";

      // Read the file as text
      reader.readAsText(selectedFile);
    }
  };

  const handleSubmiFastatFile = (event) => {
    event.preventDefault(); // Prevent form submission

    // Access the selected file from the file input element
    const selectedFile =
      event.target.querySelector('input[type="file"]').files[0];

    if (selectedFile) {
      const reader = new FileReader();

      // Set up the FileReader onload event handler
      reader.onload = (e) => {
        const fileContents = e.target.result;
        // set inputfasta to file contents
        console.log("File contents:", fileContents);
        // setFastaInput(fileContents);
      };

      // Clear the file input value
      // event.target.querySelector('input[type="file"]').value = "";

      // Read the file as text
      reader.readAsText(selectedFile);
      setSelectedFamily("Select family");

      console.log("fasta array");
      // console.log(fastaInput);

      setNewickData("");
      // event.preventDefault();
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

        // console.log(fastaArray);
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
  //conditional rendering with data
  if (data) {
    if (selectedOrganism === "plants") {
      let families =
        //return only families wth atleas two matk sequences
        data.filter(
          (species) =>
            species.plant_genera.plant_families.family_name &&
            species.plants_matk.length > 0
        );
      // obtain families only with matk sequences, get the set of the kmers, convert to list [...]
      const families_list = [
        ...new Set(
          families
            .map((family) => family.plant_genera.plant_families.family_name)
            .sort()
        ),
      ]; // Convert set to array
      console.log("familes");

      // console.log(families);
      const filteredData = data.filter(
        (dat) => dat.plant_genera.plant_families.family_name === selectedFamily
      );

      return (
        <Container sx={{ marginTop: 10 }}>
          {/* <ConverttoFasta></ConverttoFasta> */}
          <Box sx={{ display: isSmallScreen ? "row" : "flex" }}>
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
                {/* kmer */}
                <FormControl>
                  <InputLabel>Kmer</InputLabel>
                  <Select value={kmer} onChange={handleChangekmer}>
                    <MenuItem value={3}>3</MenuItem>

                    <MenuItem value={4}>4</MenuItem>
                    <MenuItem value={5}>5</MenuItem>
                    <MenuItem value={6}>6</MenuItem>
                    <MenuItem value={7}>7</MenuItem>
                    <MenuItem value={8}>8</MenuItem>
                    <MenuItem value={9}>9</MenuItem>
                    <MenuItem value={10}>10</MenuItem>
                    <MenuItem value={11}>11</MenuItem>

                    <MenuItem value={12}>12</MenuItem>
                    <MenuItem value={13}>13</MenuItem>

                    <MenuItem value={15}>15</MenuItem>
                    <MenuItem value={16}>16</MenuItem>

                    <MenuItem value={17}>19</MenuItem>
                    <MenuItem value={19}>19</MenuItem>

                    <MenuItem value={20}>20</MenuItem>
                    <MenuItem value={25}>25</MenuItem>
                    <MenuItem value={28}>28</MenuItem>
                    <MenuItem value={30}>30</MenuItem>
                    <MenuItem value={35}>35</MenuItem>
                    <MenuItem value={40}>40</MenuItem>
                    <MenuItem value={45}>45</MenuItem>
                    <MenuItem value={47}>47</MenuItem>
                    <MenuItem value={48}>48</MenuItem>

                    <MenuItem value={50}>50</MenuItem>
                  </Select>
                </FormControl>
              </Box>
            </Box>
            {/* <form onSubmit={handleSubmitfasta}>
              <input
                type="text"
                value={fastaInput}
                onChange={(event) => handleInputChangefasta()}
                // Add any necessary attributes or styles to the input field
              />
              <button type="submit">Add Sequence</button>
            </form> */}
            <Box sx={{ display: "flex" }}>
              {/* <Box sx={{marginLeft:2}}>          <FastaToDict/>
</Box> */}
              <Box sx={{ marginLeft: isSmallScreen ? 0 : 2 }}>
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
                <TreeView
                  className={classes.root}
                  defaultCollapseIcon={<ExpandMoreIcon />}
                  defaultExpandIcon={<ChevronRightIcon />}
                  selected={selectedNode}
                  onNodeSelect={handleNodeSelect}
                >
                  <TreeItem nodeId="9" label="Paste file">
                    <TreeItem nodeId="10" label="Paste newick">
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
                      {/* <TreeItem nodeId="4" label="Grandchild 2" /> */}
                    </TreeItem>

                    <TreeItem nodeId="30" label="Paste fasta Sequence">
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
                    </TreeItem>
                    {/* <TreeItem nodeId="11" label="Upload Fasta file">
                    <form onSubmit={handleSubmiFastatFile}>
                      <label>
                        Upload File:
                        <input type="file" onChange={handleInputChangefasta} />
                      </label>
                      <br />
                      <button type="submit">Submit</button>
                    </form>
                  </TreeItem> */}
                  </TreeItem>
                </TreeView>
              </Box>
              <Box sx={{ marginLeft: 2 }}>
                <TreeView
                  className={classes.root}
                  defaultCollapseIcon={<ExpandMoreIcon />}
                  defaultExpandIcon={<ChevronRightIcon />}
                  selected={selectedNode}
                  onNodeSelect={handleNodeSelect}
                >
                  <TreeItem nodeId="20" label="Upload file">
                    <TreeItem nodeId="21" label="Upload Newick file">
                      <form onSubmit={handleSubmitFile}>
                        <label>
                          Upload File:
                          <input
                            type="file"
                            onChange={handleInputChangenewick}
                          />
                        </label>
                        <br />
                        <button type="submit">Submit</button>
                      </form>
                    </TreeItem>
                    {/* <TreeItem nodeId="11" label="Upload Fasta file">
                    <form onSubmit={handleSubmiFastatFile}>
                      <label>
                        Upload File:
                        <input type="file" onChange={handleInputChangefasta} />
                      </label>
                      <br />
                      <button type="submit">Submit</button>
                    </form>
                  </TreeItem> */}
                  </TreeItem>
                </TreeView>
              </Box>
            </Box>
          </Box>{" "}
          <Box>
            <iframe
              ref={iframeRef}
              src={`/phylotree.html?newickData=${newickData}`}
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

        // console.log(orders);
        const filteredData = data.filter(
          (dat) => dat.insect_orders.order_name == selecteorder
        );
        console.log("insect filteredData");

        // console.log(filteredData);
        return (
          <Container sx={{ marginTop: 10 }}>
            <Box sx={{ display: isSmallScreen ? "row" : "flex" }}>
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
                    <InputLabel>Select Family</InputLabel>
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
                  {/* kmer */}
                  <FormControl>
                    <InputLabel>Kmer</InputLabel>
                    <Select value={kmer} onChange={handleChangekmer}>
                      <MenuItem value={3}>3</MenuItem>

                      <MenuItem value={4}>4</MenuItem>
                      <MenuItem value={5}>5</MenuItem>
                      <MenuItem value={6}>6</MenuItem>
                      <MenuItem value={7}>7</MenuItem>
                      <MenuItem value={8}>8</MenuItem>
                      <MenuItem value={9}>9</MenuItem>
                    </Select>
                  </FormControl>
                </Box>
              </Box>
              <Box sx={{ display: "flex" }}>
                {/* <Box sx={{marginLeft:2}}>          <FastaToDict/>
</Box> */}
                <Box sx={{ marginLeft: isSmallScreen ? 0 : 2 }}>
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
                        <NewickDownload
                          newick={newickData}
                          data={filteredData}
                        />
                      </TreeItem>
                    </TreeItem>
                  </TreeView>
                </Box>
                <Box sx={{ marginLeft: 2 }}>
                  <TreeView
                    className={classes.root}
                    defaultCollapseIcon={<ExpandMoreIcon />}
                    defaultExpandIcon={<ChevronRightIcon />}
                    selected={selectedNode}
                    onNodeSelect={handleNodeSelect}
                  >
                    <TreeItem nodeId="9" label="Paste file">
                      <TreeItem nodeId="10" label="Paste newick">
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
                        {/* <TreeItem nodeId="4" label="Grandchild 2" /> */}
                      </TreeItem>

                      <TreeItem nodeId="30" label="Paste fasta Sequence">
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
                      </TreeItem>
                      {/* <TreeItem nodeId="11" label="Upload Fasta file">
                    <form onSubmit={handleSubmiFastatFile}>
                      <label>
                        Upload File:
                        <input type="file" onChange={handleInputChangefasta} />
                      </label>
                      <br />
                      <button type="submit">Submit</button>
                    </form>
                  </TreeItem> */}
                    </TreeItem>
                  </TreeView>
                </Box>
                <Box sx={{ marginLeft: 2 }}>
                  <TreeView
                    className={classes.root}
                    defaultCollapseIcon={<ExpandMoreIcon />}
                    defaultExpandIcon={<ChevronRightIcon />}
                    selected={selectedNode}
                    onNodeSelect={handleNodeSelect}
                  >
                    <TreeItem nodeId="20" label="Upload file">
                      <TreeItem nodeId="21" label="Upload Newick file">
                        <form onSubmit={handleSubmitFile}>
                          <label>
                            Upload File:
                            <input
                              type="file"
                              onChange={handleInputChangenewick}
                            />
                          </label>
                          <br />
                          <button type="submit">Submit</button>
                        </form>
                      </TreeItem>
                      {/* <TreeItem nodeId="11" label="Upload Fasta file">
                    <form onSubmit={handleSubmiFastatFile}>
                      <label>
                        Upload File:
                        <input type="file" onChange={handleInputChangefasta} />
                      </label>
                      <br />
                      <button type="submit">Submit</button>
                    </form>
                  </TreeItem> */}
                    </TreeItem>
                  </TreeView>
                </Box>
              </Box>
            </Box>{" "}
            <Box>
              <iframe
                ref={iframeRef}
                src={`/phylotree.html?newickData=${newickData}`}
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
