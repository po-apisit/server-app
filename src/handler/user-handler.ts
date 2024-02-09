import { Router } from "express";
import * as userController from "../controller/user-controller";

const userHandler = Router();

userHandler.get("/users", userController.findall)
userHandler.get("/user/:id", userController.findbypk)
userHandler.get("/username/:username", userController.findLikeUsername)

export default userHandler;