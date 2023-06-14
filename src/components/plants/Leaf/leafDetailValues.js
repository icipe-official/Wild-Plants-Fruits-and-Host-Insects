// import { Container } from '@mui/material';
import { Box } from "@mui/system";
import DynamicValueCard from "../dynamicvaluecard";

export default function LeafDetailValues({ leaves_data }) {
  // console.log("leaves data");
  // console.log(leaves_data);
  // console.log("leaf types");
  // console.log(leaves_data.map((leaf) => leaf.leaf_type));
  // console.log("leaf margin");
  // console.log(
  //   leaves_data.map((leaf) => leaf.plants_leaf_margins.map((margin) => margin))
  // );
  // console.log("leaf arrangement");
  // console.log(
  //   leaves_data.map((leaf) =>
  //     leaf.plants_leaf_arrangements.map((arrangement) => arrangement)
  //   )
  // );

  // padding 3 ensures first line is mapped to fruits in the features

  return leaves_data.map((leaf, index) => (
    <Box
      key={index}
      sx={{ paddingTop: "1rem", marginRight: "1rem", marginBottom: 2 }}
    >
      <Box sx={{ color: "green" }}>Leaf</Box>

      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Type:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            key={`${leaf.id}type`}
            keyName="type"
            value={leaf.leaf_type}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Margin:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            yName="Leaf margin"
            value={leaf.plants_leaf_margins.map(
              (margin) => `${margin.leaf_margins.type_of_leaf_margin} `
            )}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Arrangement:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            key={`${leaf.id}arrange`}
            keyName="Leaf arrangement"
            value={leaf.plants_leaf_arrangements.map(
              (arrangement) => `${arrangement.leaf_arrangements.arrangement} `
            )}
          />
        </Box>
      </Box>
    </Box>
  ));
}
