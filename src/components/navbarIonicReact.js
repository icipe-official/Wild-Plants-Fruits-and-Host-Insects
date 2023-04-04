import { useState } from "react";
// import { menuOutline } from 'ionicons/icons';
import { IonHeader, IonContent, IonToolbar, IonButtons, IonBackButton, IonTitle } from '@ionic/react';
export default function NavbarIonicReact(){
  const [showDropdown, setShowDropdown] = useState(false);

  const toggleDropdown = () => {
    setShowDropdown(!showDropdown);
  };

  return (
    <IonHeader>
      <IonToolbar>
        <IonTitle>My App</IonTitle>
        <IonButtons slot="start">
          <IonButton onClick={toggleDropdown}>
            <IonIcon icon={menuOutline} />
          </IonButton>
        </IonButtons>
        <div className={`ion-hide-sm-down ${showDropdown ? "" : "ion-hide"}`}>
          <IonButton routerLink="/" className={`${router.pathname === "/" ? "active" : ""}`}>Home</IonButton>
          <IonButton routerLink="/plants" className={`${router.pathname === "/plants" ? "active" : ""}`}>Plants and Fruits data</IonButton>
          <IonButton routerLink="/multipleentry" className={`${router.pathname === "/multipleentry" ? "active" : ""}`}>Multiple-Entry Key to Plants</IonButton>
          <IonButton routerLink="/insects" className={`${router.pathname === "/insects" ? "active" : ""}`}>Insects</IonButton>
          <IonButton routerLink="/glossary" className={`${router.pathname === "/glossary" ? "active" : ""}`}>Glossary</IonButton>
          <IonButton routerLink="/biogeography" className={`${router.pathname === "/biogeography" ? "active" : ""}`}>Biogeography</IonButton>
        </div>
      </IonToolbar>
    </IonHeader>
  );
};