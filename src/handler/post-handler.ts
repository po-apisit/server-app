import { Router } from "express";
import * as postController from "../controller/post-controller";

const postHandler = Router();

postHandler.get("/nonauthen/findall", postController.nonauthen_findrandom)

export default postHandler;