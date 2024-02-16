import express from "express"
import { status_connection } from "./connection/database-connection";
import cookieParser from 'cookie-parser';
import * as routerprovider from "./handler/router";
import cors from "cors";

const app = express();


// เซตfolder static
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(__dirname + "/public"));
app.use(cors());
app.use(cookieParser());


// router and commad check database
app.use("/", status_connection, routerprovider.default)

export default app;


