import { Box, Typography } from "@mui/material";
import { makeStyles } from "@mui/styles";

const useStyles = makeStyles({
  fruit: {
    color: "red",
  },
});

export default function KsectorFeatureKeys() {
  const classes = useStyles();

  return (
    <Box>
    <br/>
    K sector(s):
    </Box>
  );
}