import { Table, TableHead, TableRow, TableCell, TableBody } from '@mui/material';
import { Box } from '@mui/system';
import { makeStyles } from '@mui/styles';
import { useState,useEffect } from "react";

const useStyles = makeStyles({
  table: {
    width: '100%',
  },
  cell: {
    border: '1px solid black',
    padding: '3px',
  },
});

export default function OtherHymenoptera({other_hymenoptera_data}) {
  console.log('coleoptera_data client side');
  console.log(other_hymenoptera_data);

  const classes = useStyles();
  const [data, setData] = useState([]);

  useEffect(() => {
    setData(other_hymenoptera_data);
  }, [other_hymenoptera_data]);

  return (
    <Box sx={{ marginTop: 2, width: 400, marginLeft: 2, marginRight: 2 ,paddingBottom:2}}>
      <Table className={classes.table}>
        <TableHead sx={{color:"red"}}>Other Hymenoptera
          <TableRow>
            <TableCell className={classes.cell}>Family</TableCell>
            <TableCell className={classes.cell}>Species</TableCell>
            <TableCell className={classes.cell}>Photo</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {other_hymenoptera_data?.map((otherhym) => (
              <TableRow key={otherhym.id}>
                <TableCell key={otherhym.id} className={classes.cell}>{otherhym.insect_families.family_name}</TableCell>
                <TableCell key={otherhym.id} className={classes.cell}>{otherhym.insect_genera.genus_name + " "+otherhym.species_name}</TableCell>
                <TableCell key={otherhym.id} className={classes.cell}>
                  {/* <img src={insect.photo} alt={`${insect.species} photo`} /> */}
                </TableCell>
              </TableRow>
            )
          )}
        </TableBody>
      </Table>
    </Box>
  );
}
