import express from "express"
import { status_connection } from "./connection/database-connection";
import cookieParser from 'cookie-parser';
import * as routerprovider from "./handler/router";

const app = express();


// เซตfolder static
app.use(express.static("pubilc"))
app.use(express.json());
app.use(cookieParser());

// router and commad check database
app.use("/", status_connection, routerprovider.default)




export default app;


