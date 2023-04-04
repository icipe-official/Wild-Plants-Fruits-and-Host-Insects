import { makeStyles } from "@mui/styles";
import React, { useState } from "react";
import {
  Button,
  Card,
  CardActions,
  CardContent,
  Typography,
} from "@mui/material";
import { Box } from "@mui/system";

// Define styles using makeStyles function
const useStyles = makeStyles({
  // card: {
  //   width:310,
  //   // margin: 'auto',
  //   marginLeft:2
  // },
  // expandButton: {
  //   marginLeft: 'auto',
  // },
  // expandedContent: {
  //   marginTop: 20,
  //   whiteSpace: 'pre-wrap',
  // },
});

/**
 * PlantDescriptionMUI component that displays the name, description, and details of a plant.
 * @param {object} plant - The plant object that contains the name, description, and details of the plant.
 * @returns {JSX.Element} A Card component that displays the name, description, and details of the plant.
 */
export default function PlantDescriptionMUI({ plants_data }) {
  // Use the useStyles function to get styles
  const classes = useStyles();
  // Use the useState hook to manage state
  const [expanded, setExpanded] = useState(false);

  // Define handleExpandClick function to handle button click
  const handleExpandClick = () => {
    setExpanded(!expanded);
  };

  // Return the card component
  return plants_data.map((specie) => (
    <>
      <Box sx={{ marginLeft: 2 }}>Description</Box>
      <Box sx={{ marginLeft: 2 }}>
        <Card key={specie.id} className={classes.card}>
          <CardContent>
            {/* Display the name of the plant using Typography component */}
            {/* <Typography variant="h5" component="h2">
          {plant.name}
        </Typography> */}
            {/* Display the description of the plant using Typography component, with styles to truncate text if it exceeds four lines */}
            <Typography
              variant="body2"
              color="textSecondary"
              component="p"
              style={{
                overflow: "hidden",
                textOverflow: "ellipsis",
                display: "-webkit-box",
                WebkitLineClamp: 4,
                WebkitBoxOrient: "vertical",
              }}
            >
              {specie.description}
            </Typography>
          </CardContent>
          {/* If expanded state is true, display the details of the plant using CardContent and Typography components */}
          {expanded && (
            <CardContent className={classes.expandedContent}>
              <Typography variant="body2" color="textSecondary" component="p">
                {specie.description}
              </Typography>
            </CardContent>
          )}
          <CardActions disableSpacing>
            {/* Display the "More Details" button using Button component */}
            <Button
              className={classes.expandButton}
              onClick={handleExpandClick}
            >
              {expanded ? "Less Details" : "More Details"}
            </Button>
          </CardActions>
        </Card>
      </Box>
    </>
  ));
}
