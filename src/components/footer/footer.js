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
import { Box, Container, Typography } from "@mui/material";
import { makeStyles } from "@mui/styles";
import { useState, useEffect } from "react";
const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

const useStyles = makeStyles((theme) => ({
  footer: {
    backgroundColor: "#074880",
    padding: theme.spacing(3),
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
          a.download = "data.csv"; // Set the desired file name
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
    <footer className={classes.footer}>
      <Container maxWidth="lg">
        <Typography
          variant="subtitle1"
          align="center"
          color="white"
          component="p"
        >
          Natural History Collections of wild Plants, Fruits, and Host insects
          in Kenya
        </Typography>
        <Box display="flex" justifyContent="center" marginTop={2}>
          <button
            onClick={handleDownload}
            disabled={isDownloading || error}
            style={{ cursor: isDownloading ? "progress" : "pointer" }}
          >
            {isDownloading ? "Downloading..." : "Download Data"}
          </button>
        </Box>
      </Container>
    </footer>
  );
}

// import { makeStyles } from "@mui/styles";
// import { useState } from "react";
// import useSWR, { mutate } from "swr";

// const base_url = process.env.NEXT_PUBLIC_API_BASE_URL;

// const useStyles = makeStyles((theme) => ({
//   footer: {
//     backgroundColor: "#074880",
//     padding: theme.spacing(3),
//   },
// }));

// export default function Footer() {
//   const classes = useStyles();

//   const [isDownloading, setDownloading] = useState(false);
//   const fetcher = (url) => fetch(url).then((r) => r.json());

//   const { error } = useSWR(`${base_url}/api/download`, fetcher);
//   const handleDownload = () => {
//     const [isDownloading, setDownloading] = useState(false);

//     if (!isDownloading) {
//       setDownloading(true);
//       fetch(`${base_url}/api/download`)
//         .then((response) => response.blob())
//         .then((blob) => {
//           const url = window.URL.createObjectURL(blob);
//           const a = document.createElement("a");
//           a.href = url;
//           a.download = "data.csv"; // Set the desired file name
//           a.click();
//           setDownloading(false);
//         })
//         .catch((error) => {
//           console.error("Error downloading data:", error);
//           setDownloading(false);
//         });
//     }
//   };
//   return (
//     <footer className={classes.footer}>
//       <Container maxWidth="lg">
//         <Typography
//           variant="subtitle1"
//           align="center"
//           color="white"
//           component="p"
//         >
//           Natural History Collections of wild Plants, Fruits, and Host insects
//           in Kenya
//         </Typography>
//         <Box display="flex" justifyContent="center" marginTop={2}>
//           <button
//             onClick={handleDownload}
//             disabled={isDownloading || error}
//             style={{ cursor: isDownloading ? "progress" : "pointer" }}
//           >
//             {isDownloading ? "Downloading..." : "Download Data"}
//           </button>
//         </Box>
//       </Container>
//     </footer>
//   );
// }
