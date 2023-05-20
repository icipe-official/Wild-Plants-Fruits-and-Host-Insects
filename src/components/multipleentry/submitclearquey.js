import { Box, useMediaQuery } from "@mui/material";
import { Button } from "@mui/material";

export default function SubmitClearquery({ handleCancel, handleData }) {
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down("sm"));

  return (
    <>
      {!isSmallScreen && (
        <Box sx={{ width: "100%", marginLeft: "5rem", marginTop: "2rem" }}>
          <Box sx={{ padding: 3 }}>
            <Button
              color="success"
              variant="contained"
              onClick={() => {
                handleData();
              }}
            >
              Submit Query
            </Button>
          </Box>
          <Box sx={{ padding: 3 }}>
            <Button
              variant="contained"
              color="error"
              onClick={() => {
                handleCancel();
              }}
            >
              Clear Query
            </Button>
          </Box>
        </Box>
      )}

      {isSmallScreen && (
        <Box

          sx={{
            display: "flex",
            // position: "fixed",
            top: 55,
            marginLeft: 0,
          }}
        >
          {/* <Box sx={{ justifyContent: 'flex-end', position:"fixed" }}> */}
          <Box sx={{ marginLeft: 14 }}>
            <Button
              color="success"
              variant="contained"
              onClick={() => {
                handleData();
              }}
              style={{
                height:'70%',
                width: '100%', // default width for larger screens
                '@media (max-width: 768px)': { // narrow the width on screens <= 768px
                  width: '30%',

                },
              }}
            >
              Submit Query
            </Button>
          </Box>
          <Box sx={{ marginLeft: 2 }}>
            <Button
              variant="contained"
              color="error"
              onClick={() => {
                handleCancel();
              }}
              style={{
                height:'70%',
                width: '100%', // default width for larger screens
                '@media (max-width: 768px)': { // narrow the width on screens <= 768px
                  width: '30%',

                },
              }} 
              
              
            >
              Clear Query
            </Button>
          </Box>
        </Box>
      )}
    </>
  );
}
