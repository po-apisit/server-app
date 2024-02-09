import { Request, Response } from "express"

export const test = (req:Request, res:Response) => {
    const id = req.query.id
    res.status(200).json({ result:"OK", id })
}   