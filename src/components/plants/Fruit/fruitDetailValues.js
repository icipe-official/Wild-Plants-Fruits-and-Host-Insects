import { Container } from "@mui/material";
import { Box } from "@mui/system";
import DynamicValueCard from "../dynamicvaluecard";

export default function FruitDetailValues({ fruits_data }) {
  return fruits_data?.map((specie, index) => (
    <Box key={index} sx={{ paddingTop: "1rem", marginRight: "1rem" }}>
      <Box sx={{ color: "red" }}>Fruit</Box>

      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Type:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            value={specie.plants_fruit_types.map((fruit, index) => {
              const value = `${fruit.fruit_types.type_of_fruit}`;
              const isLastValue =
                index === specie.plants_fruit_types.length - 1;
              const separator = isLastValue
                ? ""
                : index === specie.plants_fruit_types.length - 2
                ? " or "
                : ", ";
              return value + separator;
            })}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Color:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            value={specie.plants_fruit_colors.map((color, index) => {
              const value = `${color.fruit_colors.color}`;
              const isLastValue =
                index === specie.plants_fruit_colors.length - 1;
              const separator = isLastValue
                ? ""
                : index === specie.plants_fruit_colors.length - 2
                ? " or "
                : ", ";
              return value + separator;
            })}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Shape:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            value={specie.plants_fruit_shapes.map((shape, index) => {
              const value = `${shape.fruit_shapes.shape}`;
              const isLastValue =
                index === specie.plants_fruit_shapes.length - 1;
              const separator = isLastValue
                ? ""
                : index === specie.plants_fruit_shapes.length - 2
                ? " or "
                : ", ";
              return value + separator;
            })}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Size:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            value={specie.plants_fruit_sizes.map((size, index, array) => {
              const value = `${size.fruit_sizes.size}`;
              const isLastValue = index === array.length - 1;
              const separator =
                array.length > 1 && !isLastValue
                  ? index === array.length - 2
                    ? " or "
                    : ", "
                  : "";
              return value + separator;
            })}
          />
        </Box>
      </Box>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "55%" }}>Fruiting months:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            value={specie.plants_fruiting_months
              .map((month, index) => {
                const value = month.fruiting_months.month;

                // Skip if the month is "unknown"
                if (value === "unknown") {
                  return null;
                }

                const isLastValue =
                  index === specie.plants_fruiting_months.length - 1;
                const separator = isLastValue
                  ? ""
                  : index === specie.plants_fruiting_months.length - 2
                  ? " or "
                  : ", ";

                return value + separator;
              })
              .filter((month) => month !== null)} // Filter out "unknown" months
          />
        </Box>
      </Box>
    </Box>
  ));
}
