import useSWR from "swr";
import { useEffect, useState } from "react";
import { useRef } from "react";
import { Box, FormControl, InputLabel, MenuItem, Select } from "@mui/material";
import { useRouter } from "next/router";
import {Container} from "@mui/material";
import SequenceDownload from "./download";
import NewickDownload from "./downloadnewick";
import { TreeView,TreeItem } from '@mui/lab';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore'
import ChevronRightIcon from '@mui/icons-material/ChevronRight'
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

  // const base_url = "http://localhost:3000";

  const base_url="http://192.168.43.93:3000"


  const fetcher = (url) => fetch(url).then((r) => r.json());
  const { data, error, isLoading } = useSWR(
    `${base_url}/api/plants/plantSpecies`,
    fetcher
  );
  console.log(data)
  const [newickData, setNewickData] = useState(
"(Avicennia-marina-country_unknown49:0.0000022752,((((((((((((((((((((((((((((((((((((((((((((((((((((((Avicennia-marina-country_unknown50:0.0000000000,Avicennia-marina-country_unknown91:0.0000000000):0.0000000000,Avicennia-marina-country_unknown84:0.0000000000):0.0000000000,Avicennia-marina-country_unknown61:0.0000000000):0.0000000000,Avicennia-marina-country_unknown66:0.0000000000):0.0000000000,Avicennia-marina-country_unknown62:0.0000000000):0.0000000000,Avicennia-marina-country_unknown63:0.0000000000):0.0000000000,Avicennia-marina-country_unknown53:0.0000000000):0.0000000000,Avicennia-marina-country_unknown57:0.0000000000):0.0000000000,Avicennia-marina-country_unknown81:0.0000000000):0.0000000000,Avicennia-marina-country_unknown92:0.0000000000):0.0000000000,Avicennia-marina-country_unknown54:0.0000000000):0.0000000000,Avicennia-marina-country_unknown77:0.0000000000):0.0000000000,Avicennia-marina-country_unknown59:0.0000000000):0.0000000000,Avicennia-marina-country_unknown70:0.0000000000):0.0000000000,Avicennia-marina-country_unknown90:0.0000000000):0.0000000000,Avicennia-marina-country_unknown72:0.0000000000):0.0000000000,Avicennia-marina-country_unknown104:0.0000000000):0.0000000000,Avicennia-marina-country_unknown60:0.0000000000):0.0000000000,Avicennia-marina-country_unknown95:0.0000000000):0.0000000000,Avicennia-marina-country_unknown93:0.0000000000):0.0000000000,Avicennia-marina-country_unknown55:0.0000000000):0.0000000000,Avicennia-marina-country_unknown105:0.0000000000):0.0000000000,Avicennia-marina-country_unknown96:0.0000000000):0.0000000000,Avicennia-marina-country_unknown52:0.0000000000):0.0000000000,Avicennia-marina-country_unknown76:0.0000000000):0.0000000000,Avicennia-marina-country_unknown74:0.0000000000):0.0000000000,Avicennia-marina-country_unknown69:0.0000000000):0.0000000000,Avicennia-marina-country_unknown83:0.0000000000):0.0000000000,Avicennia-marina-country_unknown89:0.0000000000):0.0000000000,Avicennia-marina-country_unknown97:0.0000000000):0.0000000000,Avicennia-marina-country_unknown79:0.0000000000):0.0000000000,Avicennia-marina-country_unknown67:0.0000000000):0.0000000000,Avicennia-marina-country_unknown73:0.0000000000):0.0000000000,Avicennia-marina-country_unknown94:0.0000000000):0.0000000000,Avicennia-marina-country_unknown86:0.0000000000):0.0000000000,Avicennia-marina-country_unknown68:0.0000000000):0.0000000000,Avicennia-marina-country_unknown88:0.0000000000):0.0000000000,Avicennia-marina-country_unknown75:0.0000000000):0.0000000000,Avicennia-marina-country_unknown82:0.0000000000):0.0000000000,Avicennia-marina-country_unknown98:0.0000000000):0.0000000000,Avicennia-marina-country_unknown80:0.0000000000):0.0000000000,Avicennia-marina-country_unknown87:0.0000000000):0.0000000000,Avicennia-marina-country_unknown71:0.0000000000):0.0000000000,Avicennia-marina-country_unknown56:0.0000000000):0.0000000000,Avicennia-marina-country_unknown99:0.0000000000):0.0000000000,Avicennia-marina-country_unknown58:0.0000000000):0.0000000000,Avicennia-marina-country_unknown78:0.0000000000):0.0000000000,Avicennia-marina-country_unknown106:0.0000000000):0.0000000000,Avicennia-marina-country_unknown100:0.0000000000):0.0000010000,Avicennia-marina-country_unknown51:0.0000010000)52:0.0000010000,(Avicennia-marina-country_unknown85:0.0090560338,Avicennia-marina-country_unknown102:0.0011562542)68:0.0011507546)74:0.0006551628,Avicennia-marina-country_unknown101:0.0000010000)54:0.0000010000,Avicennia-marina-India65:0.0000010000)56:0.0000010000,Avicennia-marina-India64:0.0054971285)71:0.0014232247,Avicennia-marina-India103:0.0011484884)"
   )
    const [selectedFamily, setSelectedFamily] = useState('Malvaceae');
    const [kmer, setkmer] = useState(5);
    const [filteredFamily, setfilteredFamily] = useState('Malvaceae');

    //handle input sequences
    const [fastaInput, setFastaInput] = useState('');
    const [fastaArray, setFastaArray] = useState([]);
    const [newickInput, setNewickInput] = useState('');

    //control drop down tree for download
    const [selectedNode, setSelectedNode] = useState(null);

    const handleNodeSelect = (event, nodeId) => {
      setSelectedNode(nodeId);
    };

    const data1 = [
      {
        name: "Sequence 1",
        sequence: "ATCGGCTAACGTATCGGCTAACGTATCGGCTAACGTATCGGCTAACGTATCGGCTAACGT",
      },
      { name: "Sequence 2", sequence: "ATCGGCTAACTTTGGGTTGACCTC" },
      { name: "Sequence 3", sequence: "ATCGGCTAACTTTTGGGTTAAAAAACCAA" },
      { name: "Sequence 4", sequence: "ATCGGCTAACTTT" },
      { name: "Sequence 5", sequence: "ATCGGCTAACTTT" },
    ];
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
    if(data){
    console.log("selectedFamily changed to:", selectedFamily);
    handleChange();
  }}, [selectedFamily, kmer]);
  
  
