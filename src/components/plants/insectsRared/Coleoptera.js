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

export default function Coleoptera({ coleoptera_data }) {
  console.log('coleoptera_data client side');
  console.log(coleoptera_data);

  const classes = useStyles();
  const [data, setData] = useState([]);
  useEffect(() => {
    setData(coleoptera_data);
  }, [coleoptera_data]);

  return (
    <Box sx={{ marginTop: 2, width: 400, marginLeft: 2, marginRight: 2}}>
      <Table className={classes.table}>
        <TableHead sx={{color:"maroon"}}>Coleoptera 
          <TableRow>
            <TableCell className={classes.cell}>Family</TableCell>
            <TableCell className={classes.cell}>Species</TableCell>
            <TableCell className={classes.cell}>Photo</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {coleoptera_data?.map((col) => (
              <TableRow key={col.id}>
                <TableCell key={col.id} className={classes.cell}>{col.insect_families.family_name}</TableCell>
                <TableCell key={col.id} className={classes.cell}>{col.insect_genera.genus_name + " "+ col.species_name}</TableCell>
                <TableCell key={col.id} className={classes.cell}>
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
 