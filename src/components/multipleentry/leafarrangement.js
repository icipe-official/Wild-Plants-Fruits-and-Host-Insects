import { Box, Typography, useMediaQuery } from "@mui/material";
import { makeStyles } from "@mui/styles"; // custom component  styles
import Router from "next/router";
import { useState } from "react";
// custom styless
const useStyles = makeStyles({
  component1: {
    height: "220px",
    overflowY: "auto",
    border: "1px solid #ccc",
    borderRadius: "4px",
    width: "100%",
    boxShadow: "2px 2px 2px rgba(0, 0, 0, 0.1)",
    padding: "10px",
    marginLeft: "0.5rem",
    marginBottom: "0.5rem",
  },
  item: {
    cursor: "pointer",
    padding: "5px",
    borderBottom: "1px solid #ccc",
    "&:active": {
      color: "black",
    },
  },
  itemChecked: {
    backgroundColor: "black",
    color: "white",
  },
  horizontalboundary: {
    display: "flex",
    border: "1px solid #ccc",
    borderRadius: "4px",
    width: "100%",
    marginTop: "0.5rem",
    marginBottom: "0.5rem",
  },
});

export default function Leafarrangement({
  leaf_arrangement_array,
  handleOnChangeLeafArrangement,
  checkedStateLeafArrangement,
}) {
  const classes = useStyles();
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));
  return (
    <Box sx={{ marginLeft: isSmallScreen ? 0 : 2, width: "100%" }}>
      <Box sx={{ marginTop: 3 }}>
        <Typography variant="subtitle1" sx={{ color: "green" }}>
          Arrangement{" "}
          {/* <Box
      sx={{
        display: "inline-flex",
        alignItems: "flex-end",
        marginLeft: "1rem",
      }}
    >
      {message_leaf_arrangements}
    </Box> */}
        </Typography>
      </Box>
      <Box className={classes.component1}>
        {leaf_arrangement_array.map((spine, index) => (
          <div
            key={spine}
            onClick={() => handleOnChangeLeafArrangement(index)}
            className={`${classes.item} ${
              checkedStateLeafArrangement[index] ? classes.itemChecked : ""
            }`}
          >
            {spine}
          </div>
        ))}
      </Box>
    </Box>
  );
}
