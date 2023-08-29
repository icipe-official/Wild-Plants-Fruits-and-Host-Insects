import React, { useState } from "react";
import { makeStyles } from "@mui/styles";
import {
  Card,
  CardContent,
  Typography,
  Box,
  Stack,
  Button,
  IconButton,
} from "@mui/material";
import InfoIcon from "@mui/icons-material/Info";
import { Close, CloseOutlined } from "@mui/icons-material";

// Define styles using makeStyles from MUI
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

  // Function to handle when a plant is clicked
  const handlePlantClick = (plant) => {
    setSelectedPlant(plant);
  };

  // Function to close the popup
  const handleClose = () => {
    setSelectedPlant(null);
  };

  // Check if plant descriptions exist in the data
  if (plants_data[0].plant_description) {
    console.group("plants_data"); // Start a console group

    console.group(plants_data); // Log plants_data within the group

    return (
      <>
        {/* Map through each plant specie */}
        {plants_data.map((specie) => (
          <Box key={specie.id}>
            <Button
              sx={{ fontWeight: "bold", cursor: "pointer" }}
              onClick={() => handlePlantClick(specie)}
            >
              <InfoIcon /> Plant description
            </Button>
            {/* Display plant description if needed */}
            {/* <Box sx={{ marginLeft: 0 }}>
              <Card className={classes.root}>
                <CardContent>{specie.plant_description}</CardContent>
              </Card>
            </Box> */}
          </Box>
        ))}

        {/* Display the selected plant popup */}
        {selectedPlant && (
          <PlantPopup plant={plants_data} onClose={handleClose} />
        )}
      </>
    );
  }
}

// Component for displaying the plant popup
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
          padding: 2,
          borderRadius: "8px",
          position: "relative",
          width: "50%", // Adjust the width as needed
        }}
      >
        <IconButton
          sx={{
            position: "absolute",
            top: 0,
            right: 0,
            color: "red", // Change icon color to red
          }}
          onClick={onClose}
        >
          <CloseOutlined />
        </IconButton>
        {/* Display the selected plant's information */}
        <Typography variant="h5" sx={{ fontWeight: "bold", marginBottom: 1 }}>
          {plant[0]?.plant_genera.genus_name} {plant[0]?.species_name}
        </Typography>
        <Typography variant="body1">
          {" "}
          Description:{plant[0].plant_description}
        </Typography>
      </Box>
    </Box>
  );
}
