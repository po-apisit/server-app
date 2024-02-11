import { Router } from "express";
import * as postuserController from "../controller/postuser-controller";

const postuserHandler = Router();

postuserHandler.get("/nonauthen/findall", postuserController.nonauthen_findrandom)

export default postuserHandler;