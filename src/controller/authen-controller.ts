import { Request, Response } from "express";
import * as authenService from "../service/authen-service"
import { mappingobj } from "../installer/mappingmodel";
import { User } from "../model/user";


export const loginSystem = (req: Request, res:Response) => {
    console.log(req);
    
    const username:User = mappingobj<User>(req.body);
    res.json(username)
}