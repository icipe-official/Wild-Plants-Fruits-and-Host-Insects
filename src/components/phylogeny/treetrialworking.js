import useSWR from "swr";
import { useEffect, useState } from "react";
import { useRef } from "react";
import { Box, FormControl, InputLabel, MenuItem, Select } from "@mui/material";
import { useRouter } from "next/router";
import {Container} from "@mui/material";
// import DistancematrixToNewick from "./neigbourjoining";
// import CalculateSimilarityMatrix from "./generateDistanceMatrix";
// import { NeighborJoining } from "./generateDistanceMatrix";

import CalculateSimilarityMatrix from "./generateDistanceMatrix";
import { NeighborJoining } from "./generateDistanceMatrix";
// export default function Newick() {

export default function TreeTrial() {
  const base_url = "http://localhost:3000";

  const fetcher = (url) => fetch(url).then((r) => r.json());
  const { data, error, isLoading } = useSWR(
    `${base_url}/api/plants/plantSpecies`,
    fetcher
  );
  const [newickData, setNewickData] = useState(
    "(Avicennia-marina-country_unknown49:0.0000022752,((((((((((((((((((((((((((((((((((((((((((((((((((((((Avicennia-marina-country_unknown50:0.0000000000,Avicennia-marina-country_unknown91:0.0000000000):0.0000000000,Avicennia-marina-country_unknown84:0.0000000000):0.0000000000,Avicennia-marina-country_unknown61:0.0000000000):0.0000000000,Avicennia-marina-country_unknown66:0.0000000000):0.0000000000,Avicennia-marina-country_unknown62:0.0000000000):0.0000000000,Avicennia-marina-country_unknown63:0.0000000000):0.0000000000,Avicennia-marina-country_unknown53:0.0000000000):0.0000000000,Avicennia-marina-country_unknown57:0.0000000000):0.0000000000,Avicennia-marina-country_unknown81:0.0000000000):0.0000000000,Avicennia-marina-country_unknown92:0.0000000000):0.0000000000,Avicennia-marina-country_unknown54:0.0000000000):0.0000000000,Avicennia-marina-country_unknown77:0.0000000000):0.0000000000,Avicennia-marina-country_unknown59:0.0000000000):0.0000000000,Avicennia-marina-country_unknown70:0.0000000000):0.0000000000,Avicennia-marina-country_unknown90:0.0000000000):0.0000000000,Avicennia-marina-country_unknown72:0.0000000000):0.0000000000,Avicennia-marina-country_unknown104:0.0000000000):0.0000000000,Avicennia-marina-country_unknown60:0.0000000000):0.0000000000,Avicennia-marina-country_unknown95:0.0000000000):0.0000000000,Avicennia-marina-country_unknown93:0.0000000000):0.0000000000,Avicennia-marina-country_unknown55:0.0000000000):0.0000000000,Avicennia-marina-country_unknown105:0.0000000000):0.0000000000,Avicennia-marina-country_unknown96:0.0000000000):0.0000000000,Avicennia-marina-country_unknown52:0.0000000000):0.0000000000,Avicennia-marina-country_unknown76:0.0000000000):0.0000000000,Avicennia-marina-country_unknown74:0.0000000000):0.0000000000,Avicennia-marina-country_unknown69:0.0000000000):0.0000000000,Avicennia-marina-country_unknown83:0.0000000000):0.0000000000,Avicennia-marina-country_unknown89:0.0000000000):0.0000000000,Avicennia-marina-country_unknown97:0.0000000000):0.0000000000,Avicennia-marina-country_unknown79:0.0000000000):0.0000000000,Avicennia-marina-country_unknown67:0.0000000000):0.0000000000,Avicennia-marina-country_unknown73:0.0000000000):0.0000000000,Avicennia-marina-country_unknown94:0.0000000000):0.0000000000,Avicennia-marina-country_unknown86:0.0000000000):0.0000000000,Avicennia-marina-country_unknown68:0.0000000000):0.0000000000,Avicennia-marina-country_unknown88:0.0000000000):0.0000000000,Avicennia-marina-country_unknown75:0.0000000000):0.0000000000,Avicennia-marina-country_unknown82:0.0000000000):0.0000000000,Avicennia-marina-country_unknown98:0.0000000000):0.0000000000,Avicennia-marina-country_unknown80:0.0000000000):0.0000000000,Avicennia-marina-country_unknown87:0.0000000000):0.0000000000,Avicennia-marina-country_unknown71:0.0000000000):0.0000000000,Avicennia-marina-country_unknown56:0.0000000000):0.0000000000,Avicennia-marina-country_unknown99:0.0000000000):0.0000000000,Avicennia-marina-country_unknown58:0.0000000000):0.0000000000,Avicennia-marina-country_unknown78:0.0000000000):0.0000000000,Avicennia-marina-country_unknown106:0.0000000000):0.0000000000,Avicennia-marina-country_unknown100:0.0000000000):0.0000010000,Avicennia-marina-country_unknown51:0.0000010000)52:0.0000010000,(Avicennia-marina-country_unknown85:0.0090560338,Avicennia-marina-country_unknown102:0.0011562542)68:0.0011507546)74:0.0006551628,Avicennia-marina-country_unknown101:0.0000010000)54:0.0000010000,Avicennia-marina-India65:0.0000010000)56:0.0000010000,Avicennia-marina-India64:0.0054971285)71:0.0014232247,Avicennia-marina-India103:0.0011484884);"
  );
  const [selectedFamily, setSelectedFamily] = useState('Malvaceae');
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
    

function handleChange(event) {
    if(data){
    const selectedValue = event.target.value;
    console.log("selectedValue");
    console.log(selectedValue);

    setSelectedFamily(selectedValue);
    const filteredData = data.filter(dat=>dat.plant_genera.plant_families.family_name==selectedFamily);
    console.log("filteredData");
    // console.log(data.filter(dat=>dat.plant_genera.plant_families.family_name==selectedFamily));
    const sequences = Object.values(filteredData)
  .map((obj) => {
    if (obj.matk !== "Nan") {
        const name = obj.plant_genera.genus_name + "_" + obj.species_name.slice(0,5);

      return {
        name:name,

        sequence: obj.matk,
      };
    }
  })
  .filter(Boolean); // This will log an array like data1
  console.log("sequences")

  console.log(sequences)
  var result = CalculateSimilarityMatrix(sequences);
  // var result = CalculateSimilarityMatrix(sequences);
  
  var newick = NeighborJoining(result.dist_mat, result.names);
  console.log("newick");
setNewickData(newick)  

 } };
  
    //   const iframeRef = useRef(null);
    
      if (data) {
        // const sequences = Object.values(data)
        //   .map((obj) => {
        //     if (obj.matk !== "Nan") {
        //         const name = obj.plant_genera.genus_name + "_" + obj.species_name.slice(0,5);

        //       return {
        //         name:name,
    
        //         sequence: obj.matk,
        //       };
        //     }
        //   })
        //   .filter(Boolean); // This will log an array like data1
        // console.log(sequences);
    
        // console.log(sequences);
    
        // console.log(sequences);
        // // console.log(CalculateSimilarityMatrix(data1));
        // var result = CalculateSimilarityMatrix(sequences.slice(5, 10));
        // // var result = CalculateSimilarityMatrix(sequences);
    
        // var newick = NeighborJoining(result.dist_mat, result.names);
        // console.log("newick");

       
    // if(data){
    //     console.log("ffffff")
    //     console.log(data.filter(sp=>sp.plant_genera.plant_families.id== 1));
    //     console.log(data)
    // }
        // console.log(sequences.slice(0, 10));
    
        // console.log("distance matrixxxxxx");
        // console.log(CalculateSimilarityMatrix());
    
        // const [newickData, setNewickData] = useState(
        //   // dict
        // );

    
      
    const families= new Set(data.map(species=>species.plant_genera.plant_families.family_name));
    const families_list=[...families]; // Convert set to array
    console.log("familes")

    console.log(families)

    // const filteredData = data.filter((item) => item.id === selectedFamily);
    // console.log("filteredDataa");
    // console.log(newickData);
    // console.log(selectedFamily);
          const menuContainerStyle = {
        height: '200px',
        overflowY: 'scroll',
      };
    
    return (
        <Container sx={{ marginTop: 4 }}>
          <Box sx={{ display: "flex" }}>
            <Box
              sx={{
                fontWeight: "bold",
              }}
            >
              Family{" "}
            </Box>
            {/* <Box sx={{padding:0}}> */}
            <FormControl fullWidth variant="outlined">
              <InputLabel>Select family</InputLabel>
              <Select
                value={selectedFamily}
                onChange={(event) => handleChange(event)}

                label="Families"
                //   IconComponent={ArrowDropDown}
              >
                
                {/* <MenuItem>
          {families_list.map((family, index) => (
              family
                      // < key={index} style={{ display: 'flex' ,flexDirection:"column" }}>{family}</li>
          ))}
        </MenuItem> */}
        
        {/* <div> */}
        {/* <MenuItem> */}
          {/* <div style={menuContainerStyle}> */}
            {families_list.map((family, index) => (
              <MenuItem key={index} value={family}>
                {family}
              </MenuItem>
            ))}
          {/* </div> */}
        {/* </MenuItem> */}
      {/* </div> */}
              </Select>
            </FormControl>
            {/* </Box> */}
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
    