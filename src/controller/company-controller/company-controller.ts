import { Request, Response } from "express";
import * as companyServ from "../../service/company-service/company-service";
import { ICompany } from "../../model/company_model/ICompany";
import { mappingobj } from "../../installer/mappingmodel";

export const findall = async (req:Request, res:Response) => {
    const companyRes:ICompany[] = await companyServ.findall();
    return res.json(companyRes);
}

export const findbypk = async (req:Request, res:Response) => {
    const companyReq:ICompany = mappingobj<ICompany>(req.body);
    const companyRes:ICompany = await companyServ.findbypk(companyReq);
    return res.json(companyRes);
}

export const findbyname = async (req:Request, res:Response) => {
    const companyReq:ICompany = mappingobj<ICompany>(req.body);
    const companyRes:ICompany = await companyServ.findbyname(companyReq);
    return res.json(companyRes);
}

export const findlikebyname = async (req:Request, res:Response) => {
    const companyReq:ICompany = mappingobj<ICompany>(req.body);
    const companyRes:ICompany[] = await companyServ.findlikebyname(companyReq);
    return res.json(companyRes);
}

export const findbytagurl = async (req:Request, res:Response) => {
    const companyReq:ICompany = mappingobj<ICompany>(req.body);
    const companyRes:ICompany = await companyServ.findbytagurl(companyReq);
    return res.json(companyRes);
}