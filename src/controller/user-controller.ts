import { Request, Response } from "express";
import * as userService from "../service/user-service";


export const findall = async (req:Request, res:Response) => {
    const response = await userService.findall();
    res.status(200).json(response)
}

export const findbypk = async (req:Request, res:Response) => {
    const id:number= parseInt(req.params.id?.toString() || '0') ;
    const response = await userService.findByPk(id);
    res.status(200).json(response)
}

export const findLikeUsername = async (req:Request, res:Response) => {
    const username:string= req.params.username?.toString() || '' ;
    const response = await userService.findLikeUsername(username);
    res.status(200).json(response)
}

