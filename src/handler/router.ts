import { Router } from "express";
import userHandler from "./user-handler";
import authenHandler from "./authen-handler";
import { authenticateToken } from "../installer/jsonwebtoken";
import postHandler from "./post-handler";
import postuserHandler from "./postuser-handler";
import chatRoom from "./chart-handler";

const router = Router();

router.use("/api/user", authenticateToken, userHandler)
router.use("/api/post", postHandler)
router.use("/api/postuser", postuserHandler)
router.use("/api/authen", authenHandler)
router.use("/api/chat", chatRoom)

export default router;