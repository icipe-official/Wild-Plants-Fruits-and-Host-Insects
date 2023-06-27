import React from "react";
import { Card, CardContent, Typography } from "@mui/material";
import { makeStyles } from "@mui/styles";
import { Box } from "@mui/system";

const useStyles = makeStyles({
  root: {
    display: "flex",
    alignItems: "flex-start", // Align items at the start to ensure left margin consistency
    paddingTop: 2,
  },
  card: {
    width: "100%",
  },
  content: {
    paddingLeft: 20, // Add this line to add left padding to the content
    margin: -15, // Remove this line to remove negative margin
  },
});

export default function DynamicValueCard({ value }) {
  const classes = useStyles();
  return (
    <Box className={classes.root}>
      <Card className={classes.card}>
        <CardContent className={classes.content}>
          <Typography variant="body1" sx={{ whiteSpace: "pre-wrap" }}>
            {value}
          </Typography>
        </CardContent>
      </Card>
    </Box>
  );
}
