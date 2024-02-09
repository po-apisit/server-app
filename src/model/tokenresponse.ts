import { User } from "./user";

export interface TokenResponse
{
    result?:string,
    user?:User[],
    token?:string;
    message?:string;
}