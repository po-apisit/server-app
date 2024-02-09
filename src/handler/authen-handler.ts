import { Router } from "express";
import * as authenControllre from "../controller/authen-controller";
import { deleteTokenFromCookie } from "../installer/jsonwebtoken";

const authenHandler = Router();

authenHandler.post("/loginsystem", authenControllre.loginSystem)
authenHandler.post("/register", authenControllre.register)
authenHandler.post("/logout", deleteTokenFromCookie)

export default authenHandler;