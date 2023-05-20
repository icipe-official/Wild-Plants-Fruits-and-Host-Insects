import {
  CssBaseline,
  IconButton,
  Toolbar,
  Typography,
  AppBar,
  useMediaQuery,
  Box,
} from "@mui/material";
import { makeStyles } from "@mui/styles";
import Link from "next/link";
import { useRouter } from "next/router";
import MenuIcon from "@mui/icons-material/Menu";
/*
This module defines a mobile-responsive navigation bar using Material-UI components. 

It exports a single component `Navbar` that displays a list of links to different pages of the website. 
The navigation bar is built using Material-UI's `AppBar`, `Toolbar`, `Typography`, `Link`, and `useMediaQuery` components.

The `Navbar` component takes no arguments, and it returns a Material-UI `AppBar` component with a `Toolbar`. 
Inside the `Toolbar`, there is a `div` container that contains several `Link` components, each linking to a different page of the website. 
The links are styled using CSS classes defined in the `makeStyles` hook. 

The navigation bar is made mobile-responsive by using the `useMediaQuery` hook to detect small screens (using the `sm` breakpoint defined in the theme). 
When the screen size is small, the links are displayed vertically (in a column), instead of horizontally (in a row). 
This is achieved by changing the `flexDirection` property of the `navlinks` CSS class.
*/
import React, { useState } from "react";
import {
  ButtonBase,
  Drawer,
  List,
  ListItem,
  Container,
  ListItemText,
} from "@mui/material";
import CloseIcon from "@mui/icons-material/Close";
const drawerWidth = 240;
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

export default function TopAppBar() {
  const classes = useStyles();
  const handleMenuOpen = () => {
    setMenuOpen(true);
  };

  const handleMenuClose = () => {
    setMenuOpen(false);
  };
  const router = useRouter();
  const [menuOpen, setMenuOpen] = useState(false);
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));
  console.log("menuOpen");

  console.log(menuOpen);
  console.log("isSmallScreen");

  console.log(isSmallScreen);

  return (
    <Container>
      <AppBar position="fixed" className={classes.AppBar}>
        <CssBaseline />
        <Toolbar>
          {isSmallScreen ? (
            <>
              <IconButton
                edge="start"
                color="inherit"
                aria-label="menu"
                onClick={handleMenuOpen}
              >
                <MenuIcon />
              </IconButton>
              <Drawer anchor="left" open={menuOpen} onClose={handleMenuClose}>
                <Box className={classes.appBarBackground}>
                  <Box
                    style={{
                      display: "flex",
                      justifyContent: "right",
                      backgroundColor: "#074880",
                    }}
                  >
                    <IconButton
                      onClick={handleMenuClose}
                      sx={{ backgroundColor: "white" }}
                    >
                      <CloseIcon className={classes.cancelicon} />
                    </IconButton>
                  </Box>
                  <List>
                    <ListItem ButtonBase>
                      <Link
                        href="/"
                        passHref
                        className={`  ${classes.link} ${
                          router.pathname === "/" ? classes.activeLink : ""
                        }`}
                        onClick={handleMenuClose}
                      >
                        Home
                      </Link>
                    </ListItem>
                    <ListItem ButtonBase>
                      <Link
                        href={`/plants/1`}
                        passHref
                        className={`${classes.link} ${
                          router.pathname.startsWith("/plants")
                            ? classes.activeLink
                            : ""
                        }`}
                        onClick={handleMenuClose}
                      >
                        Plants and Fruits data
                      </Link>
                    </ListItem>
                    <ListItem ButtonBase>
                      <Link
                        href="/multipleentry"
                        passHref
                        className={`${classes.link} ${
                          router.pathname.startsWith("/multipleentry")
                            ? classes.activeLink
                            : ""
                        }`}
                        onClick={handleMenuClose}
                      >
                        Multiple Entry Key
                      </Link>
                    </ListItem>
                    <ListItem ButtonBase>
                      <Link
                        href="/insects"
                        passHref
                        className={`${classes.link} ${
                          router.pathname.startsWith("/plants")
                            ? classes.activeLink
                            : ""
                        }`}
                        onClick={handleMenuClose}
                      >
                        Insects
                      </Link>
                    </ListItem>
                    <ListItem>
                      <Link
                        href="/glossary"
                        passHref
                        className={`${classes.link} ${
                          router.pathname === "/glossary"
                            ? classes.activeLink
                            : ""
                        }`}
                        onClick={handleMenuClose}
                      >
                        {" "}
                        Glossary
                      </Link>
                    </ListItem>
                    <ListItem ButtonBase>
                      <Link
                        href="/phylogeny"
                        passHref
                        className={`${classes.link} ${
                          router.pathname.startsWith("/phylogeny")
                            ? classes.activeLink
                            : ""
                        }`}
                        onClick={handleMenuClose}
                      >
                        Phylogeny
                      </Link>
                    </ListItem>
                  </List>
                  {/* <IconButton onClick={handleMenuClose} >
              <CloseIcon className={classes.cancelicon}/>
            </IconButton> */}
                </Box>
              </Drawer>
            </>
          ) : (
            <div className={classes.navlinks}>
              <Link
                href="/"
                passHref
                className={`${classes.link} ${
                  router.pathname === "/" ? classes.activeLink : ""
                }`}
              >
                Home
              </Link>
              <Link
                href={`/plants/1`}
                passHref
                className={`${classes.link} ${
                  router.pathname.startsWith("/plants")
                    ? classes.activeLink
                    : ""
                }`}
              >
                Plants and Fruits data
              </Link>
              <Link
                href="/multipleentry"
                passHref
                className={`${classes.link} ${
                  router.pathname.startsWith("/multipleentry")
                    ? classes.activeLink
                    : ""
                }`}
              >
                Multiple-Entry Key to Plants
              </Link>
              <Link
                href="/insects"
                passHref
                className={`${classes.link} ${
                  router.pathname.startsWith("/insects")
                    ? classes.activeLink
                    : ""
                }`}
              >
                Insects
              </Link>
              <Link
                href="/glossary"
                passHref
                className={`${classes.link} ${
                  router.pathname.startsWith("/glossary")
                    ? classes.activeLink
                    : ""
                }`}
              >
                Glossary
              </Link>
              <Link
                href="/phylogeny"
                passHref
                className={`${classes.link} ${
                  router.pathname.startsWith("/phylogeny")
                    ? classes.activeLink
                    : ""
                }`}
              >
                Phylogeny
              </Link>
            </div>
          )}
        </Toolbar>
      </AppBar>
    </Container>
  );
}
