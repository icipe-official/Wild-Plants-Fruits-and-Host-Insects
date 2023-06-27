// import PhylogeneticTreeSvg from "components/biogeography/svg";
// import { Container, Box } from "@mui/material";
// const Home = () => {
//   return (
//     <Box sx={{ marginLeft: 4, marginRight: 4, marginTop: 5 }}>
//       <div>
//         <h1>Phylogenetic Tree</h1>
//         <PhylogeneticTreeSvg />
//       </div>
//     </Box>
//   );
// };

// export default Home;
// import fs from "fs";
import { Box } from '@mui/material';

import { useEffect } from 'react';

const base_path = process.env.NEXT_PUBLIC_BASE_PATH ? `${process.env.NEXT_PUBLIC_BASE_PATH}` : "";

export default function MyComponent() {
  useEffect(() => {
    document.body.style.margin = '0';
    document.body.style.overflow = 'hidden';
  }, []);

  return (
    <div>
      <iframe
        src={`${base_path}/phylotree.html`}
        style={{
          position: 'absolute',
          top: 0,
          left: 8,
          width: '90%',
          height: '90%',
        }}
      />
    </div>
  );
}
