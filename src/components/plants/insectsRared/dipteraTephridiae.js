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

export default function DipteraTephridiae({ diptera_tephritideae_data }) {
  console.log('diptera_tephritideae_data client side');
  console.log(diptera_tephritideae_data);

  const classes = useStyles();
  const [data, setData] = useState([]);
  useEffect(() => {
    setData(diptera_tephritideae_data);
  }, [diptera_tephritideae_data]);

  return (
    <Box sx={{ marginTop: 2, width: 400, marginLeft: 2, marginRight: 2}}>
      <Table className={classes.table}>
        <TableHead sx={{color:"maroon"}}>Diptera Tephridae
          <TableRow>
            <TableCell className={classes.cell}>Family</TableCell>
            <TableCell className={classes.cell}>Species</TableCell>
            <TableCell className={classes.cell}>Photo</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {diptera_tephritideae_data?.map((dipteph) => (
              <TableRow key={dipteph.id}>
                <TableCell key={dipteph.id} className={classes.cell}>{dipteph.insect_families.family_name}</TableCell>
                <TableCell key={dipteph.id} className={classes.cell}>{dipteph.insect_genera.genus_name + " "+dipteph.species_name}</TableCell>
                <TableCell key={dipteph.id} className={classes.cell}>
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
