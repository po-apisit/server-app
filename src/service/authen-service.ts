import { Response } from "express";
import { deleteTokenFromCookie, generateTokenAndSetCookie } from "../installer/jsonwebtoken";
import { User } from "../model/user";
import * as userRepositorie from "../repositorie/user-repositoris";
import bcrypt from 'bcrypt';


interface TokenResponse
{
    user?:User[];
    token?:string;
}

export const LoginSystem = async (usernameoremail:string, res:Response):Promise<TokenResponse> => {
    const response:TokenResponse = {};
    const email:User[] = await userRepositorie.findEmail(usernameoremail);
    const username:User[] = await userRepositorie.findUsername(usernameoremail);

    if(email.length !== 0)
    {
        const match = await bcrypt.hashSync(email[0].password, process.env.SALTROUNDS || 12)
        if(match)
        {
            response.user = email
            response.token = generateTokenAndSetCookie(email[0], res)
        }
    } 
    else if (username.length !== 0)
    {
        const match = await bcrypt.hashSync(username[0].password, process.env.SALTROUNDS || 12)
        if(match)
        {
            response.user = username
            response.token = generateTokenAndSetCookie(username[0], res)
        }
    } 
    return response;
}

export const Loout = (token:string, res:Response):boolean => deleteTokenFromCookie(token, res);
