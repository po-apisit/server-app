import { Post } from "../model/post";
import * as postService from "../service/post-service";
import { Request, Response } from "express"

export const nonauthen_findrandom = async (req:Request, res:Response) => {
    const result:Post[] = await postService.nonauthen_findrandom();
    res.status(200).json(result)
}   