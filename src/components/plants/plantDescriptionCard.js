import React from 'react';
import { makeStyles } from '@mui/styles';
 import {Card,CardContent,Typography,Box, Stack} from '@mui/material';
  const useStyles = makeStyles({
   root: {
     width: 400,
     maxWidth: 500,
     margin: 'auto',
     height:250,

   },
 });
 const title='plant'
 export default function PlantDescription({plants_data}) {
   const classes = useStyles();
   return(
   plants_data.map((specie) =>(
    <Box key={specie.id} sx={{marginLeft:2}}>
     <Card className={classes.root}>
       <CardContent>
         {specie.description}          
         </CardContent>
     </Card>
     </Box>

   )));
 };
