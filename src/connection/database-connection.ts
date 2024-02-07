import mysql from 'mysql2/promise';
import { Request, Response, NextFunction } from 'express';
import dotenv from 'dotenv';
import { NOK, Network_Error } from '../installer/instant';
dotenv.config();


const connection = async () => {
    try {
        const conn = await mysql.createConnection({
            host: process.env.DB_HOST,
            port: parseInt(process.env.DB_PORT || '3306'),
            user: process.env.DB_USER,
            password: process.env.DB_PASSWORD,
            database: process.env.DB_DATABASE,
        });
        return conn;
    } catch (error) {
        throw error;
    }
}


const status_connection = async (req:Request, res:Response, next:NextFunction) => {    
    try {
        // เชื่อมต่อกับฐานข้อมูลและทดสอบการเชื่อมต่อ
        await (await connection()).ping();
        // หากสามารถเชื่อมต่อได้โดยไม่มีปัญหา
        return next();
    } catch (error) {
        // หากเกิดข้อผิดพลาดในการเชื่อมต่อ
        return res.status(400).json({ result: "Fail", message: error });
    }
}

export { connection, status_connection };