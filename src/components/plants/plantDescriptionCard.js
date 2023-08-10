import React, { useState } from "react";
import { makeStyles } from "@mui/styles";
import {
  Card,
  CardContent,
  Typography,
  Box,
  Stack,
  Button,
} from "@mui/material";
import InfoIcon from "@mui/icons-material/Info";
const useStyles = makeStyles({
  root: {
    width: "100%",
    // maxWidth: 500,
    // margin: 'auto',
    height: "100%",
  },
});

export default function PlantDescription({ plants_data }) {
  const classes = useStyles();
  const [selectedPlant, setSelectedPlant] = useState(null);

  const handlePlantClick = (plant) => {
    setSelectedPlant(plant);
  };

  const handleClose = () => {
    setSelectedPlant(null);
  };

  if (plants_data) {
    return (
      <>
        {plants_data.map((specie) => (
          <Box key={specie.id}>
            <Button
              sx={{ fontWeight: "bold", cursor: "pointer" }}
              onClick={() => handlePlantClick(specie)}
            >
              <InfoIcon /> Plant description
            </Button>
            {/* <Box sx={{ marginLeft: 0 }}>
              <Card className={classes.root}>
                <CardContent>{specie.description}</CardContent>
              </Card>
            </Box> */}
          </Box>
        ))}
        {selectedPlant && (
          <PlantPopup plant={selectedPlant} onClose={handleClose} />
        )}
      </>
    );
  }
  // else {
  //   return (
  //     <>
  //       <Button
  //         sx={{ fontWeight: "bold", cursor: "pointer" }}
  //         onClick={() => handlePlantClick("specie")}
  //       >
  //         <InfoIcon /> Plant description
  //       </Button>
  //       {/* <Box sx={{ marginLeft: 0 }}>
  //         <Card className={classes.root}>
  //           <CardContent>kkkkkkk</CardContent>
  //         </Card>
  //       </Box> */}
  //       {selectedPlant && <PlantPopup plant="tttt" onClose={handleClose} />}
  //     </>
  //   );
  // }
}
function PlantPopup({ plant, onClose }) {
  return (
    <Box
      sx={{
        position: "fixed",
        top: 0,
        left: 0,
        width: "100%",
        height: "100%",
        backgroundColor: "rgba(0, 0, 0, 0.5)",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        zIndex: 9999,
      }}
    >
      <Box
        sx={{
          backgroundColor: "#fff",
          padding: "20px",
          borderRadius: "8px",
          position: "relative",
        }}
      >
        <Typography variant="h5" sx={{ fontWeight: "bold" }}>
          abutilon hirtum
        </Typography>
        <Typography variant="body1">kkkkkkkkkkkkkkkk</Typography>
        <Box
          sx={{
            position: "absolute",
            top: "8px",
            right: "8px",
            cursor: "pointer",
          }}
          onClick={onClose}
        >
          Close
        </Box>
      </Box>
    </Box>
  );
}
