import React, { useState } from 'react';
import {
  Box, Drawer, List, ListItem, ListItemText,
} from '@mui/material';

function OrderDropdown({ orderName, children }) {
  const [isOpen, setIsOpen] = useState(false);

  const handleToggle = () => {
    setIsOpen(!isOpen);
  };

  const handleClose = () => {
    setIsOpen(false);
  };

  return (
    <>
      <Box sx={{ marginBottom: '0.5rem' }}>
        <Box sx={{ cursor: 'pointer' }} onClick={handleToggle}>
          {orderName}
        </Box>
      </Box>
      <Drawer anchor="right" open={isOpen} onClose={handleClose}>
        <List>
          <ListItem button onClick={handleClose}>
            <ListItemText primary={orderName} />
          </ListItem>
          {children}
        </List>
      </Drawer>
    </>
  );
}
