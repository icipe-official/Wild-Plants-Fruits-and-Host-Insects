import { useState, useEffect } from "react";
import {
  Box,
  Button,
  Menu,
  MenuItem,
  IconButton,
  Container,
} from "@mui/material";
import { makeStyles } from "@mui/styles";
import Router from "next/router";
import useSWR from "swr";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";

// custom MUIstyles
const useStyles = makeStyles((theme) => ({
  root: {
    margin: 0,
    padding: 0,
    listStyle: "none",
  },

  ul: {
    margin: 0,
    padding: 0,
    display: "flex",
    flexDirection: "row",
    flexWrap: "wrap",
    alignItems: "center",
    justifyContent: "flex-start",
    gap: "1px",
    marginBottom: "-1px",
  },
  buttonfamily: {
    border: "1px solid rgba(0.0, 0, 0, 0.3)",
    padding: "5px 0",
    textTransform: "none",
    margin: 0,
    height: "auto",
    lineHeight: "1",
    fontSize: "16px",
    fontWeight: "400",
    borderRadius: "4px",
    backgroundColor: "transparent",
    color: "blue",
    paddingBottom: 0,
    // minWidth: 0,
    width: "100%",
    transition: "none",
    "&:hover": {
      backgroundColor: "transparent",
    },
    "&:focus": {
      outline: "none",
    },
    "&::before": {
      display: "none",
    },
    "&::after": {
      display: "none",
    },
    "&:not(:first-child)": {
      borderLeft: "1px solid rgba(0, 0, 0, 0.1)",
    },
    selectedfamily: {
      backgroundColor: "black",
      color: "yellow",
    },
  },
  buttongenus: {
    border: "1px solid rgba(0.0, 0, 0, 0.3)",
    padding: "5px 0",
    textTransform: "none",
    margin: 0,
    height: "auto",
    lineHeight: "1",
    fontSize: "16px",
    fontWeight: "400",
    borderRadius: "4px",
    backgroundColor: "transparent",
    color: "black",
    paddingBottom: 0,
    minWidth: 0,
    width: "100%",
    transition: "none",
    "&:hover": {
      backgroundColor: "transparent",
    },
    "&:focus": {
      outline: "none",
    },
    "&::before": {
      display: "none",
    },
    "&::after": {
      display: "none",
    },
    "&:not(:first-child)": {
      borderLeft: "1px solid rgba(0, 0, 0, 0.1)",
    },
  },
  dropDownButton: {
    position: "relative",
    padding: 0,
    fontWeight: "normal",
    fontSize: "1rem",
    lineHeight: "1.5",
    color: "rgba(0, 0, 0, 0.87)",
    backgroundColor: "transparent",
    border: "none",
    "&:hover": {
      backgroundColor: "transparent",
    },
  },
  dropDownIcon: {
    position: "absolute",
    top: "50%",
    transform: "translateY(-50%)",
    right: 0,
    height: "10px",
  },
}));

