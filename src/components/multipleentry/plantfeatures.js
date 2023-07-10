import { Box, Typography } from '@mui/material';
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
export default function PlantFeaturesComponent({
  plant_type_array,
  handleOnChangePlantShrubClimbings,
  checkedStatePlantShrubClimbings,
}) {
  const classes = useStyles();
  return (
    <Box sx={{ width: '100%' }}>
      <Box sx={{ width: '100%' }}>
        <Typography sx={{ color: 'maroon', fontWeight: 'bold' }}>
          Plant
        </Typography>
        <Typography variant="subtitle1" sx={{ color: 'maroon' }}>
          Type
          {' '}
          {/* <Box
          sx={{
            display: "inline-flex",
            alignItems: "flex-end",
            // marginLeft: "6rem",
          }}
        >
          {message_plant_type}
        </Box> */}
        </Typography>
      </Box>
      <Box className={classes.component}>
        {[...plant_type_array]
          .sort((a, b) => {
            if (a === 'tree') return -1;
            if (b === 'tree') return 1;
            if (a === 'shrub') return -1;
            if (b === 'shrub') return 1;
            return a.localeCompare(b);
          })
          .map((type, index) => {
            const originalIndex = plant_type_array.indexOf(type);
            return (
              <div
                key={index}
                onClick={() => handleOnChangePlantShrubClimbings(originalIndex)}
                className={`${classes.item} ${
                  checkedStatePlantShrubClimbings[originalIndex]
                    ? classes.itemChecked
                    : ''
                }`}
              >
                {type}
              </div>
            );
          })}
      </Box>
    </Box>
  );
}
