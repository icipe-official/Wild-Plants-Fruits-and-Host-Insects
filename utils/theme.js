import { createTheme } from '@mui/material/styles';
import { red } from '@mui/material/colors';

// Create a theme instance. globall css
const theme = createTheme({
    palette: {
    primary: {
    main: '#074880',
    },
    secondary: {
    main: '#19857b',
    },
    error: {
    main: red.A400,
        },
    },
    Link: {
        underline: "none"
      }
});

export default theme;