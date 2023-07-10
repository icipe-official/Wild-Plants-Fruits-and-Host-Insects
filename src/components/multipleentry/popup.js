import { useState } from "react";
import { useRouter } from "next/router";
import { Button, Paper } from "@mui/material";

export default function PopupMessage({ errorMessage }) {
  const [showPopup, setShowPopup] = useState(true);
  const router = useRouter();

  const hidePopup = () => {
    setShowPopup(false);
    // Remove the error parameter from the URL
    router.push({ pathname: router.pathname, query: {} });
  };

  return showPopup ? (
    <Paper
      elevation={3}
      sx={{
        backgroundColor: "grey",
        color: "white",
        padding: "10px",
        textAlign: "center",
      }}
    >
      <div>{errorMessage}</div>
      <Button variant="contained" onClick={hidePopup}>
        Ok
      </Button>
    </Paper>
  ) : null;
}
