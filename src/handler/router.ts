import { Router } from "express";
import userHandler from "./user-handler";

const router = Router();

router.use("/api", userHandler)

export default router;