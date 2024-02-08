import { User } from "../model/user";
import * as userRepositorie from "../repositorie/user-repositoris";
import bcrypt from 'bcrypt';


interface TokenResponse
{
    user?:User[];
    token?:string;
}

export const LoginSystem = async (usernameoremail:string):Promise<TokenResponse> => {
    const response:TokenResponse = {};
    const email:User[] = await userRepositorie.findEmail(usernameoremail);
    const username:User[] = await userRepositorie.findUsername(usernameoremail);

    if(email.length !== 0)
    {
        const match = await bcrypt.hashSync(email[0].password, process.env.saltRounds || 12)
        if(match)
        {
            response.user = email
        }
    } 
    else if (username.length !== 0)
    {
        const match = await bcrypt.hashSync(username[0].password, process.env.saltRounds || 12)
        if(match)
        {
            response.user = email
        }
    } 
    return response;
}