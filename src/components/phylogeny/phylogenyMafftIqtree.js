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
import ConverttoFasta from "./inputsequence";
import { makeStyles } from "@mui/styles";

import FastaToDict from "./inputsequence";
const useStyles = makeStyles({
  root: {
    display: "row",
  },
});

const fetcher = (url) => fetch(url).then((r) => r.json());

export default function PhylogenyMafft() {
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
    //use the same name for api end points to
    mutate(`${base_url}/api/plants/species`, null, false);
    mutate(`${base_url}/api/insects/species`, null, false);

    // Update the selected organism
    setSelectedOrganism(event.target.value);
    if (event.target.value == "plants") {
      setSelectedFamily("Vitaceae");
      setNewickData(
        "(Ampelocissus_africana_Mozambique_:0.0039187367,(Cissus_integrifolia_Mozambique_:0.0132064363,(Cissus_quadrangularis_Mozambique_:0.0146331552,Cissus_rotundifolia_Mozambique_:0.0036917100):0.0299076794):0.0157319219,((Cyphostemma_cyphopetalum_Kenya_:0.0057039644,Cyphostemma_serpens_Kenya_:0.0043207604):0.0141042702,(Rhoicissus_revoilii_South-Africa_:0.0000021033,Rhoicissus_tridentata_South-Africa_:0.0013102368):0.0293948893):1.1077382777);"
      );
      handleChange(event);
    } else {
      setSelectedOrder("Braconidae");
    }
    // setfilteredFamily("")
    handleChange(event);
    // setNewickData("");
  };
  // Create the URL based on the selected organism
  const url = `${base_url}/api/${selectedOrganism}/species`;

  const { data, error, isLoading } = useSWR(url, fetcher);
  // console.log(data);
  const [newickData, setNewickData] = useState(
    "(Ampelocissus_africana_Mozambique_:0.0039187367,(Cissus_integrifolia_Mozambique_:0.0132064363,(Cissus_quadrangularis_Mozambique_:0.0146331552,Cissus_rotundifolia_Mozambique_:0.0036917100):0.0299076794):0.0157319219,((Cyphostemma_cyphopetalum_Kenya_:0.0057039644,Cyphostemma_serpens_Kenya_:0.0043207604):0.0141042702,(Rhoicissus_revoilii_South-Africa_:0.0000021033,Rhoicissus_tridentata_South-Africa_:0.0013102368):0.0293948893):1.1077382777);"
  );
  // "((A:0.1,B:0.2)80:0.3,(C:0.4,D:0.5)95:0.6)90;"
  const [selectedFamily, setSelectedFamily] = useState("Vitaceae");
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

  async function handleChange(event) {
    if (event) {
      if (selectedOrganism === "plants") {
        // console.log("kmer at handlechange");
        const selectedValue =
          (event.target && event.target.value) || "Select family";
        setSelectedFamily(selectedValue);
        const filteredData = data.filter(
          (dat) => dat.plant_genera.plant_families.family_name === selectedValue
        );
        setSelectedFamily(selectedValue);
        setfilteredFamily(filteredData);
        const sequences = filteredData.reduce((result, obj) => {
          if (obj.plants_matk.length > 0) {
            obj.plants_matk.forEach((plant) => {
              if (plant.nucleotide !== null && plant.nucleotide.length >= 600) {
                const name =
                  obj.plant_genera.genus_name +
                  "_" +
                  obj.species_name.split(" ")[0] +
                  "_" +
                  // plant.country.replace(/ /g, "-") +
                  // "_";
                  plant.genebank_accession;

                const cleanedSequence = plant.nucleotide
                  .replace(/-/g, "")
                  .replace(/N/g, "");

                // Extract the species name from the name string
                const speciesName = obj.species_name.split(" ")[0];

                // Check if the species name already exists in the result
                const existingSpecies = Object.keys(result).find((key) =>
                  key.includes(speciesName)
                );

                // If the species name exists, do not add the sequence
                if (existingSpecies) {
                  return result;
                }

                // Add the sequence with the original long name
                result[name] = cleanedSequence;
              }
            });
          }
          return result;
        }, {});

        const uniqueSequences = Object.values(sequences);

        setDownload(sequences);

        // console.log("plant sequences format");
        // console.log(sequences);
        // console.log("sequences on click family");
        // console.log(sequences);
        const requestBody = {
          sequences: sequences,
        };

        fetch(`${base_url}/api/phylogeny`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(requestBody),
        })
          .then((response) => {
            if (!response.ok) {
              throw new Error("Error: " + response.status);
            }
            return response.json();
          })
          .then((data) => {
            const newick = data.newick;
            setNewickData(newick);
            // console.log(data);
          })
          .catch((error) => {
            console.error(error);
          });
      } else if (selectedOrganism === "insects") {
        // console.log("insect kmer at handlechange");
        const selectedValue =
          (event.target && event.target.value) || "Select family";
        setSelectedOrder(selectedValue);
        const filteredData = data.filter(
          (dat) => dat.insect_families.family_name === selectedValue
        );
        setSelectedOrder(selectedValue);
        setFilteredOrder(filteredData);
        // console.log("insect filteredData");
        const sequences = filteredData.reduce((result, obj) => {
          let counter = 1;
          if (obj.insects_coi.length > 0) {
            obj.insects_coi.forEach((insect) => {
              //account for minimum lenth of coi 658 bp
              if (
                (insect.nucleotide !== null) &
                (insect.nucleotide?.lenth >= 658)
              ) {
                const name =
                  obj.insect_genera.genus_name +
                  "_" +
                  obj.species_name.split(" ")[0] +
                  "_" +
                  // insect.country?.replace(/ /g, "") +
                  // "_" +
                  insect.genebank_accession;
                result[name.replace(/\s/g, "")] = insect.nucleotide
                  .replace(/-/g, "")
                  .replace(/N/g, "");
              }
            });
          }
          return result;
        }, {});
        const sequencesSet = new Set(Object.values(sequences));
        setDownload(sequencesSet);

        const requestBody = {
          sequences: sequences,
        };

        fetch(`${base_url}/api/phylogeny`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(requestBody),
        })
          .then((response) => {
            if (!response.ok) {
              throw new Error("Error: " + response.status);
            }
            return response.json();
          })
          .then((data) => {
            const newick = data.newick;
            setNewickData(newick);
            // console.log(data);
          })
          .catch((error) => {
            console.error(error);
          });
      }
    } else {
      if (selectedOrganism === "plants") {
        setNewickData("");

        const filteredData = data.filter(
          (dat) =>
            dat.plant_genera.plant_families.family_name === selectedFamily
        );
        // console.log("filteredData");
        const sequences = filteredData.reduce((result, obj) => {
          if (obj.plants_matk.length > 0) {
            obj.plants_matk.forEach((plant) => {
              //retain only sequnces with matk lentho >=600
              if (plant.nucleotide !== null && plant.nucleotide.length >= 600) {
                const name =
                  obj.plant_genera.genus_name +
                  "_" +
                  obj.species_name.split(" ")[0] +
                  "_" +
                  // plant.country.replace(/ /g, "-") +
                  // "_";
                  plant.genebank_accession;

                const cleanedSequence = plant.nucleotide
                  .replace(/-/g, "")
                  .replace(/N/g, "");

                // Extract the species name from the name string
                const speciesName = obj.species_name.split(" ")[0];

                // Check if the species name already exists in the result
                const existingSpecies = Object.keys(result).find((key) =>
                  key.includes(speciesName)
                );

                // If the species name exists, do not add the sequence
                if (existingSpecies) {
                  return result;
                }

                // Add the sequence with the original long name
                result[name] = cleanedSequence;
              }
            });
          }
          return result;
        }, {});

        const uniqueSequences = Object.values(sequences);

        setDownload(uniqueSequences);

        // console.log("plant sequences format");
        // console.log(sequences);
        // console.log("plant sequences format");
        // console.log(sequences);
        const requestBody = {
          sequences: sequences,
        };
        fetch(`${base_url}/api/phylogeny`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(requestBody),
        })
          .then((response) => {
            if (!response.ok) {
              throw new Error("Error: " + response.status);
            }
            return response.json();
          })
          .then((data) => {
            const newick = data.newick;
            setNewickData(newick);
            // console.log(data);
          })
          .catch((error) => {
            console.error(error);
          });
      } else if (selectedOrganism === "insects") {
        setNewickData("");

        // console.log("insect selecteorder");
        const filteredData = data.filter(
          (dat) => dat.insect_families.family_name === selecteorder
        );
        // console.log("insect filteredData on selecting insect order");
        const sequences = filteredData.reduce((result, obj) => {
          // let counter = 1;
          if (
            obj.insects_coi.length > 0 //standard length of COI sequences in animals
          ) {
            obj.insects_coi.forEach((insect) => {
              if ((insect.nucleotide !== null) & (insect.nucleotide >= 658)) {
                const name =
                  obj.insect_genera.genus_name +
                  "_" +
                  obj.species_name.split(" ")[0] +
                  "_" +
                  // insect.country?.replace(/ /g, "") +
                  // "_" +
                  insect.genebank_accession;
                // counter;
                // counter++;
                result[name.replace(/\s/g, "")] = insect.nucleotide
                  .replace(/-/g, "")
                  .replace(/N/g, "");
              }
            });
          }
          return result;
        }, {});
        const sequencesSet = new Set(Object.values(sequences));
        setDownload(sequences);

        const requestBody = {
          sequences: sequences,
        };
        fetch(`${base_url}/api/phylogeny`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(requestBody),
        })
          .then((response) => {
            if (!response.ok) {
              throw new Error("Error: " + response.status);
            }
            return response.json();
          })
          .then((data) => {
            const newick = data.newick;
            setNewickData(newick);
            // console.log(data);
          })
          .catch((error) => {
            console.error(error);
          });
      }
    }
  }

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

      // console.log("fasta array");
      // console.log(fastaInput);

      setNewickData("");
      const fastaLines = fastaInput.trim().split("\n");
      let currentSequenceName = "";
      let currentSequence = "";
      const fastaArray = [];
      for (let line of fastaLines) {
        if (line.startsWith(">")) {
          if (currentSequenceName !== "") {
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

      const fastaObject = {};
      for (let entry of fastaArray) {
        fastaObject[entry.name] = entry.sequence;
      }
      setFastaArray(fastaObject);
      // console.log("fastaArray");
      if (fastaArray) {
        setSelectedFamily("Select family");
        //retrieve the data from back end API
        // console.log("input  sequences format");
        // console.log(fastaArray);

        // var result = CalculateSimilarityMatrixModified(sequences, kmer);
        // var result = CalculateSimilarityMatrix(sequences);
        // console.log("plant newick from mafttttttttttt");
        const requestBody = {
          sequences: fastaObject,
        };

        fetch("http://localhost:3000/api/phylogeny", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(requestBody),
        })
          .then((response) => {
            if (!response.ok) {
              throw new Error("Error: " + response.status);
            }
            return response.json();
          })
          .then((data) => {
            const newick = data.newick;
            setNewickData(newick);
            // console.log(data);
          })
          .catch((error) => {
            console.error(error);
          });
        // const newick = await Mafft(sequences);

        // console.log(newick);

        // console.log("plant newick");
        // setNewickData(newick);

        // console.log(fastaArray);
        // var result = CalculateSimilarityMatrixModified(fastaArray, kmer);
        // var result = CalculateSimilarityMatrix(sequences);

        // var newick = NeighborJoining(result.dist_mat, result.names);
        // console.log("newick");
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
        // console.log("user plus existing sequences");
        // console.log("Download");

        // console.log(Download);
        // console.log("fastaArray");

        // console.log(fastaArray);

        // var result = CalculateSimilarityMatrix(sequences);

        var newick = NeighborJoining(result.dist_mat, result.names);
        // console.log("newick");
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
    setSelectedFamily("Select family");
    setSelectedOrder("Select order");

    // console.log("newick input");
    // // console.log(newickInput);
    // console.log("newick input");
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
        // console.log("File contents:", fileContents);
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
        // console.log("File contents:", fileContents);
        // setFastaInput(fileContents);
      };

      // Clear the file input value
      // event.target.querySelector('input[type="file"]').value = "";

      // Read the file as text
      reader.readAsText(selectedFile);
      setSelectedFamily("Select family");

      // console.log("fasta array");
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
            // console.log("currentSequenceName");

            // console.log(
            //   currentSequenceName.slice(1).split(" ").slice(0, 2).join("-")
            // );
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
      // console.log("fastaArray");
      if (fastaArray) {
        setSelectedFamily("Select family");

        // console.log(fastaArray);
        var result = CalculateSimilarityMatrixModified(fastaArray, kmer);
        // var result = CalculateSimilarityMatrix(sequences);

        var newick = NeighborJoining(result.dist_mat, result.names);
        // console.log("newick");
        setNewickData(newick);
        setDownload(newick);
      }
    }
    setFastaInput("");
    setSelectedFamily("");
  };
  if (isLoading)
    return (
      <Container
        sx={{
          backgroundColor: "lightbrown",
          overflowY: "scroll",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          height: "100%",
          paddingBottom: "65%", // Adjust this value to create space for the footer
        }}
      >
        {/* Content goes here */}
        <Box sx={{ marginTop: 12 }}>Loading...</Box>
        {/* Footer goes here */}
      </Container>
    );
  if (error)
    return (
      <Container
        sx={{
          backgroundColor: "lightbrown",
          overflowY: "scroll",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          height: "100%",
          paddingBottom: "65%", // Adjust this value to create space for the footer
        }}
      >
        {/* Content goes here */}
        <Box sx={{ marginTop: 12 }}>Failed to load...</Box>
        {/* Footer goes here */}
      </Container>
    );
  //conditional rendering with data
  if (data) {
    // setIsLoadingData(false); // Set loading state to false
    // ...

    if (selectedOrganism === "plants") {
      let families =
        //return only families wth atleas two matk sequences
        data.filter(
          (species) =>
            species.plant_genera.plant_families.family_name &&
            species.plants_matk.length > 3
        );
      // obtain families only with matk sequences, get the set of the kmers, convert to list [...]
      var families_list = [
        ...new Set(
          families
            .map((family) => family.plant_genera.plant_families.family_name)
            .sort()
        ),
      ]; // Convert set to array
      // console.log("familes");

      // console.log(families);
      var filteredData = data.filter(
        (dat) => dat.plant_genera.plant_families.family_name === selectedFamily
      );
    } else {
      //render insects phylogeny
      // console.log("insects");
      if (selectedOrganism === "insects") {
        var orders = new Set(
          data.map((species) => species.insect_families.family_name)
        );

        var insect_orders_list = [...orders]; // Convert set to array
        // console.log("orders");

        // console.log(orders);
        var insectFilteredData = data.filter(
          (dat) => dat.insect_orders.order_name == selecteorder
        );
        // console.log("insect filteredData");
        var insect_famililes = data.filter(
          (entry) =>
            entry.plants_insects.length > 0 &&
            entry.insect_orders.order_name === "Lepidoptera"
        );
        // console.log("plants_famililes");

        // console.log(filteredData);
      }
    }
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
                  <MenuItem value="insects-plants">
                    <a href="http://localhost:3000/phylogeny/plantsInsects">
                      Insect-Plants
                    </a>
                  </MenuItem>
                </Select>
              </FormControl>
            </Box>
            <Box sx={{ marginLeft: 2 }}>
              <FormControl fullWidth variant="outlined">
                <InputLabel>Select family</InputLabel>
                <Select
                  value={
                    selectedOrganism === "plants"
                      ? selectedFamily
                      : selecteorder
                  }
                  onChange={(event) => handleChange(event)}
                  label="Families"
                  //   IconComponent={ArrowDropDown}
                >
                  {selectedOrganism === "plants"
                    ? families_list.map((family, index) => (
                        <MenuItem key={index} value={family}>
                          {family}
                        </MenuItem>
                      ))
                    : insect_orders_list.map((order, index) => (
                        <MenuItem key={index} value={order}>
                          {order}
                        </MenuItem>
                      ))}
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
                      selectdFamily={selectedFamily}
                      kmer={kmer}
                    />

                    {/* <TreeItem nodeId="4" label="Grandchild 2" /> */}
                  </TreeItem>

                  <TreeItem nodeId="5" label="Newick file">
                    <NewickDownload
                      newick={newickData}
                      data={
                        selectedOrganism === "plants"
                          ? filteredData
                          : insectFilteredData
                      }
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
                        <input type="file" onChange={handleInputChangenewick} />
                      </label>
                      <br />
                      <button type="submit">Submit</button>
                    </form>
                  </TreeItem>
                </TreeItem>
              </TreeView>
            </Box>
          </Box>
        </Box>{" "}
        <Box>
          {newickData ? (
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
          ) : (
            <div
              style={{
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
                height: "100vh",
              }}
            >
              <p>Constructing phylogenetics tree....</p>
            </div>
          )}
        </Box>
      </Container>
    );
  }
}
