import { Button, Card, Container } from "@mui/material";
import Glossary from "components/glossary/glossary";
import { Box } from "@mui/system";
import { makeStyles } from "@mui/styles";
import { useRouter } from "next/router";
import Router from "next/router";
import DynamicValueCard from "components/plants/dynamicvaluecard";
import Link from "next/link";

const useStyles = makeStyles({
  root: {
    display: "flex",
    paddingTop: 4,
    // marginLeft: "1rem",
  },
  item: {
    margin: 0,
  },
  card: {
    width: "100%",
    height: 25,
  },
  activeLink: {
    color: "red",
    borderBottom: "1px solid white",
  },
  content: {
    // height: 150,
    overflowY: "scroll",
    width: "20%",
    border: "1px solid #ccc",
    color: "red",
    textAlign: "center",
    marginTop: 4,
    marginLeft: 3,
  },
});

export default function GlossaryPage() {
  const router = useRouter();

  const classes = useStyles();
  const handleClick = (genus) => {
    Router.push({
      pathname: `/glossary/allterms`,
    });
  };
  return (
    <Container sx={{ marginBottom: 2, marginTop: 7 }}>
      <Button
        sx={{
          // height: 150,
          overflowY: "scroll",
          width: "30%",
          border: "1px solid #ccc",
          color: "green",
          textAlign: "center",
          marginLeft: 40,
        }}
        onClick={(e) => handleClick(e)}
      >
        <Link href="/glossary/allterms">
          View all terms in alphabetical order
        </Link>
      </Button>{" "}
      <Box sx={{ marginLeft: 7 }}> Fruit features</Box>
      <Button className={classes.content}>Type</Button>
    </Container>
  );
}
