import { connection } from "../../connection/database-connection";
import { mappingarray, mappingobj } from "../../installer/mappingmodel";
import { LIKE_CENTER } from "../../installer/sqlcustom";
import { ICompany } from "../../model/company_model/ICompany";

export const findall = async ():Promise<ICompany[]> => {
    try {
        const query: string = "SELECT * FROM TB_COMPANY;";
        const [rows]:any = await(await connection()).query(query);
        return mappingarray<ICompany>(rows);
    } catch (error) {
        throw error;
    }
}

export const findbypk = async (company:ICompany):Promise<ICompany> => {
    try {
        const query: string = "SELECT * FROM TB_COMPANY WHERE ID_COMPANY = ? AND DELETED_AT IS NULL;";
        const [rows]:any = await(await connection()).query(query, [company.ID_COMPANY]);
        return mappingobj<ICompany>(rows);
    } catch (error) {
        throw error;
    }
}

export const findlikebyname = async (company:ICompany):Promise<ICompany[]> => {
    try {
        const query:string = "SELECT * FROM TB_COMPANY WHERE COMPANY_NAME LIKE ? AND DELETED_AT IS NULL;";
        const [rows]:any = await (await connection()).query(query, [LIKE_CENTER(company.COMPANY_NAME)]);
        return mappingarray<ICompany>(rows);
    } catch (error) {
        throw error;
    }
}

export const findbyname = async (company:ICompany):Promise<ICompany> => {
    try {
        const query:string = "SELECT * FROM TB_COMPANY WHERE COMPANY_NAME = ? AND DELETED_AT IS NULL;";
        const [rows]:any = await (await connection()).query(query, [company.COMPANY_NAME]);
        return mappingobj<ICompany>(rows);
    } catch (error) {
        throw error;
    }
}


export const findbytagurl = async (company:ICompany):Promise<ICompany> => {
    try {
        const query:string = "SELECT * FROM TB_COMPANY WHERE TAG_URL = ? AND DELETED_AT IS NULL;";
        const [rows]:any = await (await connection()).query(query, [company.TAG_URL]);
        return mappingobj<ICompany>(rows);
    } catch (error) {
        throw error;
    }
}
