import { Box, Typography, useMediaQuery } from '@mui/material';
import { makeStyles } from '@mui/styles'; // custom component  styles
// custom styless
const useStyles = makeStyles({
  component: {
    height: '220px',
    overflowY: 'auto',
    border: '1px solid #ccc',
    borderRadius: '4px',
    width: '100%',
    boxShadow: '2px 2px 2px rgba(0, 0, 0, 0.1)',
    padding: '10px',
    // marginLeft: "0.5rem",
    // marginBottom: "0.5rem",
  },
  item: {
    cursor: 'pointer',
    padding: '5px',
    borderBottom: '1px solid #ccc',
    '&:active': {
      color: 'black',
    },
  },
  itemChecked: {
    backgroundColor: 'black',
    color: 'white',
  },
  horizontalboundary: {
    display: 'flex',
    border: '1px solid #ccc',
    borderRadius: '4px',
    width: '100%',
    marginTop: '0.5rem',
    marginBottom: '0.5rem',
  },
});
export default function Plantlatex({
  plant_latex_array,
  handleOnChangePlantLatex,
  checkedStatePlantLatex,
}) {
  const classes = useStyles();
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down('sm'));
  return (
    <Box sx={{ marginLeft: isSmallScreen ? 0 : 2, width: '100%' }}>
      <Box sx={{ paddingTop: '1.5rem' }}>
        <Typography variant="subtitle1" sx={{ color: 'maroon' }}>
          Latex
          {' '}
          {/* <Box
      sx={{
        display: "inline-flex",
        alignItems: "flex-end",
        // marginLeft: "6rem",
      }}
    >
      {message_plant_latex}
    </Box> */}
        </Typography>
      </Box>
      <Box className={classes.component}>
        {plant_latex_array.map((spine, index) => (
          <div
            key={spine}
            onClick={() => handleOnChangePlantLatex(index)}
            className={`${classes.item} ${
              checkedStatePlantLatex[index] ? classes.itemChecked : ''
            }`}
          >
            {spine}
          </div>
        ))}
      </Box>
    </Box>
  );
}
