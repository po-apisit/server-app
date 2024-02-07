import { Router } from "express";
import handler from "./test-handler";

const router = Router();


router.use("/api", handler)

export default router;