import {
  CssBaseline,
  IconButton,
  Toolbar,
  AppBar,
  useMediaQuery,
  Box,
  Drawer,
  List,
  ListItem,
  Container,
  Popover,
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
import CloseIcon from "@mui/icons-material/Close";
import { Cancel } from "@mui/icons-material";
const drawerWidth = 240;
const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
  },
  appBar: {
    [theme.breakpoints.up("md")]: {
      width: `calc(10% - ${drawerWidth}px)`,
      marginLeft: drawerWidth,
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
  closeIcon: {
    display: "flex",
    justifyContent: "flex-end",
    marginTop: theme.spacing(1),
    marginRight: theme.spacing(1),
  },
  navlinks: {
    justifyContent: "center",
    alignItems: "center",
    // marginLeft: theme.spacing(10),
    display: "flex",
    [theme.breakpoints.down("sm")]: {
      // marginLeft: 0,
      flexDirection: "column",
      justifyContent: "center",
    },
  },
  link: {
    textDecoration: "none",
    display: "block",
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
  subMenu: {
    display: "none",
  },
  menuItem: {
    position: "relative",
    "&:hover $subMenu": {
      display: "block",
    },
  },
  popoverPaper: {
    // Greyish background color
    backgroundColor: "#f0f0f0",
    // Limiting the max width
    maxWidth: "250px",
    // Adjusting the margin from the menu item
    marginLeft: "10px",
  },
}));

