import { Router } from "express";
import * as companyControl from "../../controller/company-controller/company-controller";

const companyHandler = Router();

companyHandler.post("/findall", companyControl.findall);
companyHandler.post("/findbypk", companyControl.findbypk);
companyHandler.post("/findbyname", companyControl.findbyname);
companyHandler.post("/findlikebyname", companyControl.findlikebyname);
companyHandler.post("/findbytagurl", companyControl.findbytagurl);

export default companyHandler;