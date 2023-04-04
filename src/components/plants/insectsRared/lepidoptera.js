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

export default function Lepidoptera({ lepidoptera_data }) {
  console.log('coleoptera_data client side');
  console.log(lepidoptera_data);

  const classes = useStyles();
  const [data, setData] = useState([]);
  useEffect(() => {
    setData(lepidoptera_data);
  }, [lepidoptera_data]);

  return (
    <Box sx={{ marginTop: 2, width: 400, marginLeft: 2, marginRight: 2}}>
      <Table className={classes.table}>
        <TableHead sx={{color:"green"}}>Lepidoptera
          <TableRow>
            <TableCell className={classes.cell}>Family</TableCell>
            <TableCell className={classes.cell}>Species</TableCell>
            <TableCell className={classes.cell}>Photo</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {lepidoptera_data?.map((lep) => (
              <TableRow key={lep.id}>
                <TableCell key={lep.id}  className={classes.cell}>{lep.insect_families.family_name}</TableCell>
                <TableCell key={lep.id} className={classes.cell}>{lep.insect_genera.genus_name + " "+ lep.species_name}</TableCell>
                <TableCell key={lep.id} className={classes.cell}>
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
