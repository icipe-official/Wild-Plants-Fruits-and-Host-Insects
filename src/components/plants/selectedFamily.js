import { createContext, useState } from "react";
//maintain state across pages
export const SelectedItemsContext = createContext([]);

export const SelectedItemsProvider = ({ children }) => {
  const [selectedItems, setSelectedItems] = useState([]);

  return (
    <SelectedItemsContext.Provider value={{ selectedItems, setSelectedItems }}>
      {children}
    </SelectedItemsContext.Provider>
  );
};
