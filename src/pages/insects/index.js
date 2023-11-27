import { Container, Box, Grid, useMediaQuery } from "@mui/material";

import { useState } from "react";
// import Order from "../src/components/insects/dipteraTephritidae";
import dynamic from "next/dynamic";
import DipteraTephridiae2Clientside from "components/insects/clientsideDiptera";
import LepidopteraClientside from "components/insects/lepidoptera";
import ColeopteraComponent from "components/insects/coleoptera";
import HymenopteraBraconidaeComponent from "components/insects/hymenopterabraconidae";
import HymenopterahymenopteraIchneumonoidae from "components/insects/hymenopteraichmonidae";
import OtherHymenopteracomponent from "components/insects/otherhymenoptera";
import { makeStyles } from "@mui/styles";
// import { TreeView, TreeItem } from "@mui/lab";
import { TreeItem, TreeView } from "@mui/x-tree-view";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import ChevronRightIcon from "@mui/icons-material/ChevronRight";
import Insectssearch from "components/insects/search";
const drawerWidth = 240;

// Dynamic imports to avoid hydration error. ensure serverdide and client side rendering are the same
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
}));

export default function order(props) {
  const [selectedNode, setSelectedNode] = useState(null);
  const handleNodeSelect = (event, nodeId) => {
    setSelectedNode(nodeId);
  };
  const classes = useStyles();
  const handleMenuOpen = () => {
    setMenuOpen(true);
  };

  const handleMenuClose = () => {
    setMenuOpen(false);
  };
  const [menuOpen, setMenuOpen] = useState(false);
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));
  ////console.log('menuOpen');
  return (
    <Container sx={{ marginTop: 12 }}>
      {isSmallScreen ? (
        <TreeView
          className={classes.root}
          defaultCollapseIcon={<ExpandMoreIcon />}
          defaultExpandIcon={<ChevronRightIcon />}
          selected={selectedNode}
          onNodeSelect={handleNodeSelect}
        >
          {/* <TreeItem nodeId="70" label="Search"> */}
          <Insectssearch />
          {/* <TreeItem nodeId="4" label="Grandchild 2" /> */}
          {/* </TreeItem> */}
          <TreeItem nodeId="1" label="Diptera">
            <DipteraTephridiae2Clientside />
            {/* <TreeItem nodeId="4" label="Grandchild 2" /> */}
          </TreeItem>

          <TreeItem nodeId="11" label="Lepidoptera">
            <LepidopteraClientside />
          </TreeItem>
          <TreeItem nodeId="12" label="Coleoptera">
            <ColeopteraComponent />
          </TreeItem>

          <TreeItem nodeId="15" label="Hymenoptera">
            <TreeItem nodeId="16" label="Hymenoptera Braconidae">
              <HymenopteraBraconidaeComponent />
            </TreeItem>
            <TreeItem nodeId="17" label="Ichnemodia">
              <HymenopterahymenopteraIchneumonoidae />
            </TreeItem>
            <TreeItem nodeId="19" label="Other hymenoptera">
              <OtherHymenopteracomponent />
            </TreeItem>
          </TreeItem>
        </TreeView>
      ) : (
        <>
          <Box>
            <Insectssearch />
          </Box>
          <Grid container spacing={2}>
            <Grid item xs={12} md={3}>
              <DipteraTephridiae2Clientside />
            </Grid>
            <Grid item xs={12} md={3}>
              <LepidopteraClientside />
            </Grid>
            <Grid item xs={12} md={3}>
              <ColeopteraComponent />
            </Grid>
            <Grid item xs={12} md={3} lg={3}>
              <HymenopteraBraconidaeComponent />

              <HymenopterahymenopteraIchneumonoidae />
              <OtherHymenopteracomponent />
            </Grid>
          </Grid>
        </>
      )}{" "}
    </Container>
  );
}
