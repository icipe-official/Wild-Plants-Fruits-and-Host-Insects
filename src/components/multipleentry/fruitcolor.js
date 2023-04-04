import React, { useState, useEffect } from 'react';
import FormGroup from '@mui/material/FormGroup';
import FormControlLabel from '@mui/material/FormControlLabel';
import Checkbox from '@mui/material/Checkbox';
import { Box } from '@mui/material';

export default function GroupcheckboxColor({ fruit_color_data, onColorChange }) {
  const [checkedStateColor, setCheckedStateColor] = useState(
    new Array(fruit_color_data.length).fill(false)
  );
  const fruit_color_array = fruit_color_data.map((specie) => specie.color);

  const handleOnChangeColor = (position) => {
    const updatedCheckedStateColor = checkedStateColor.map((item, index) =>
      position === index ? !item : item
    );
    setCheckedStateColor(updatedCheckedStateColor);

    const selectedColors = updatedCheckedStateColor
      .flatMap((bool, index) => (bool ? fruit_color_array[index] : null))
      .filter(Boolean);

    onColorChange(selectedColors);
  };

//   Set previous query when component mounts
  useEffect(() => {
    onColorChange(fruit_color_array);
  }, []);

  return (
    <Box>
      <Box sx={{ color: 'red', padding: 0 }}>Fruit Color</Box>
      <Box sx={{ padding: 0 }}>
        {fruit_color_array.sort().map((color, index) => (
          <FormGroup key={color}>
            <FormControlLabel
              control={
                <Checkbox
                  checked={checkedStateColor[index]}
                  onChange={() => handleOnChangeColor(index)}
                />
              }
              label={color}
            />
          </FormGroup>
        ))}
      </Box>
    </Box>
  );
}
