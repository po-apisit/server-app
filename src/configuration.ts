import express from "express"
import { status_connection } from "./connection/database-connection";
import cookieParser from 'cookie-parser';
import * as routerprovider from "./handler/router";
import cors from "cors";

const app = express();

const whitelist = ['https://www.thai-camps.com'];
const corsOptions = {
  origin: (origin: string | undefined, callback: (err: Error | null, allow?: boolean) => void) => {
    if (origin && whitelist.includes(origin)) {
      callback(null, true);
    } else {
      callback(new Error('Not allowed by CORS'));
    }
  },
};



// เซตfolder static
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(__dirname + "/public"));
app.use(cors(corsOptions));
app.use(cookieParser());


// router and commad check database
app.use("/", status_connection, routerprovider.default)

export default app;


