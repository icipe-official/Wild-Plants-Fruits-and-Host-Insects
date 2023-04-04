//import custom components
import Layout from 'components/layout'
import Navbar from 'components/navbarMUI';
//Client-side cache, shared for the whole session of the user in the browser.
//remove the server-side generated CSS
// import "../styles/globals.css";
import { ThemeProvider } from "@mui/material";
import theme from "../../utils/theme";
import { CacheProvider } from "@emotion/react";
import createCache from "@emotion/cache";
import Head from 'next/head'
import CssBaseline from '@mui/material/CssBaseline';
import { Provider } from 'react-redux'
import store from '../../redux/store'
// import { Provider } from "react-redux";
const clientSideEmotionCache = createCache({ key: "css", prepend: true });

export default function MyApp({
  Component,
  emotionCache = clientSideEmotionCache,
  pageProps}) {
    
 return (
    <>
      <CacheProvider value={emotionCache}>
        <ThemeProvider theme={theme}>
          <CssBaseline />
          <Layout>
            <Component {...pageProps} />
          </Layout>
        </ThemeProvider>
      </CacheProvider>
    </>
 );
}

// import Layout from 'components/layout'
// // import footer from '/components/footer'
// import styles from 'components/styles.css'
// export default function App({ Component, pageProps }) {
//   return(
//     <Layout>
//       <div>
//         <Component{...pageProps}/>
//       </div>
//     </Layout>
//   )
// }

// import { useIonRouter, IonHeader, IonToolbar, IonButtons, IonButton, IonIcon } from '@ionic/react';
// import { arrowBack } from 'ionicons/icons';
// import { IonReactRouter, IonRouterOutlet } from '@ionic/react-router';
// import { useLocation } from 'react-router-dom';

// function App({ Component, pageProps }) {
//   const router = useIonRouter();
//   const location = useLocation();

//   const handleBackClick = () => {
//     router.goBack();
//   };

//   return (
//     <IonReactRouter>
//       {/* <IonHeader> */}
//         <IonToolbar>
//           {location.pathname !== '/' && (
//             <IonButtons slot="start">
//               <IonButton onClick={handleBackClick}>
//                 <IonIcon slot="icon-only" icon={arrowBack} />
//               </IonButton>
//             </IonButtons>
//           )}
//         </IonToolbar>
//       {/* </IonHeader> */}
//       <IonRouterOutlet>
//         <Component {...pageProps} />
//       </IonRouterOutlet>
//     </IonReactRouter>
//   );
// }

// export default App;


