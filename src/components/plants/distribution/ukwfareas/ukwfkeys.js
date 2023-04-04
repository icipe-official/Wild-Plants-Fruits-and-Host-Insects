import { Box, Typography } from "@mui/material";
import { makeStyles } from "@mui/styles";

const useStyles = makeStyles({
  fruit: {
    color: "red",
  },
});
export default function UKWFeatureKeys() {
  const classes = useStyles();

  return (
    <Box>
    <br/>
    <br/>
    UKWF Area(s):
    </Box>
  );
}