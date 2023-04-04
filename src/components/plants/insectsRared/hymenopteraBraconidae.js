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

export default function HymenopteraBraconidae({ hymenoptera_bracon_opiinae_data }) {
  console.log('coleoptera_data client side');
  console.log(hymenoptera_bracon_opiinae_data);

  const classes = useStyles();
  const [data, setData] = useState([]);
  useEffect(() => {
    setData(hymenoptera_bracon_opiinae_data);
  }, [hymenoptera_bracon_opiinae_data]);

  return (
    <Box sx={{ marginTop: 2, width: 400, marginLeft: 2, marginRight: 2}}>
      <Table className={classes.table}>
        <TableHead sx={{color:"red"}}>Hymenoptera (Braconidae: Opina) 
          <TableRow>
            <TableCell className={classes.cell}>Family</TableCell>
            <TableCell className={classes.cell}>Species</TableCell>
            <TableCell className={classes.cell}>Photo</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {hymenoptera_bracon_opiinae_data?.map((hym) => (
              <TableRow key={hym.id}>
                <TableCell key={hym.id} className={classes.cell}>{hym.insect_families.family_name}</TableCell>
                <TableCell key={hym.id} className={classes.cell}>{hym.insect_genera.genus_name + " "+hym.species_name}</TableCell>
                <TableCell key={hym.id} className={classes.cell}>
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
