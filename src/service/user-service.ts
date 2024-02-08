import { User } from "../model/user";
import * as userRepositorie from "../repositorie/user-repositoris";

export const findall = async ():Promise<User[]> => await userRepositorie.findAll();
export const findByPk = async (id:number):Promise<User[]>  => await userRepositorie.findByPk(id);
export const findLikeUsername = async (username:string):Promise<User[]>  => await userRepositorie.findLikeUsername(username);