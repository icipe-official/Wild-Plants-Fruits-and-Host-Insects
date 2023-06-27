const express = require("express");
const { createProxyMiddleware } = require("http-proxy-middleware");
const next = require("next");

const dev = process.env.NODE_ENV === "production";
const app = next({ dev });
const handle = app.getRequestHandler();

app.prepare().then(() => {
  const server = express();

  // server.use(
  //   "/plants",
  //   createProxyMiddleware({
  //     target: process.env.NEXT_PUBLIC_API_BASE_URL,
  //     changeOrigin: true,
  //     pathRewrite: {
  //       "^/plants/": "/", // rewrite /plants/:id to /:id
  //     },
  //   })
  // );

  server.all("*", (req, res) => handle(req, res));

  const port = process.env.PORT || 3000;

  server.listen(port, (err) => {
    if (err) throw err;
    ////console.log(`> Ready on http://localhost:${port}`);
  });
});
