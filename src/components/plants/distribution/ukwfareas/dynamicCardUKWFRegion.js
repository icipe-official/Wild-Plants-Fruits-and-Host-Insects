import React from 'react';
import {
  Card, CardContent, Container, Grid, Stack,
} from '@mui/material';
import { makeStyles } from '@mui/styles';
import { AddBox, StackedBarChart } from '@mui/icons-material';
import { Box } from '@mui/system';

const useStyles = makeStyles({
  root: {
    display: 'flex',
    // alignItems: 'right',
    // justifyContent: 'left',
    // padding: 2,
  },
  // item: {
  //   margin: 0,
  // },
  card: {
    width: 200,
    height: '100%',
  },
  content: {
    // display: 'row',
    // justifyContent: 'right',    margin:1
    // width: '100%',
    // margin:-17,
  },
});
// const useStyles = makeStyles({
//   // root: {
//   //   display: 'flex',
//   //   alignItems: 'center',
//   //   justifyContent: 'centre',
//   // },
//   item: {
//     margin:0
//   },
//   card:{
//     width:200,
//     height:20,

//   },
//   content:{
//     // justifyContent:"center",
//     margin:-17

//   }
// });

export default function DynamicValueCardUKWFRegion({ value }) {
  const classes = useStyles();

  return (
    <Box>
      <Box className={classes.root}>
        <Card className={classes.card}>
          <CardContent className={classes.content}>{value}</CardContent>
        </Card>
        {/* </Grid> */}
        {/* </Stack> */}
      </Box>
    </Box>
  );
}
