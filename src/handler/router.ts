import { Router } from "express";
import userHandler from "./user-handler";
import authenHandler from "./authen-handler";
import { authenticateToken } from "../installer/jsonwebtoken";
import { test } from "../controller/test-controller";



const router = Router();

router.use("/api/user", authenticateToken, userHandler)
router.use("/api/authen", authenHandler)
router.use("/api/test", test)

export default router;