export default function DipteraTephridiae2Clientside({ other_diptera_data }) {
  //   const [uniqueColeopteraData, setUniqueColeopteraData] = useState([]);
  const [selectedGenus, setSelectedGenus] = useState(null);
  // const base_url = "http://localhost:3000";

  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

  const fetcher = (url) => fetch(url).then((r) => r.json());
  const { data, error, isLoading } = useSWR(
    `${base_url}/api/insects/all/speciesAll`,
    fetcher
  );
  // if (error) return <Box sx={{ marginTop: 6 }}>Failed to load</Box>;
  // if (isLoading) return <Box sx={{ marginTop: 6 }}> Loading...</Box>;
  // //   const { data, error1 } = useSWR("/api/insects/dipteraTephritidae/", fetcher);
  // 1;
  const [unique__diptera_tephtitidae, setunique__diptera_tephtitidae] =
    useState([]);

  const [unique_other_diptera, setunique__other_diptera] = useState([]);
  const [showDropdown, setShowDropdown] = useState(false);

  const handleSelectGenus = (genus) => {
    setSelectedGenus([...selectedGenus, genus]);
    const index = remainingGenera.indexOf(genus);
    if (index > -1) {
      remainingGenera.splice(index, 1);
      setShowDropdown(remainingGenera.length > 0);
    }
  };

  useEffect(() => {
    if (data) {
      const unique__diptera_tephtitidae = Array.from(
        new Set(
          data.dipteraTephridiae.map((item) => item.insect_genera.genus_name)
        )
      ).map((name) =>
        data.dipteraTephridiae.find(
          (item) => item.insect_genera.genus_name === name
        )
      );
      setunique__diptera_tephtitidae(unique__diptera_tephtitidae);

      const unique_other_diptera_data = Array.from(
        new Set(data.otherdiptera.map((item) => item.insect_genera.genus_name))
      ).map((name) =>
        data.otherdiptera.find((item) => item.insect_genera.genus_name === name)
      );
      setunique__other_diptera(unique_other_diptera_data);
    }
  }, [data]);

  const classes = useStyles();
  ////console.log('unique__diptera_tephtitidae');

  ////console.log(unique__diptera_tephtitidae);
  // ////console.log(uniqueColeopteraData);

  // obtain frst four genus nanmes
  // obtain frst four genus nanmes
  // const firstThreeGenera = ["Ceratitis", "Dacus"];
  console.log("unique__diptera_tephtitidae");

  console.log(unique__diptera_tephtitidae);
  const firstThreeGenera = unique__diptera_tephtitidae.filter(
    (genus) =>
      (genus.insect_genera.genus_name === "Ceratitis") |
      (genus.insect_genera.genus_name === "Dacus") |
      (genus.insect_genera.genus_name === "Trirhithrum")
  );
  console.log("firstThreeGenera");

  console.log(firstThreeGenera);
  const remainingGenera = unique__diptera_tephtitidae
    .filter(
      (genus) =>
        genus.insect_genera.genus_name !== "Ceratitis" &&
        genus.insect_genera.genus_name !== "Dacus" &&
        genus.insect_genera.genus_name !== "Trirhithrum"
    )
    .sort();

  const unique_other_diptera_data = Array.from(
    new Set(
      unique_other_diptera.map((item) => item.insect_families.family_name)
    )
  ).map((name) =>
    unique_other_diptera.find(
      (item) => item.insect_families.family_name === name
    )
  );

  ////console.log('unique_other_diptera_data');

  ////console.log(unique_other_diptera_data);
  // handle family click
  const [selectedFamily, setSelectedFamily] = useState(null);
  const genera = unique_other_diptera_data.filter(
    (genus) => genus.insect_families.family_name === selectedFamily
  );

  // pass the status to the insect details page
  // on click, the selected genus name will be passed to getserverside prop function
  // handle genus click
  const handleClick = (genus) => {
    console.log(
      data.dipteraTephridiae.filter(
        (g) => g.insect_genera.genus_name === genus.insect_genera.genus_name
      )
    );
    console.log("genussss");

    console.log(genus);
    Router.push({
      pathname: `/insects/${genus.insect_genera.id}`,
      query: {
        genus: genus.insect_genera.id,
        species: genus.id,
      },
    });
  };

  const [anchorEl, setAnchorEl] = useState(null);
  const handleFamilyClick = (event, family) => {
    setSelectedFamily(family);
    setAnchorEl(event.currentTarget);
  };
  // const handleClick = (event) => {
  //   setAnchorEl(event.currentTarget);
  // };

  const handleClose = () => {
    setAnchorEl(null);
  };
  function mapStateToProps(state) {
    return { count: state.count };
  }
  ////console.log('firstThreeGenera');
  ////console.log(firstThreeGenera);
  //   ////console.log(selectedGenus);
  //   const classes = useStyles();

  if (error) {
    return (
      <Container
        sx={{
          backgroundColor: "lightbrown",
          overflowY: "scroll",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          height: "100%",
          paddingBottom: "65%", // Adjust this value to create space for the footer
        }}
      >
        {/* Content goes here */}
        <Box sx={{ marginTop: 6 }}>Failed to load</Box>;
      </Container>
    );
  }

  if (isLoading) {
    return (
      <Container
        sx={{
          backgroundColor: "lightbrown",
          overflowY: "scroll",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          height: "100%",
          paddingBottom: "65%", // Adjust this value to create space for the footer
        }}
      >
        {/* Content goes here */}
        <Box sx={{ marginTop: 12 }}>Loading...</Box>
        {/* Footer goes here */}
      </Container>
    );
  }
  if (data) {
    return (
      <Box>
        <Box sx={{ color: "blue", marginLeft: "0rem" }}>
          {" "}
          Order: Diptera (flies)
        </Box>
        <Box sx={{ color: "blue", marginLeft: "0rem" }}>
          {" "}
          Tephritidae (fruit flies)
        </Box>

        <Box>
          {firstThreeGenera.map((genus) => (
            <ul key={genus.id} className={classes.ul}>
              <Button
                onClick={() => {
                  handleClick(genus);
                }}
                classes={{ root: classes.buttongenus }}
              >
                {genus.insect_genera.genus_name}
              </Button>
            </ul>
          ))}
          {remainingGenera.length > 0 && (
            <Box sx={{ fontWeight: "bold" }}>
              <Button
                onClick={() => setSelectedGenus(remainingGenera)}
                onDoubleClick={() => setSelectedGenus(null)}
                classes={{ root: classes.buttongenus }}
              >
                Other genera
                <IconButton className={classes.dropDownIcon}>
                  <ExpandMoreIcon />
                </IconButton>
              </Button>
            </Box>
          )}
          {selectedGenus && (
            <Box>
              {remainingGenera.sort().map((genus) => (
                <ul key={genus.id} className={classes.ul}>
                  <Button
                    classes={{ root: classes.buttongenus }}
                    onClick={() => {
                      handleClick(genus);
                    }}
                  >
                    {genus.insect_genera.genus_name}
                  </Button>
                </ul>
              ))}
            </Box>
          )}
          <Box sx={{ fontWeight: "bold", marginLeft: "1rem", color: "black" }}>
            Other families
          </Box>
          {/* {unique_other_diptera_data.map((genus) => (
          <ul key={item.id} className={classes.ul}>
            <Button
              onClick={() => {
                setSelectedFamily(genus.insect_families.family_name);
                setSelectedGenus(null);
              }}
              // onClick={() => setSelectedGenus(item.insect_families.family_name)}
              classes={{ root: classes.buttonfamily }}
            >
              {genus.insect_families.family_name}
            </Button>
          </ul>
        ))} */}
          {unique_other_diptera_data.map((genus) => (
            <Button
              key={genus.id}
              onClick={(e) =>
                handleFamilyClick(e, genus.insect_families.family_name)
              }
              classes={{ root: classes.buttonfamily }}

              // classes={{
              //   root: `${classes.buttonfamily} ${
              //     selectedFamily === genus.insect_families.family_name
              //       ? classes.selected
              //       : ""
              //   } ${classes.dropDownButton}`,
              // }}
            >
              {genus.insect_families.family_name}
              <IconButton className={classes.dropDownIcon}>
                <ExpandMoreIcon />
              </IconButton>
            </Button>
          ))}
          <Menu
            anchorEl={anchorEl}
            open={Boolean(anchorEl)}
            onClose={() => setAnchorEl(null)}
            PaperProps={{
              style: {
                // maxHeight: "50vh",
                width: "auto",
              },
            }}
          >
            <MenuItem
              selected={selectedGenus === ""}
              onClick={() => setSelectedGenus("")}
            >
              Select a genus
            </MenuItem>
            {selectedFamily &&
              data.otherdiptera
                .filter(
                  (genus) =>
                    genus.insect_families.family_name === selectedFamily
                )
                .map((genus) => (
                  <MenuItem
                    key={genus.id}
                    selected={genus.genus_name === selectedGenus}
                    onClick={() => handleClick(genus)}
                  >
                    {genus.insect_genera.genus_name}
                  </MenuItem>
                ))}
          </Menu>
        </Box>
      </Box>
    );
  }
}
