import { Box } from '@mui/material';
import { makeStyles } from '@mui/styles';
import LeafDetailValues from './Leaf/leafDetailValues';
import PlantDetailValues from './Plant/plantDetailValuesMUI';
import FruitDetailValues from './Fruit/fruitDetailValues';

const useStyles = makeStyles({
  root: {
    display: 'row',
  },
});
export default function PlantDetailsFeaturesValues({ plants_data }) {
  const classes = useStyles();
  return (
    <Box className={classes.root} sx={{ marginTop: 2 }}>
      <Box sx={{ padding: 0.5 }} />
      <Box sx={{ padding: 0.5 }}>
        <PlantDetailValues plants_data={plants_data} />
      </Box>
      <Box sx={{ padding: 0.5 }}>
        <LeafDetailValues leaves_data={plants_data} />
      </Box>
      <Box sx={{ padding: 0.5 }}>
        <FruitDetailValues fruits_data={fruits_data} />
      </Box>
    </Box>
  );
}
// import PlantFeatureKeys from "./Plant/plantFeatureKeys";
// import LeafFeatureKeys from "./Leaf/leafFeatureKeys";
// import FruitFeatureKeys from "./Fruit/fruitFeatureKeys";
// import { Box, useMediaQuery } from "@mui/material";
// import { makeStyles } from "@mui/styles";

// const useStyles = makeStyles({
//   root: {
//     display: 'row',
//     flexDirection: 'column',
//     alignItems: 'center',
//   },
// });

// export default function PlantDetailsFeaturesValues({plants_data}) {
//   const classes = useStyles();
//   const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));

//   return (
//     <Box className={classes.root} sx={{ marginTop: 2 }}>
//       <Box sx={{ padding: 0.5 }}>
//         <PlantFeatureKeys />
//       </Box>
//       {isSmallScreen ? (
//         <>
//           <Box sx={{ padding: 0.5 }}>
//             <FruitFeatureKeys plants_data={plants_data} />
//           </Box>
//           <Box sx={{ padding: 0.5 }}>
//             <LeafFeatureKeys plants_data={plants_data} />
//           </Box>
//         </>
//       ) : (
//         <>
//           <Box sx={{ padding: 0.5 }}>
//             <LeafFeatureKeys plants_data={plants_data} />
//           </Box>
//           <Box sx={{ padding: 0.5 }}>
//             <FruitFeatureKeys plants_data={plants_data} />
//           </Box>
//         </>
//       )}
//     </Box>
//   );
// }
