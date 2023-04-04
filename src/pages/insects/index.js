import { Container, Box } from "@mui/material";
import {
  ButtonBase,
  Drawer,
  List,
  ListItem,
  ListItemText,
  useMediaQuery,
  AppBar,
  CssBaseline,
  Toolbar,
  IconButton,
} from "@mui/material";
import MenuIcon from "@mui/icons-material/Menu";
import CloseIcon from "@mui/icons-material/Close";

import { useState } from "react";
// import Order from "../src/components/insects/dipteraTephritidae";
import dynamic from "next/dynamic";
import DipteraTephridiae2Clientside from "components/insects/clientsideDiptera";
import LepidopteraClientside from "components/insects/lepidoptera";
import ColeopteraComponent from "components/insects/coleoptera";
import HymenopteraBraconidaeComponent from "components/insects/hymenopterabraconidae";
import HymenopterahymenopteraIchneumonoidae from "components/insects/hymenopteraichmonidae";
import OtherHymenopteracomponent from "components/insects/otherhymenoptera";
import { Button } from "react-admin";
import { makeStyles } from "@mui/styles";
const drawerWidth = 240;

//Dynamic imports to avoid hydration error. ensure serverdide and client side rendering are the same
const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
  },
  appBar: {
    [theme.breakpoints.up("md")]: {
      width: `calc(100% - ${drawerWidth}px)`,
      marginLeft: 0,
    },
  },
  appBarBackground: {
    backgroundColor: "#074880",
    height: "100%",
  },
  menuButton: {
    marginRight: theme.spacing(2),
    [theme.breakpoints.up("md")]: {
      display: "none",
    },
  },
  // toolbar: theme.mixins.toolbar,
  // drawerPaper: {
  //   width: drawerWidth,
  //   backgroundColor: "red",
  // },
  closeIcon: {
    display: "flex",
    justifyContent: "flex-end",
    marginTop: theme.spacing(1),
    marginRight: theme.spacing(1),
  },
  navlinks: {
    marginLeft: theme.spacing(10),
    display: "flex",
    [theme.breakpoints.down("sm")]: {
      marginLeft: 0,
      flexDirection: "column",
    },
  },

  link: {
    textDecoration: "none",
    color: "yellow",
    fontSize: "14px",
    fontFamily: "Open Sans",
    fontWeight: 400,
    textTransform: "uppercase",
    marginLeft: theme.spacing(15),
    "&:hover": {
      color: "red",
      borderBottom: "1px solid white",
    },
    [theme.breakpoints.down("sm")]: {
      marginLeft: 0,
      marginBottom: theme.spacing(1),
    },
  },
  activeLink: {
    color: "red",
    borderBottom: "1px solid white",
  },
  // cancelicon: {
  //   // position: 'absolute',
  //   marginLeft: 7,
  //   right: 0,
  // },
}));

export default function order(props) {
  const classes = useStyles();
  const handleMenuOpen = () => {
    setMenuOpen(true);
  };

  const handleMenuClose = () => {
    setMenuOpen(false);
  };
  const [menuOpen, setMenuOpen] = useState(false);
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));
  console.log("menuOpen");
  return (
    <Container sx={{ marginTop: 3 }}>
      <Box sx={{ display: "flex" }}>
        <Box>
          <DipteraTephridiae2Clientside />
        </Box>
        <LepidopteraClientside />
        <Box>
          <ColeopteraComponent />
        </Box>

        <Box>
          <HymenopteraBraconidaeComponent />
          <HymenopterahymenopteraIchneumonoidae />
        </Box>
        <OtherHymenopteracomponent />
      </Box>
    </Container>
  );
}
