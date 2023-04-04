// import styles from './header.module.css'
import Typography from '@mui/material/Typography';
import { makeStyles } from "@mui/styles";


const useStyles = makeStyles((theme) => ({
  header: {
    // backgroundColor:'#074880',
    color: theme.palette.getContrastText(theme.palette.primary.main),
    padding: theme.spacing(1),
    color:'black',
    textAlign:'center',
    fontWeight:'bold',
    fontFamily:"Open Sans"
  },
}));

export default function Header(){
  const clases = useStyles();
  return(
        <header className={clases.header}>
        Natural History of the Wild Plants, Fruits and Host Insects in Kenya
        </header>
    )
}