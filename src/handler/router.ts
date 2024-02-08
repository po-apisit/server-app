import { Router } from "express";
import userHandler from "./user-handler";
import authenHandler from "./authen-handler";

const router = Router();

router.use("/api/user", userHandler)
router.use("/api/authen", authenHandler)

export default router;