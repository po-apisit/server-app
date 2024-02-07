import { Router } from "express";

const handler = Router();

handler.get("/all", (req, res) => res.json({ message:"OKKKKk" }) )

export default handler;