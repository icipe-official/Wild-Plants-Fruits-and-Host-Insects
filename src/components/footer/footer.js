import Typography from '@mui/material/Typography';
import { makeStyles } from "@mui/styles";


const useStyles = makeStyles((theme) => ({
  footer: {
    backgroundColor:'#074880',
    color: theme.palette.getContrastText(theme.palette.primary.main),
    padding: theme.spacing(4),
    fontFamily:"Open Sans",
    paddingBottom:'10%'
  },
}));

export default function Footer() {
  const classes = useStyles();

  return (
    <footer className={classes.footer}>
      <Typography align="center">
        Footer
      </Typography>
    </footer>
  );
}
