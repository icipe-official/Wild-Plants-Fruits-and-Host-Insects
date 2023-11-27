import { Box, Container, Typography } from "@mui/material";
import { makeStyles } from "@mui/styles";
import { useState, useEffect } from "react";

const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

const useStyles = makeStyles((theme) => ({
  footer: {
    backgroundColor: "#074880",
    padding: theme.spacing(0),
    width: "100%",
    position: "fixed",
    bottom: 0,
    left: 0,
    [theme.breakpoints.up("sm")]: {
      position: "relative",
      width: "auto",
      marginTop: theme.spacing(4),
    },
  },
  content: {
    marginBottom: theme.spacing(8), // Adjust the value to accommodate the footer height
    paddingBottom: theme.spacing(8), // Add padding bottom to create space for the footer
  },
}));

export default function Footer() {
  const classes = useStyles();
  const [isDownloading, setDownloading] = useState(false);
  const [error, setError] = useState(null);

  const handleDownload = () => {
    if (!isDownloading) {
      setDownloading(true);
    }
  };

  useEffect(() => {
    if (isDownloading) {
      fetch(`${base_url}/api/download`)
        .then((response) => response.blob())
        .then((blob) => {
          const url = window.URL.createObjectURL(blob);
          const a = document.createElement("a");
          a.href = url;
          a.download = "data.csv";
          a.click();
          setDownloading(false);
        })
        .catch((error) => {
          console.error("Error downloading data:", error);
          setError(error);
          setDownloading(false);
        });
    }
  }, [isDownloading]);

  return (
    <>
      <div className={classes.content}></div>
      <footer className={classes.footer}>
        <Container maxWidth="lg">
          <Typography
            variant="subtitle1"
            align="center"
            color="white"
            component="p"
          >
            &copy; {new Date().getFullYear()} International Centre of Insect
            Physiology and Ecology (icipe)
          </Typography>
        </Container>
      </footer>
    </>
  );
}
