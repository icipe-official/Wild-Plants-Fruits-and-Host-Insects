import { Box, Typography, useMediaQuery } from "@mui/material";
import { makeStyles } from "@mui/styles"; // custom component  styles
import Router from "next/router";
import { useState } from "react";
// custom styless
const useStyles = makeStyles({
  component: {
    height: "220px",
    overflowY: "auto",
    border: "1px solid #ccc",
    borderRadius: "4px",
    width: "100%",
    boxShadow: "2px 2px 2px rgba(0, 0, 0, 0.1)",
    padding: "10px",
    // marginLeft: "0.5rem",
    // marginBottom: "0.5rem",
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

export default function Leaftype({
  leaf_type_array,
  handleOnChangeLeafType,
  checkedStateLeafType,
}) {
  const classes = useStyles();
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));
  return (
    <Box sx={{ width: "100%" }}>
      <Box>
        <Typography sx={{ color: "green", fontWeight: "bold" }}>
          Leaf
        </Typography>
        <Typography variant="subtitle1" sx={{ color: "green" }}>
          Type{" "}
          {/* <Box
      sx={{
        display: "inline-flex",
        alignItems: "flex-end",
        // marginLeft: "4rem",
      }}
    >
      {message_leaf_type}
    </Box> */}
        </Typography>
      </Box>
      <Box className={classes.component}>
        {leaf_type_array.map((type, index) => (
          <div
            key={type}
            onClick={() => handleOnChangeLeafType(index)}
            className={`${classes.item} ${
              checkedStateLeafType[index] ? classes.itemChecked : ""
            }`}
          >
            {type}
          </div>
        ))}
      </Box>
    </Box>
  );
}
