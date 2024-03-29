import { useState, useEffect } from "react";
import { Box, Button, Menu, MenuItem, IconButton } from "@mui/material";
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
export default function LepidopteraClientside({ other_diptera_data }) {
  //   const [uniqueColeopteraData, setUniqueColeopteraData] = useState([]);
  // const base_url = "http://localhost:3000";

  const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

  const [selectedGenus, setSelectedGenus] = useState(null);
  const fetcher = (url) => fetch(url).then((r) => r.json());
  const { data, error } = useSWR(
    `${base_url}/api/insects/all/speciesAll`,
    fetcher
  );
  //   const { data, error1 } = useSWR("/api/insects/dipteraTephritidae/", fetcher);
  1;
  const [unique__lepidoptera, setunique__lepidoptera] = useState([]);

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
      const unique__lepidoptera = Array.from(
        new Set(data.lepidoptera.map((item) => item.insect_genera.genus_name))
      ).map((name) =>
        data.lepidoptera.find((item) => item.insect_genera.genus_name === name)
      );
      setunique__lepidoptera(unique__lepidoptera);
    }
  }, [data]);

  const classes = useStyles();
  ////console.log('unique__lepidoptera');
  // ////console.log(uniqueColeopteraData);

  // obtain frst four genus nanmes

  const unique_lepidoptera_data = Array.from(
    new Set(unique__lepidoptera.map((item) => item.insect_families.family_name))
  ).map((name) =>
    unique__lepidoptera.find(
      (item) => item.insect_families.family_name === name
    )
  );

  ////console.log('unique_other_diptera_data');

  ////console.log(unique__lepidoptera);
  // handle family click
  const [selectedFamily, setSelectedFamily] = useState(null);
  const genera = unique_lepidoptera_data.filter(
    (genus) => genus.insect_families.family_name === selectedFamily
  );

  // pass the status to the insect details page
  // on click, the selected genus name will be passed to getserverside prop function
  // handle genus click
  const handleClick = (genus) => {
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
  if (data) {
    return (
      <Box sx={{ marginLeft: 1 }}>
        <Box sx={{ color: "maroon", marginLeft: "1rem" }}>
          {" "}
          Lepidoptera(moths and buttaflies)
        </Box>
        {/* <Box sx={{ color: "maroon", marginLeft: "1rem" }}>
        {" "}
        (moths and buttaflies)
      </Box> */}

        <Box>
          {unique_lepidoptera_data.map((genus) => (
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
              unique__lepidoptera
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
