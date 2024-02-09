import { Response } from "express";
import { deleteTokenFromCookie, generateTokenAndSetCookie } from "../installer/jsonwebtoken";
import { User } from "../model/user";
import * as userRepositorie from "../repositorie/user-repositoris";
import bcrypt from 'bcrypt';
import { NOK, OK } from "../installer/instant";
import { TokenResponse } from "../model/tokenresponse";
import dotenv from 'dotenv';

dotenv.config();

export const LoginSystem = async (user:User):Promise<TokenResponse> => {

    const response:TokenResponse = { result:NOK, message:"username:email or password is current!"};
    const email:User[] = await userRepositorie.findEmail(user.email);
    const username:User[] = await userRepositorie.findUsername(user.username);    
    if(email.length !== 0)
    {
        const match:boolean = bcrypt.compareSync(user.password, email[0].password)
        if(match)
        {
            response.result = OK;
            response.user = email
            response.token = generateTokenAndSetCookie(email[0])
            response.message = "";
        }
    } 
    else if (username.length !== 0)
    {
        
        const match:boolean = bcrypt.compareSync(user.password, username[0].password)

        if(match)
        {
                response.result = OK;
                response.user = username;
                response.token = generateTokenAndSetCookie(username[0]);
                response.message = "";
        }
    } 


    return response;
}

export const Register = async (user: User): Promise<TokenResponse> => {
    let response: TokenResponse = {};
    let duplicate: User[] = [];

    if (!user.username || !user.password) {
        response.result = NOK;
        response.message = "Username or password is required";
        return response;
    }

    // Check for duplicate email
    duplicate = await userRepositorie.findEmail(user.email);
    if (duplicate.length > 0) {
        response.result = NOK;
        response.message = "Email is already in use";
        return response;
    }

    // Check for duplicate username
    duplicate = await userRepositorie.findUsername(user.username);
    if (duplicate.length > 0) {
        response.result = NOK;
        response.message = "Username is already in use";
        return response;
    }

    try {
        // Hash the password
        const hashedPassword = await new Promise<string>((resolve, reject) => {
            bcrypt.hash(user.password, 10, (err, hash) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(hash);
                }
            });
        });

        // Store the hashed password in the user object
        user.password = hashedPassword;

        // Add the user to the repository
        const addedUser = await userRepositorie.Add(user);

        if(addedUser)
        {
            response.result = OK;
            response.message = "";
            response.user = await userRepositorie.findUsername(user.username);
            response.user[0].password = "";
            response.token = "";
        }

        
        return response;
    } catch (error) {
        response.result = NOK;
        response.message = "Error adding user: " + error;
        return response;
    }
}

export const Loout = (token:string, res:Response):boolean => deleteTokenFromCookie(token, res);
