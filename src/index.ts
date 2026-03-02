// index.js
import express from "express";
const app = express();
const port = "8086";

app.get("/", (req, res) => {
  res.send("Hello World!");
  console.log("Response sent v2");
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});