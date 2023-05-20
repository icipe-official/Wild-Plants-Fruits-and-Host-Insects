import React from "react";
import { Card, CardContent, Container, Grid, Stack } from "@mui/material";
import { makeStyles } from "@mui/styles";
import { AddBox, StackedBarChart } from "@mui/icons-material";
import { Box } from "@mui/system";

const useStyles = makeStyles({
  root: {
    display: "flex",
    paddingTop: 2,
    // marginLeft: "1rem",
  },
  item: {
    margin: 0,
  },
  card: {
    width: "100%",
    height: 25,
  },
  content: {
    paddingLeft: 20, // Add this line to add padding to the left of the content
    margin: -15,
  },
});

export default function DynamicValueCard({ value }) {
  const classes = useStyles();
  return (
    <Box className={classes.root}>
      <Card className={classes.card}>
        <CardContent className={classes.content}>{value}</CardContent>
      </Card>
    </Box>
  );
}
