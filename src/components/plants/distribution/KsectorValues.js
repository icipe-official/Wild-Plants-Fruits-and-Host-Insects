import { Box } from "@mui/system";
import DynamicValueCard from "../dynamicvaluecard";

export default function KsectorValues({ k_sector_data }) {
  ////console.log('k_sector_data client side');
  ////console.log(k_sector_data);
  ////console.log('fruit types data client side');
  // ////console.log(k_sector_data.map((sector)=>sector.plants_k_sectors.map(sector=>sector)))

  // padding 3 ensures first line is mapped to fruits in the features
  return k_sector_data.map((sector, index) => (
    // <Box key={sector.id}>

    <Box key={index} sx={{ paddingTop: "1rem" }}>
      <Box sx={{ display: "flex", alignItems: "center" }}>
        <Box sx={{ width: "30%", marginBottom: "1rem" }}>K sectors:</Box>
        <Box sx={{ width: "100%" }}>
          <DynamicValueCard
            key={index}
            keyName="K sector"
            value={sector.plants_k_sectors.map(
              (sector) => `${sector.k_sectors.sector} `
            )}
          />
        </Box>
      </Box>
    </Box>
  ));
}
