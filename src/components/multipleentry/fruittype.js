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
export default function Fruittype({
  fruit_type_array,
  handleOnChangeFruitType,
  checkedStateFruitType,
}) {
  const classes = useStyles();
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));
  // handle hovering on a term
  const [isHovering, setIsHovering] = useState(false);
  // handle the doubleclick
  function handleDoubleClick(type) {
    Router.push({
      pathname: "/glossary/allterms",
      query: { fruit_types: type.toLowerCase() },
    });
  }
  // show a message on hoover of a term with description
  const handleMouseEnter = () => {
    const handleMouseEnter = () => {
      setIsHovering(true);
    };

    const handleMouseLeave = () => {
      setIsHovering(false);
    };

    return (
      <div
        className="fruit-item"
        onMouseEnter={handleMouseEnter}
        onMouseLeave={handleMouseLeave}
      >
        <span>Fruit Type</span>
        {isHovering && <span>Double click for description</span>}
      </div>
    );

    return "Double click for description";
  };

  return (
    <Box sx={{ width: "100%" }}>
      <Box>
        <Typography sx={{ color: "red", fontWeight: "bold" }}>Fruit</Typography>
        <Typography variant="subtitle1" sx={{ color: "red" }}>
          <Tooltip
            title="Double click any of the fruit types for a description"
            placement="top"
          >
            <span>Type</span>
          </Tooltip>{" "}
        </Typography>
      </Box>
      <Box className={classes.component}>
        {fruit_type_array.sort().map((type, index) => (
          <div
            key={type}
            onMouseEnter={() => handleMouseEnter()}
            onClick={() => handleOnChangeFruitType(index)}
            className={`${classes.item} ${
              checkedStateFruitType[index] ? classes.itemChecked : ""
            }`}
            onDoubleClick={() => handleDoubleClick(type)}
          >
            {type}
          </div>
        ))}
      </Box>
    </Box>
  );
}