function handleChange(event) {
  if(event){
    console.log("kmer at handlechange")
    // if(data){
      const selectedValue = event.target.value;
      setSelectedFamily(selectedValue);
    
      const filteredData = data.filter(dat => dat.plant_genera.plant_families.family_name === selectedValue);
    
    // const selectedValue = event.target.value;
    // console.log("selectedValue");
    // console.log(selectedValue);

    setSelectedFamily(selectedValue);
    setfilteredFamily(filteredData)
    // const filteredData = data.filter(dat=>dat.plant_genera.plant_families.family_name===selectedFamily);
    console.log("filteredData");
    console.log(filteredData);

    // console.log(data.filter(dat=>dat.plant_genera.plant_families.family_name==selectedFamily));
    const sequences = Object.values(filteredData)
  .map((obj) => {
    if (obj.matk !== "Nan") {
      // const name = obj.plant_genera.genus_name + "_" + obj.species_name.slice(0,5);
      const name = obj.plant_genera.genus_name + "_" + obj.species_name.split(" ")[0];
      return {
        name:name,

        sequence: obj.matk,
      };
    }
  })
  .filter(Boolean); // This will log an array like data1
  console.log("sequences")
  console.log(sequences)
  var result = CalculateSimilarityMatrixModified(sequences,kmer);
  // var result = CalculateSimilarityMatrix(sequences);
  
  var newick = NeighborJoining(result.dist_mat, result.names);
  console.log("newick");
setNewickData(newick)  
setSelectedFamily(selectedValue)
console.log(" after main handle change")

console.log(kmer)
// setkmer(5)
 }

 else{
  const filteredData = data.filter(dat => dat.plant_genera.plant_families.family_name === selectedFamily);
    
  // const selectedValue = event.target.value;
  // console.log("selectedValue");
  // console.log(selectedValue);

  // setSelectedFamily(selectedValue);
  // const filteredData = data.filter(dat=>dat.plant_genera.plant_families.family_name===selectedFamily);
  console.log("filteredData");
  console.log(filteredData);

  // console.log(data.filter(dat=>dat.plant_genera.plant_families.family_name==selectedFamily));
  const sequences = Object.values(filteredData)
.map((obj) => {
  if (obj.matk !== "Nan") {
    // const name = obj.plant_genera.genus_name + "_" + obj.species_name.slice(0,5);
    const name = obj.plant_genera.genus_name + "_" + obj.species_name.split(" ")[0];
    return {
      name:name,

      sequence: obj.matk,
    };
  }
})
.filter(Boolean); // This will log an array like data1
console.log("sequences")
console.log(sequences)
var result = CalculateSimilarityMatrixModified(sequences,kmer);
// var result = CalculateSimilarityMatrix(sequences);

var newick = NeighborJoining(result.dist_mat, result.names);
console.log("newick");
setNewickData(newick)  
// setSelectedFamily(selectedValue)
 }};
  
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
  setkmer(newKmer)
  handleChange()

};
const handleInputChangefasta = (event) => {
  setFastaInput(event.target.value);
};
//handle input data
const handleSubmitfasta = (event) => {
  if(fastaInput){
  console.log('fasta array')
  console.log(fastaInput)

  setNewickData("")
  event.preventDefault();
  const fastaLines = fastaInput.trim().split('\n');
  let currentSequenceName = '';
  let currentSequence = '';
  const fastaArray = [];
  for (let line of fastaLines) {
    if (line.startsWith('>')) {
      if (currentSequenceName !== '') {
        fastaArray.push({
          name: currentSequenceName.slice(1),
          sequence: currentSequence
        });
        currentSequence = '';
      }
      currentSequenceName = line;
    } else {
      currentSequence += line.trim();
    }
  }
  fastaArray.push({
    name: currentSequenceName.slice(1),
    sequence: currentSequence
  });
  setFastaArray(fastaArray);
  console.log("fastaArray")
if(fastaArray){
  console.log(fastaArray)
  var result = CalculateSimilarityMatrixModified(fastaArray,kmer);
  // var result = CalculateSimilarityMatrix(sequences);
  
  var newick = NeighborJoining(result.dist_mat, result.names);
  console.log("newick");
  setNewickData(newick)  
}}};

