import { Router } from "express";
import * as authenControllre from "../controller/authen-controller";

const authenHandler = Router();

authenHandler.post("/loginsystem", authenControllre.loginSystem)

export default authenHandler;