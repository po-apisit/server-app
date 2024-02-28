import { Router } from "express";
import companyHandler from "./company-handler/company-handler";


const router = Router();

router.use("/api/company", companyHandler )


export default router;