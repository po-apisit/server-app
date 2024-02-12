import { connection } from '../connection/database-connection';
import { mappingarray } from '../installer/mappingmodel';
import { User } from '../model/user';

export const findAll = async ():Promise<User[]>  => {
    try {
        const query: string = "SELECT * FROM Users WHERE deleted_at IS NULL;";
        const [rows]: any = await (await connection()).query(query);
        return mappingarray<User>(rows);
    } catch (error) {
        console.error('Error finding users by findAll:', error);
        throw error; // ส่ง error ออกไปถ้าเกิดข้อผิดพลาด
    }
    
}

export const findByPk = async (id: number): Promise<User[]> => {
    try {
        const query: string = "SELECT * FROM Users WHERE user_id = ? AND deleted_at IS NULL;";
        const [rows]: any = await (await connection()).query(query, [id]);
        return mappingarray<User>(rows);
    } catch (error) {
        console.error('Error finding users by findByPk:', error);
        throw error; // ส่ง error ออกไปถ้าเกิดข้อผิดพลาด
    }
    
}

export const findUsername = async (username: string): Promise<User[]> => {
    try {
        const query: string = "SELECT * FROM Users WHERE username = ? AND deleted_at IS NULL;";
        const [rows] : any = await (await connection()).query(query, [username]);
        return mappingarray<User>(rows);
    } catch (error) {
        console.error('Error finding users by findUsername:', error);
        throw error; // ส่ง error ออกไปถ้าเกิดข้อผิดพลาด
    }
    
}

export const findLikeUsername = async (username: string): Promise<User[]> => {
    try {
        const query: string = "SELECT * FROM Users WHERE username LIKE ? AND deleted_at IS NULL;";
        const [rows] : any = await (await connection()).query(query, [`%${username}%`]);
        return mappingarray<User>(rows);
    } catch (error) {
        console.error('Error finding users by findLikeUsername:', error);
        throw error; // ส่ง error ออกไปถ้าเกิดข้อผิดพลาด
    }
    
}

export const findEmail = async (email: string): Promise<User[]> => {
    try {
        const query: string = "SELECT * FROM Users WHERE email = ? AND deleted_at IS NULL;";
        const [rows]: any = await (await connection()).query(query, [email]);
        const array = mappingarray<User>(rows);        
        return array;
    } catch (error) {
        console.error('Error finding users by findEmail:', error);
        throw error; // ส่ง error ออกไปถ้าเกิดข้อผิดพลาด
    }
}

export const findLikeEmail = async (email: string): Promise<User[]> => {
    try {
        const query: string = "SELECT * FROM Users WHERE email LIKE ? AND deleted_at IS NULL;";
        const [rows]: any = await (await connection()).query(query, [`%${email}%`]);
        return mappingarray<User>(rows);
    } catch (error) {
        console.error('Error finding users by findLikeEmail:', error);
        throw error; // ส่ง error ออกไปถ้าเกิดข้อผิดพลาด
    }
}


export const Add = async (user:User): Promise<boolean> => {
    try {
        const query: string = `
        INSERT INTO Users (user_id, username, email, password, phone, date_of_birth, line_id, profile_picture, created_at)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW());`;
        const values = [user.user_id, user.username, user.email, user.password, user.phone, user.date_of_birth, user.line_id, 
                        user.profile_picture];

        const [rows]: any = await (await connection()).query(query, values);

        return true; // ถ้าไม่เกิดข้อผิดพลาด คืนค่า true
    } catch (error) {
        console.error('Error inserting user:', error);
        return false; // ถ้าเกิดข้อผิดพลาดในการเพิ่มข้อมูล คืนค่า false
    }
}
