import { PostUser } from "../model/postuser";
import * as postuserService from "../service/postuser-service";
import { Request, Response } from "express"

export const nonauthen_findrandom = async (req:Request, res:Response) => {
    const result:PostUser[] = await postuserService.nonauthen_findrandom();
    res.status(200).json(result)
}   