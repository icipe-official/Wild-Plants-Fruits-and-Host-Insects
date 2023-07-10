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

export default function LeafMargin({
  leaf_margins_array,
  handleOnChangeLeafMargins,
  checkedStateLeafMargins,
}) {
  function handleDoubleClick(type) {
    Router.push({
      pathname: "/glossary/allterms",
      query: { leaf_margins: type.toLowerCase() },
    });
  }
  //
  const classes = useStyles();
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));
  return (
    <Box sx={{ marginLeft: isSmallScreen ? 0 : 2, width: "100%" }}>
      <Box sx={{ marginTop: 3 }}>
        <Typography variant="subtitle1" sx={{ color: "green" }}>
          Margin{" "}
          {/* <Box
                  sx={{
                    display: "inline-flex",
                    alignItems: "flex-end",
                    // marginLeft: "3rem",
                  }}
                >
                  {message_leaf_margin}
                </Box> */}
        </Typography>
      </Box>
      <Box className={classes.component1}>
        {leaf_margins_array.sort().map((margin, index) => (
          <div
            key={margin}
            onClick={() => handleOnChangeLeafMargins(index)}
            onDoubleClick={() => handleDoubleClick(margin)}
            className={`${classes.item} ${
              checkedStateLeafMargins[index] ? classes.itemChecked : ""
            }`}
          >
            {margin}
          </div>
        ))}
      </Box>
    </Box>
  );
}
