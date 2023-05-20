// import Typography from '@mui/material/Typography';
// import { makeStyles } from "@mui/styles";

// const useStyles = makeStyles((theme) => ({
//   footer: {
//     backgroundColor:'#074880',
//     color: theme.palette.getContrastText(theme.palette.primary.main),
//     padding: theme.spacing(4),
//     fontFamily:"Open Sans",
//     paddingBottom:'10%'
//   },
// }));

// export default function Footer() {
//   const classes = useStyles();

//   return (
//     <footer className={classes.footer}>
//       <Typography align="center">
//         Footer
//       </Typography>
//     </footer>
//   );
// }
import { Container, Typography } from "@mui/material";
import { makeStyles } from "@mui/styles";

const useStyles = makeStyles((theme) => ({
  footer: {
    backgroundColor: "#074880",
    padding: theme.spacing(3),
  },
}));

export default function Footer() {
  const classes = useStyles();

  return (
    <footer className={classes.footer}>
      <Container maxWidth="lg">
        {/* <Typography variant="h6" align="center" gutterBottom>
          Footer
        </Typography> */}
        <Typography
          variant="subtitle1"
          align="center"
          color="white"
          component="p"
        >
          Natural History Collections of wild Plants, Fruits and Host insects in
          Kenya
        </Typography>
      </Container>
    </footer>
  );
}
