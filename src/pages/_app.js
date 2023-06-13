import Layout from "components/layout";
import Navbar from "components/navbarMUI";
//Client-side cache, shared for the whole session of the user in the browser.
//remove the server-side generated CSS
// import "../styles/globals.css";
import { ThemeProvider } from "@mui/material";
import theme from "../../utils/theme";
import { CacheProvider } from "@emotion/react";
import createCache from "@emotion/cache";
import Head from "next/head";
import CssBaseline from "@mui/material/CssBaseline";
import { SelectedItemsProvider } from "components/plants/selectedFamily";
import PlantFamilyGenusSpecies from "components/plants/FamilyGenusSpecies/PlantGenusFamilySearchbar";
import Router, { useRouter } from "next/router";
// import { useRouter } from "next/router";
import { withRouter } from "next/router";
// import { Provider } from "react-redux";
const clientSideEmotionCache = createCache({ key: "css", prepend: true });
// const isPlantsRoute = Router.pathname === /plants/{1}";
// const router = useRouter();
// const isPlantsRoute = useRouter.pathname;
// Check if the current route matches "/plants" or "/plants/:id"

console.log("isPlantsRoute");
// console.log(isPlantsRoute == "glossary");
export default function MyApp({
  Component,
  router,
  emotionCache = clientSideEmotionCache,
  pageProps,
}) {
  return (
    <>
      <CacheProvider value={emotionCache}>
        <ThemeProvider theme={theme}>
          <SelectedItemsProvider>
            {router.pathname.startsWith("/plants") && (
              <PlantFamilyGenusSpecies />
            )}
            <CssBaseline />
            <Layout>
              <Component {...pageProps} />
            </Layout>
          </SelectedItemsProvider>
        </ThemeProvider>
      </CacheProvider>
    </>
  );
}

// // export default App;
