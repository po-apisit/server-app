// import { Request, Response, NextFunction } from 'express';
// import jwt from 'jsonwebtoken';
// import { User } from '../model/user';
// import dotenv from 'dotenv';
// import { OK } from './instant';

// dotenv.config();

// // ฟังก์ชันสำหรับสร้าง Token JWT และบันทึกในคุกกี้ด้วย user_id
// export const generateTokenAndSetCookie = (user: User): string => {
//     const clientReason = user.username.toString(); // ข้อมูลที่จะใช้ใน JWT
//     const token = jwt.sign({ clientReason }, process.env.JWT_SECRETKEY || "jwt");   
//     return token;
// };

// // Middleware สำหรับเช็ค JWT จาก header Authorization
// export const authenticateToken = (req: Request, res: Response, next: NextFunction) => {
//     const authHeader = req.headers['authorization'] as string;
    
//     if (!authHeader) {
//         return res.sendStatus(401); // Unauthorized หากไม่มี header Authorization
//     }

//     const token = authHeader.split(' ')[1]; // ดึง token ออกมาจาก header Authorization
    
//     if (!token) {
//         return res.sendStatus(401); // Unauthorized หากไม่มี token
//     }

//     jwt.verify(token, process.env.JWT_SECRETKEY || "jwt", (err: any, decoded: any) => {
        
//         if (err) {
//             return res.sendStatus(403); // Forbidden หาก token ไม่ถูกต้อง
//         }
//         const userId = decoded.clientReason; // ดึง user_id จาก decoded token

//         const userCookie = req.cookies[userId]; // ดึงคุกกี้ของ user_id จากคุกกี้ที่บันทึกไว้
        
//         if (!userCookie || userCookie !== token) {
//             return res.sendStatus(401); // Unauthorized หากคุกกี้ไม่ตรงกับ token
//         }
//         next();
//     });
// };


// export const deleteTokenFromCookie = (req: Request, res: Response) => {

//     const authHeader = req.headers['authorization'] as string;

//     if (!authHeader) {
//         return res.sendStatus(401); // Unauthorized หากไม่มี header Authorization
//     }

//     const token = authHeader.split(' ')[1]; // ดึง token ออกมาจาก header Authorization
    
//     if (!token) {
//         return res.sendStatus(401); // Unauthorized หากไม่มี token
//     }
    
//     jwt.verify(token, process.env.JWT_SECRETKEY || "jwt", (err: any, decoded: any) => {
        
//         if (err) {
//             return res.sendStatus(403); // Forbidden หาก token ไม่ถูกต้อง
//         }

//         const userId = decoded.clientReason; // ดึง user_id จาก decoded token
//          res.clearCookie(userId);
//         return res.status(200).json({ result:OK, message:"Logout success" })
//     })
// };

