// const express = require("express");
// const multer = require("multer");
// const path = require("path");
// const router = express.Router();

// const storage = multer.diskStorage({
//   destination: function (req, file, cb) {
//     cb(null, "public/");
//   },
//   filename: function (req, file, cb) {
//     const uniqueSuffix = Date.now() + "-" + Math.round(Math.random() * 1e9);
//     cb(
//       null,
//       file.fieldname + "-" + uniqueSuffix + path.extname(file.originalname)
//     );
//   },
// });

// const upload = multer({ storage });

// router.post(
//   "/api/plants/download/upload",
//   upload.array("image", 5),
//   (req, res) => {
//     const imageNames = req.files.map((file) => file.filename);
//     res.json({ imageNames });
//   }
// );

// module.exports = router;
// Create a FormData object

// app.listen(3001, () => {
//   console.log("Server is running on port 3001");
// });
import { IncomingForm } from "formidable";
import { promises as fs } from "fs";

var mv = require("mv");

export const config = {
  api: {
    bodyParser: false,
  },
};

export default async (req, res) => {
  const data = await new Promise((resolve, reject) => {
    // console.log(req);
    const form = new IncomingForm();

    form.parse(req, (err, fields, files) => {
      if (err) return reject(err);
      console.log(fields, files);
      console.log(files.file.filepath);
      var oldPath = files.file.filepath;
      var newPath = `./public/photos/plants/${files.file.originalFilename}`;
      mv(oldPath, newPath, function (err) {});
      res.status(200).json({ fields, files });
    });
  });
};
