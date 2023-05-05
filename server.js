// const { createProxyMiddleware } = require("http-proxy-middleware");
// const express = require("express");

// const next = require("next");
// const express = require("express");
// const http = require("http");
// const https = require("https");
// const fs = require("fs");

// const ports = {
//   http: 3080,
//   https: 3000,
// };
// const dev = process.env.NODE_ENV !== "production";
// const app = next({ dev });
// const handle = app.getRequestHandler();
// const server = express();

// const options = {
//   key: fs.readFileSync("localhost.key"),
//   cert: fs.readFileSync("localhost.crt"),
// };

// //handle redirect to the server
// const proxy = createProxyMiddleware("/plants", {
//   target: "http://localhost:3000",
//   changeOrigin: true,
//   pathRewrite: {
//     // rewrite /plants/:id to /:id
//     "^/plants/": "/",
//   },
// });

// app.use(proxy);

// // Start the server
// app.listen(process.env.PORT || 35705, () => {
//   console.log(
//     `Server running at http://localhost:${process.env.PORT || 35705}`
//   );
// });
const { createProxyMiddleware } = require("http-proxy-middleware");
// import nextConf from "./next.config.mjs";

const express = require("express");
const http = require("http");
const https = require("https");
const fs = require("fs");
const path = require("path");
const next = require("next");

const ports = {
  http: 3080,
  https: 3000,
};

const dev = process.env.NODE_ENV !== "production";
const app = next({ dev });
const handle = app.getRequestHandler();
const server = express();

const options = {
  key: fs.readFileSync("/home/bonface/key.pem"),
  cert: fs.readFileSync("/home/bonface/cert.pem"),
};

app.prepare().then(() => {
  server.use(
    "/plants",
    createProxyMiddleware({
      target: "https://localhost:3000",
      changeOrigin: true,
      pathRewrite: {
        // rewrite /plants/:id to /:id
        "^/plants/": "/",
      },
    })
  );

  server.all("*", (req, res) => {
    return handle(req, res);
  });

  // http.createServer(server).listen(ports.http, () => {
  //   console.log(`HTTP Server running on port ${ports.http}`);
  // });

  https.createServer(options, server).listen(ports.https, () => {
    console.log(`HTTPS Server running on port ${ports.https}`);
  });
});