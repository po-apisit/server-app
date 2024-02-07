import express from "express"
import { status_connection } from "./connection/database-connection";
import * as routerprovider from "./handler/router";
const app = express();

// เซตfolder static
app.use(express.static("pubilc"))

// router and commad check database
app.use("/", status_connection, routerprovider.default)



export default app;


