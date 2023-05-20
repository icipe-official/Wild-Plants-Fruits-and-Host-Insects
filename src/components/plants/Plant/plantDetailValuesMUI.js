import { Box } from "@mui/material";
import DynamicValueCard from "../dynamicvaluecard";
// import FruitDetails from "../fruitdetailsMUI";
// import PlantFeatureKeys from "./plantFeatures";
//This component will be receiving data from getstaticprops
export default function PlantDetailValues({ plants_data }) {
  console.log("plants_data");
  console.log(plants_data.map((specie) => specie));
  console.log("stem type");
  console.log(
    plants_data.map((specie) =>
      specie.plants_shrub_climbings.map(
        (type) => type.shrub_climbings.tree_type
      )
    )
  );

  console.log("spines, thorns, priddes");

  console.log(
    plants_data.map((specie) =>
      specie.plants_spines_thorns.map((spine) => spine.spines_thorns)
    )
  );
  console.log("spines_thorns_pridedes");
  console.log(
    plants_data.map((specie) =>
      specie.plants_spines_thorns.map((fruit) => fruit)
    )
  );
  //.map(family => family.name)));

  return plants_data.map((specie, index) => (
    <Box key={index} sx={{ paddingTop: "1rem", marginRight: "1rem" }}>
      <Box sx={{ color: "maroon" }}>Plant</Box>

      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Type:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            keyName="Type"
            value={specie.plants_shrub_climbings.map(
              (type) => type.shrub_climbings.tree_type + " "
            )}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Thorns and spines:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            keyName="Thorns, spines and priddes"
            value={specie.plants_spines_thorns.map(
              (spine) => spine.spines_thorns.thorns_spines
            )}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Latex:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            keyName="Latex"
            value={specie.plants_latex.map(
              (latex) => latex.latex.latex_description
            )}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Minimum latitude:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            keyName="Minimum latitude"
            value={specie.min_latitude}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Maximum latitude:</Box>
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
