import { Box } from "@mui/material";
import DynamicValueCard from "../dynamicvaluecard";
// import FruitDetails from "../fruitdetailsMUI";
// import PlantFeatureKeys from "./plantFeatures";
// This component will be receiving data from getstaticprops
export default function PlantDetailValues({ plants_data }) {
  return plants_data?.map((specie, index) => (
    <Box key={index} sx={{ paddingTop: "1rem", marginRight: "1rem" }}>
      <Box sx={{ color: "maroon" }}>Plant</Box>

      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Type:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            keyName="Type"
            value={specie.plants_shrub_climbings.map((type, index) => {
              const word = `${type.shrub_climbings.tree_type}`;
              const isLastWord =
                index === specie.plants_shrub_climbings.length - 1;
              const separator = isLastWord
                ? ""
                : index === specie.plants_shrub_climbings.length - 2
                ? " or "
                : ", ";
              return word + separator;
            })}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Thorns and spines:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            keyName="Thorns, spines and priddes"
            value={specie.plants_spines_thorns.map((spine, index) => {
              const value = spine.spines_thorns.thorns_spines;
              const isLastValue =
                index === specie.plants_spines_thorns.length - 1;
              const separator = isLastValue
                ? ""
                : index === specie.plants_spines_thorns.length - 2
                ? " or "
                : ", ";
              return value + separator;
            })}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Latex:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            keyName="Latex"
            value={specie.plants_latex.map((latex, index) => {
              const value = latex.latex.latex_description;
              const isLastValue = index === specie.plants_latex.length - 1;
              const separator = isLastValue
                ? ""
                : index === specie.plants_latex.length - 2
                ? " or "
                : ", ";
              return value + separator;
            })}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Minimum elevation:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            keyName="Minimum latitude"
            value={specie.min_latitude}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Maximum elevation:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            keyName="Maximum latitude"
            value={specie.max_latitude}
          />
        </Box>
      </Box>
    </Box>
  ));
}