export default function TopAppBar() {
  const [anchorEl, setAnchorEl] = useState(null);

  const classes = useStyles();

  const handlePopoverOpen = (event) => {
    setAnchorEl(event.currentTarget);
  };
  //set the position of submenu on hoover on About us
  const handlePopoverClose = () => {
    setAnchorEl(null);
  };
  //handle close of the menu in small screens
  const handleMenuOpen = () => {
    setMenuOpen(false);

    setMenuOpen(true);
  };

  const handleMenuClose = () => {
    setMenuOpen(false);
    // Close the popover when closing the menu
    handlePopoverClose();
  };

  const router = useRouter();
  const [menuOpen, setMenuOpen] = useState(false);
  const isPopoverOpen = Boolean(anchorEl);
  // Custom media query for 1282px width
  const isSmallScreen = useMediaQuery(`(max-width: 1024px)`);
  // const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("md"));
  console.log("menuOpen");

  console.log(menuOpen);
  console.log("isSmallScreen");

  console.log(isSmallScreen);

  const handleLinkHover = (menuItem) => {
    if (menuItem.text === "About Us") {
      handlePopoverOpen();
    } else {
      handlePopoverClose();
    }
  };

  const menuItems = [
    {
      text: "Home",
      href: "/",
    },
    {
      text: "Plants and Fruits data",
      href: "/plants",
    },
    {
      text: "Multiple Entry Key",
      href: "/multipleentry",
    },
    {
      text: "Insects",
      href: "/insects",
    },
    {
      text: "Glossary",
      href: "/glossary",
    },
    {
      text: "Phylogeny",
      href: "/phylogeny",
    },
    {
      text: "About Us",
      href: "/about",
      subMenu: [
        {
          text: "About Us",
          href: "/about",
        },
        {
          text: "User Guide",
          href: "/about/guide",
        },
        {
          text: "Disclaimer",
          href: "/about/disclaimer",
        },
        // {
        //   text: "Team",
        //   href: "/about/team",
        // },
      ],
    },
  ];

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
                    <Link
                      onClick={handleMenuClose}
                      href="/"
                      passHref
                      className={`${classes.link} ${
                        router.pathname === "/" ? classes.activeLink : ""
                      }`}
                    >
                      Home
                    </Link>

                    {menuItems.slice(1).map((menuItem) => (
                      <Box
                        key={menuItem.text}
                        className={`${classes.menuItem} ${
                          router.pathname.startsWith(menuItem.href)
                            ? "active"
                            : ""
                        }`}
                        onMouseEnter={
                          menuItem.text === "About Us"
                            ? handlePopoverOpen
                            : null
                        }
                        onMouseLeave={
                          menuItem.text === "About Us"
                            ? handlePopoverClose
                            : null
                        }
                      >
                        <Link
                          onClick={handleMenuClose}
                          href={menuItem.href}
                          passHref
                          className={`${classes.link} ${
                            router.pathname.startsWith(menuItem.href)
                              ? classes.activeLink
                              : ""
                          }`}
                        >
                          {menuItem.text}
                        </Link>
                        {menuItem.text === "About Us" && (
                          <Popover
                            style={{ color: "grey", marginTop: 16 }}
                            open={isPopoverOpen}
                            anchorEl={anchorEl}
                            onClose={handlePopoverClose}
                            anchorOrigin={{
                              vertical: "bottom",
                              horizontal: "center",
                            }}
                            transformOrigin={{
                              vertical: "top",
                              horizontal: "left",
                            }}
                          >
                            <Box
                              style={{
                                backgroundColor: "lightgrey",
                                padding: 16,
                                textAlign: "left",
                              }}
                            >
                              <List>
                                <ListItem
                                  onClick={handlePopoverClose}
                                  style={{
                                    cursor: "pointer",
                                    display: "flex",
                                    // justifyContent: "space-between",
                                  }}
                                >
                                  <div
                                    style={{
                                      display: "flex",
                                      alignItems: "center",
                                    }}
                                  >
                                    <Cancel style={{ marginRight: 8 }} />
                                  </div>
                                </ListItem>
                                {menuItem.subMenu.map((subMenuItem) => (
                                  <ListItem key={subMenuItem.text} ButtonBase>
                                    <Link
                                      onClick={handleMenuClose}
                                      href={subMenuItem.href}
                                      passHref
                                      style={{ textDecoration: "none" }}
                                    >
                                      {subMenuItem.text}
                                    </Link>
                                  </ListItem>
                                ))}
                              </List>
                            </Box>
                          </Popover>
                        )}
                      </Box>
                    ))}
                  </List>
                  {/* <IconButton onClick={handleMenuClose}>
                    <CloseIcon className={classes.cancelicon} />
                  </IconButton> */}
                </Box>
              </Drawer>
            </>
          ) : (
            <Box className={classes.navlinks}>
              <Link
                href="/"
                passHref
                className={`${classes.link} ${
                  router.pathname === "/" ? classes.activeLink : ""
                }`}
              >
                Home
              </Link>

              {menuItems.slice(1).map((menuItem) => (
                <Box
                  key={menuItem.text}
                  className={`${classes.menuItem} ${
                    router.pathname.startsWith(menuItem.href) ? "active" : ""
                  }`}
                  onMouseEnter={
                    menuItem.text === "About Us" ? handlePopoverOpen : null
                  }
                  onMouseLeave={
                    menuItem.text === "About Us" ? handlePopoverClose : null
                  }
                >
                  <Link
                    href={menuItem.href}
                    passHref
                    className={`${classes.link} ${
                      router.pathname.startsWith(menuItem.href)
                        ? classes.activeLink
                        : ""
                    }`}
                  >
                    {menuItem.text}
                  </Link>
                  {menuItem.text === "About Us" && (
                    <Popover
                      style={{ color: "grey", marginTop: 16 }}
                      open={isPopoverOpen}
                      anchorEl={anchorEl}
                      onClose={handlePopoverClose}
                      anchorOrigin={{
                        vertical: "bottom",
                        horizontal: "center",
                      }}
                      transformOrigin={{
                        vertical: "top",
                        horizontal: "left",
                      }}
                    >
                      <Box
                        style={{
                          backgroundColor: "lightgrey",
                          padding: 16,
                          textAlign: "left",
                        }}
                      >
                        <List>
                          <ListItem
                            onClick={handlePopoverClose}
                            style={{
                              cursor: "pointer",
                              display: "flex",
                              // justifyContent: "space-between",
                            }}
                          >
                            <Box
                              style={{ display: "flex", alignItems: "center" }}
                            >
                              <Cancel style={{ marginRight: 8 }} />
                            </Box>
                          </ListItem>
                          {menuItem.subMenu.map((subMenuItem) => (
                            <ListItem key={subMenuItem.text} ButtonBase>
                              <Link
                                onClick={handlePopoverClose}
                                href={subMenuItem.href}
                                passHref
                                style={{ textDecoration: "none" }}
                              >
                                {subMenuItem.text}
                              </Link>
                            </ListItem>
                          ))}
                        </List>
                      </Box>
                    </Popover>
                  )}
                </Box>
              ))}
            </Box>
          )}
        </Toolbar>
      </AppBar>
    </Container>
  );
}
