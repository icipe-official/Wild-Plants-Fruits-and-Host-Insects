import React, { useState } from 'react';
import { makeStyles } from '@mui/styles';
import Icon, { InputAdornment, TextField } from '@mui/material';
import MenuItem from '@mui/material/MenuItem';

import {
  ArrowDownwardSharp, ArrowDropDown, ArrowDropDownCircle, ArrowDropDownSharp, ArrowRightTwoTone, Menu, Search, SearchOff, SearchOffOutlined, SearchOffRounded, SearchOffSharp, SearchOffTwoTone, SearchRounded, SearchSharp,
} from '@mui/icons-material';

/**
 * Styles for the component.
 */
const useStyles = makeStyles((theme) => ({
  root: {
    width: '100%',
    marginTop: theme.spacing(0),
  },
  inputAdornment: {
    '&:hover': {
      cursor: 'pointer',
      color: theme.palette.primary.main,
    },
  },
}));

/**
   * Options for the select component.
   */
const data = [
  {
    id: 1,
    name: 'Option 1',
  },
  {
    id: 2,
    name: 'Option 2',
  },
  {
    id: 3,
    name: 'Option 3',
  },
  {
    id: 4,
    name: 'Option 4',
  },
];

/**
   * Component that implements a search select component.
   */
export default function SearchSelect() {
  const classes = useStyles();
  const [value, setValue] = useState('');
  const [filteredData, setFilteredData] = useState(data);
  const [anchorEl, setAnchorEl] = React.useState(null);
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  // const [isMenuClose, setIsMenuClose] = useState(true);

  /**
     * Handles the click event of the search component.
     * @param {Event} event - The click event.
     */
  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
    setIsMenuOpen(!isMenuOpen);
  };

  /**
     * Handles the close event of the select component.
     */
  const handleClose = () => {
    setAnchorEl(null);
  };

  /**
     * Handles the change event of the input component.
     * @param {Event} event - The change event.
     */
  const handleChange = (event) => {
    setValue(event.target.value);
    setFilteredData(
      data.filter((option) => option.name.toLowerCase().includes(event.target.value.toLowerCase())),
    );
  };

  /**
     * Handles the select event of the options component.
     * @param {Object} option - The selected option.
     */
  const handleSelect = (option) => {
    setValue(option.name);
    setFilteredData(data);
    setAnchorEl(null);
  };

  return (
    <div className={classes.root}>
      <TextField
        fullWidth
        id="standard-adornment-search"
        placeholder="Search and Select"
        value={value}
        onClick={(event) => handleClick(event)}
        onChange={(event) => handleChange(event)}

        //   onChange={handleChange}
        InputProps={{
          endAdornment: (
            <InputAdornment
              position="end"
              className={classes.inputAdornment}
            >
              <SearchSharp
                className={classes.inputAdornment}
              />
              <ArrowDropDownSharp onClick={(event) => handleClick(event)} />
            </InputAdornment>
          ),
        }}
      />
      {isMenuOpen && (
        <div>
          {filteredData.map((option) => (
            <MenuItem key={option.id} onClick={() => handleSelect(option)}>
              {option.name}
            </MenuItem>
          ))}
        </div>
      )}
    </div>
  );
}
