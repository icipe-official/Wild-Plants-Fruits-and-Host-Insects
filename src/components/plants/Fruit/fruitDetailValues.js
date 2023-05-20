import { Container } from "@mui/material";
import { Box } from "@mui/system";
import DynamicValueCard from "../dynamicvaluecard";
export default function FruitDetailValues({ fruits_data }) {
  console.log("dataaaa");
  console.log(fruits_data);
  console.log("fruit types");
  console.log(
    fruits_data.map((specie) =>
      specie.plants_fruiting_months.map((fruit) => fruit)
    )
  );
  console.log("fruit colors");
  console.log("fruit shapes");
  console.log(
    fruits_data.map((specie) =>
      specie.plants_fruit_shapes.map((shape) => shape.fruit_shapes.shape)
    )
  );

  return fruits_data.map((specie, index) => (
    <Box key={index} sx={{ paddingTop: "1rem", marginRight: "1rem" }}>
      <Box sx={{ color: "red" }}>Fruit</Box>

      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Type:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            value={specie.plants_fruit_types.map(
              (fruit) => fruit.fruit_types.type_of_fruit + " "
            )}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Color:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            value={specie.plants_fruit_colors.map(
              (color) => color.fruit_colors.color + " "
            )}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Shape:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            value={specie.plants_fruit_shapes.map(
              (shape) => shape.fruit_shapes.shape + " "
            )}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Size:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            value={specie.plants_fruit_sizes.map(
              (size) => size.fruit_sizes.size + " "
            )}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Fruiting months:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            value={specie.plants_fruiting_months.map(
              (month) => month.fruiting_months.month + " "
            )}
          />
        </Box>
      </Box>
    </Box>
  ));
}