//handle input of newick
const handleInputChangenewick = (event) => {
  setNewickInput(event.target.value);
};
//handle input data
const handleSubmitnewick = (event) => {
  event.preventDefault();

  if(newickInput){
  console.log('newick input')
  console.log(newickInput)
  console.log("newick input");
  setNewickData(newickInput)  
}};
// function handleChangekmer1(){
//   handleChangekmer;
  // handleChange()

// };

// useEffect(() => {
//   if(data){
//   handleChange();
// }}, [kmer]);

// useEffect(() => {
//   console.log("Selected integer: " + kmer);
// }, [kmer]);
    // const filteredData = data.filter(dat => dat.plant_genera.plant_families.family_name === selectedValue);
  
    //   const iframeRef = useRef(null);
    
      if (data) {

    
      
    const families= new Set(data.map(species=>species.plant_genera.plant_families.family_name));
    const families_list=[...families]; // Convert set to array
    console.log("familes")

    console.log(families)
    const filteredData = data.filter(dat => dat.plant_genera.plant_families.family_name === selectedFamily);
     
    return (
        <Container sx={{ marginTop: 4 }}>
          {/* <ConverttoFasta></ConverttoFasta> */}
          <Box sx={{ display: "flex" }}>
          
            <Box sx={{marginLeft:2}}>
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
        <Box sx={{marginLeft:3}}> kmer
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
<Box sx={{marginLeft:2}}>
<form onSubmit={handleSubmitfasta}>
  <label>
    <textarea value={fastaInput} onChange={handleInputChangefasta} placeholder="Enter FASTA sequence" autoFocus></textarea>
  </label>
  <br />
  <button type="submit">Submit</button>
</form>
</Box>
<Box sx={{marginLeft:2}}>
<TreeView
          className={classes.root}
          defaultCollapseIcon={<ExpandMoreIcon />}
          defaultExpandIcon={<ChevronRightIcon />}
          selected={selectedNode}
          onNodeSelect={handleNodeSelect}
        >
          <TreeItem nodeId="1" label="Download">
          <TreeItem nodeId="2" label="Sequences in fasta format">
          <SequenceDownload data={filteredData}/>

              {/* <TreeItem nodeId="4" label="Grandchild 2" /> */}
            </TreeItem>
    
            <TreeItem nodeId="5" label="Newick file">
            <NewickDownload newick={newickData} data={filteredData}/>

            </TreeItem>
   </TreeItem>
   
   </TreeView>
   </Box>
   <Box sx={{marginLeft:2}}>
<form onSubmit={handleSubmitnewick}>
  <label>
    <textarea value={newickInput} onChange={handleInputChangenewick} placeholder="Enter newick sequence" autoFocus></textarea>
  </label>
  <br />
  <button type="submit">Submit</button>
</form>
</Box>
   </Box>

          {" "}
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
    
//     import useSWR from "swr";
//     import { useEffect, useState } from "react";
//     import { useRef } from "react";
//     import { Box, FormControl, InputLabel, MenuItem, Select } from "@mui/material";
//     import { useRouter } from "next/router";
//     import {Container} from "@mui/material";
//     // import DistancematrixToNewick from "./neigbourjoining";
//     // import CalculateSimilarityMatrix from "./generateDistanceMatrix";
//     // import { NeighborJoining } from "./generateDistanceMatrix";
    
//     import CalculateSimilarityMatrix from "./generateDistanceMatrix";
//     import { NeighborJoining } from "./generateDistanceMatrix";
//     // export default function Newick() {
    
//     export default function Tree() {
//       const base_url = "http://localhost:3000";
    
//       const fetcher = (url) => fetch(url).then((r) => r.json());
//       const { data, error, isLoading } = useSWR(
//         `${base_url}/api/plants/plantSpecies`,
//         fetcher
//       );
    
//       const data1 = [
//         {
//           name: "Sequence 1",
//           sequence: "ATCGGCTAACGTATCGGCTAACGTATCGGCTAACGTATCGGCTAACGTATCGGCTAACGT",
//         },
//         { name: "Sequence 2", sequence: "ATCGGCTAACTTTGGGTTGACCTC" },
//         { name: "Sequence 3", sequence: "ATCGGCTAACTTTTGGGTTAAAAAACCAA" },
//         { name: "Sequence 4", sequence: "ATCGGCTAACTTT" },
//         { name: "Sequence 5", sequence: "ATCGGCTAACTTT" },
//       ];

//       const [newickData, setNewickData] = useState(
//         "(Avicennia-marina-country_unknown49:0.0000022752,((((((((((((((((((((((((((((((((((((((((((((((((((((((Avicennia-marina-country_unknown50:0.0000000000,Avicennia-marina-country_unknown91:0.0000000000):0.0000000000,Avicennia-marina-country_unknown84:0.0000000000):0.0000000000,Avicennia-marina-country_unknown61:0.0000000000):0.0000000000,Avicennia-marina-country_unknown66:0.0000000000):0.0000000000,Avicennia-marina-country_unknown62:0.0000000000):0.0000000000,Avicennia-marina-country_unknown63:0.0000000000):0.0000000000,Avicennia-marina-country_unknown53:0.0000000000):0.0000000000,Avicennia-marina-country_unknown57:0.0000000000):0.0000000000,Avicennia-marina-country_unknown81:0.0000000000):0.0000000000,Avicennia-marina-country_unknown92:0.0000000000):0.0000000000,Avicennia-marina-country_unknown54:0.0000000000):0.0000000000,Avicennia-marina-country_unknown77:0.0000000000):0.0000000000,Avicennia-marina-country_unknown59:0.0000000000):0.0000000000,Avicennia-marina-country_unknown70:0.0000000000):0.0000000000,Avicennia-marina-country_unknown90:0.0000000000):0.0000000000,Avicennia-marina-country_unknown72:0.0000000000):0.0000000000,Avicennia-marina-country_unknown104:0.0000000000):0.0000000000,Avicennia-marina-country_unknown60:0.0000000000):0.0000000000,Avicennia-marina-country_unknown95:0.0000000000):0.0000000000,Avicennia-marina-country_unknown93:0.0000000000):0.0000000000,Avicennia-marina-country_unknown55:0.0000000000):0.0000000000,Avicennia-marina-country_unknown105:0.0000000000):0.0000000000,Avicennia-marina-country_unknown96:0.0000000000):0.0000000000,Avicennia-marina-country_unknown52:0.0000000000):0.0000000000,Avicennia-marina-country_unknown76:0.0000000000):0.0000000000,Avicennia-marina-country_unknown74:0.0000000000):0.0000000000,Avicennia-marina-country_unknown69:0.0000000000):0.0000000000,Avicennia-marina-country_unknown83:0.0000000000):0.0000000000,Avicennia-marina-country_unknown89:0.0000000000):0.0000000000,Avicennia-marina-country_unknown97:0.0000000000):0.0000000000,Avicennia-marina-country_unknown79:0.0000000000):0.0000000000,Avicennia-marina-country_unknown67:0.0000000000):0.0000000000,Avicennia-marina-country_unknown73:0.0000000000):0.0000000000,Avicennia-marina-country_unknown94:0.0000000000):0.0000000000,Avicennia-marina-country_unknown86:0.0000000000):0.0000000000,Avicennia-marina-country_unknown68:0.0000000000):0.0000000000,Avicennia-marina-country_unknown88:0.0000000000):0.0000000000,Avicennia-marina-country_unknown75:0.0000000000):0.0000000000,Avicennia-marina-country_unknown82:0.0000000000):0.0000000000,Avicennia-marina-country_unknown98:0.0000000000):0.0000000000,Avicennia-marina-country_unknown80:0.0000000000):0.0000000000,Avicennia-marina-country_unknown87:0.0000000000):0.0000000000,Avicennia-marina-country_unknown71:0.0000000000):0.0000000000,Avicennia-marina-country_unknown56:0.0000000000):0.0000000000,Avicennia-marina-country_unknown99:0.0000000000):0.0000000000,Avicennia-marina-country_unknown58:0.0000000000):0.0000000000,Avicennia-marina-country_unknown78:0.0000000000):0.0000000000,Avicennia-marina-country_unknown106:0.0000000000):0.0000000000,Avicennia-marina-country_unknown100:0.0000000000):0.0000010000,Avicennia-marina-country_unknown51:0.0000010000)52:0.0000010000,(Avicennia-marina-country_unknown85:0.0090560338,Avicennia-marina-country_unknown102:0.0011562542)68:0.0011507546)74:0.0006551628,Avicennia-marina-country_unknown101:0.0000010000)54:0.0000010000,Avicennia-marina-India65:0.0000010000)56:0.0000010000,Avicennia-marina-India64:0.0054971285)71:0.0014232247,Avicennia-marina-India103:0.0011484884);"
//       );
     
     
//       const iframeRef = useRef(null);
//       const router = useRouter();
//       //   const [selectedFamily, setSelectedFamily] = useState(0);
//       const [selectedFamily, setSelectedFamily] = useState("");
    
//       const handleChange = (event) => {
//         if(data){
//          // console.log(CalculateSimilarityMatrix(data1));
//          console.log("data")

//          console.log(data)
//     //   var result = CalculateSimilarityMatrix(data);
//     //   var newick = NeighborJoining(result.dist_mat, result.names);
//     //   console.log("resuls");
    
//     //   console.log(result);
//       // console.log("distance matrixxxxxx");
//       // console.log(CalculateSimilarityMatrix());
    
//         const selectedValue = event.target.value;
//         console.log(selectedValue);
//         setSelectedFamily(selectedValue);
//         const filteredData = data.filter((item) => item.id === selectedFamily);
//         console.log("filteredData");
    
//         console.log(filteredData);
//         // setNewickData(selectedFamily.matk_newick);
//       }};
    
//       useEffect(() => {
//         if (newickData && iframeRef.current) {
//           // Wait for the iframe to load
//           iframeRef.current.addEventListener("load", () => {
//             // Send data to the iframe
//             iframeRef.current.contentWindow.postMessage({ newickData }, "*");
//           });
//         }
//       }, [newickData]);
//       //   console.log("selectedFamily");
//       //   console.log(selectedFamily);
//       //   console.log(newickData);
    
//       const menuContainerStyle = {
//         height: '200px',
//         overflowY: 'scroll',
//       };
      
//   if (data) {
//     const families= new Set(data.map(species=>species.plant_genera.plant_families.family_name));
//     const families_list=[...families]; // Convert set to array
//     console.log("familes")

//     console.log(families)

//     // const filteredData = data.filter((item) => item.id === selectedFamily);
//     // console.log("filteredDataa");
//     // console.log(newickData);
//     // console.log(selectedFamily);

    // return (
    //   <Container sx={{ marginTop: 4 }}>
    //     <Box sx={{ display: "flex" }}>
    //       <Box
    //         sx={{
    //           fontWeight: "bold",
    //         }}
    //       >
    //         Family{" "}
    //       </Box>
    //       {/* <Box sx={{padding:0}}> */}
    //       <FormControl fullWidth variant="outlined">
    //         <InputLabel>Select family</InputLabel>
    //         <Select
    //           value={selectedFamily}
    //           onChange={handleChange}
    //           label="Families"
    //           //   IconComponent={ArrowDropDown}
    //         >
              
    //           {/* <MenuItem>
    //     {families_list.map((family, index) => (
    //         family
    //                 // < key={index} style={{ display: 'flex' ,flexDirection:"column" }}>{family}</li>
    //     ))}
    //   </MenuItem> */}
      
    //   {/* <div> */}
    //   {/* <MenuItem> */}
    //     <div style={menuContainerStyle}>
    //       {families_list.map((family, index) => (
    //         <MenuItem key={index} value={family}>
    //           {family}
    //         </MenuItem>
    //       ))}
    //     </div>
    //   {/* </MenuItem> */}
    // {/* </div> */}
    //         </Select>
    //       </FormControl>
    //       {/* </Box> */}
    //     </Box>
    //     {" "}
    //     <Box>
    //           <iframe
    //             ref={iframeRef}
    //             src={`/phylotree.html?newickData=${newickData}`}
    //             style={{
    //               position: "relative",
    //               top: 3,
    //               left: 2,
    //               width: "100%", // Set a fixed width
    //               height: "100vh", // Set a fixed height
    //             }}
    //           />
    //         </Box>
    //       </Container>
    //     );
    //   }
    // }
    