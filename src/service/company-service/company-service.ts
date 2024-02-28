import { ICompany } from "../../model/company_model/ICompany";
import * as companyRepo from "../../repositorie/company-repositorie/company-repositorie";

export const findall = async ():Promise<ICompany[]> => 
            await companyRepo.findall();

export const findbypk = async (company:ICompany):Promise<ICompany> => 
            await companyRepo.findbypk(company);

export const findbyname = async (company:ICompany):Promise<ICompany> =>
            await companyRepo.findbyname(company);

export const findlikebyname = async (company:ICompany):Promise<ICompany[]> =>
            await companyRepo.findlikebyname(company);
export const findbytagurl = async (company:ICompany):Promise<ICompany> =>
            await companyRepo.findbytagurl(company);