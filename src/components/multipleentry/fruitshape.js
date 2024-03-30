import { Box, Tooltip, Typography, useMediaQuery } from "@mui/material";
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
export default function FruitShape({
  fruit_shape_array,
  handleOnChangeFruitShape,
  checkedStateFruitShape,
}) {
  function handleDoubleClick(type) {
    Router.push({
      pathname: "/glossary/allterms",
      query: { fruit_shapes: type.toLowerCase() },
    });
  }
  const classes = useStyles();
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));
  return (
    <Box sx={{ marginLeft: isSmallScreen ? 0 : 2, width: "100%" }}>
      <Box sx={{ marginTop: 3 }}>
        <Typography variant="subtitle1" sx={{ color: "red" }}>
          <Tooltip title="Double click any of the fruit shapes for a description">
            <span>Shape</span>
          </Tooltip>{" "}
          {/* <Box
                  sx={{
                    display: "inline-flex",
                    alignItems: "flex-end",
                    // marginLeft: "3rem",
                  }}
                >
                  {message_fruit_shape}
                </Box> */}
        </Typography>
      </Box>
      <Box className={classes.component}>
        {fruit_shape_array.sort().map((shape, index) => (
          <div
            key={shape}
            onClick={() => handleOnChangeFruitShape(index)}
            onDoubleClick={() => handleDoubleClick(shape)}
            className={`${classes.item} ${
              checkedStateFruitShape[index] ? classes.itemChecked : ""
            }`}
          >
            {shape}
          </div>
        ))}
      </Box>
    </Box>
  );
}
