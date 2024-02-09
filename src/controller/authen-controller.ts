import { Request, Response } from "express";
import * as authenService from "../service/authen-service"
import { mappingobj } from "../installer/mappingmodel";
import { User } from "../model/user";
import { TokenResponse } from "../model/tokenresponse";
import { OK } from "../installer/instant";



export const register = async (req: Request, res:Response) => {
    const client:User = mappingobj<User>(req.body);    
    const tokenresponse:TokenResponse = await authenService.Register(client);
    res.json(tokenresponse);
}

export const loginSystem = async (req: Request, res:Response) => {
    const client:User = mappingobj<User>(req.body);
    const tokenresponse:TokenResponse = await authenService.LoginSystem(client);
    
    if(tokenresponse.result === OK)
    {
        if(typeof tokenresponse.user !== "undefined")
        {
            res.cookie(tokenresponse.user[0].username, tokenresponse.token || "", { httpOnly: true, maxAge: 3 * 24 * 60 * 60 * 1000 });
            res.status(200).json(tokenresponse)
        }
        
    } else
    {
        res.status(401).json(tokenresponse)
    }
}