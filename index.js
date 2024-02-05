const express = require("express");
const app = express();
const cors = require("cors");
require('dotenv').config();

app.use(cors());

// Router
app.use("/api", require("./src/Router/index.js"));


// Lisgtn
app.listen(process.env.PORT, () => {
    console.log("Server Is Running");
})