import React from "react";
import { Card, CardContent, Typography } from "@mui/material";
import { makeStyles } from "@mui/styles";
import { Box } from "@mui/system";

const useStyles = makeStyles({
  root: {
    display: "flex",
    alignItems: "flex-start",
    border: "1px solid rgba(0, 0, 0, 0.12)", // Aadd boundary line
    paddingTop: 2,
    // minHeight: 1,
  },
  card: {
    width: "100%",
  },
  content: {
    paddingLeft: 20,
    margin: -15,
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
