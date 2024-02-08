import { connection } from '../connection/database-connection';
import { User } from '../model/user';
 // นำเข้าฟังก์ชันเชื่อมต่อกับฐานข้อมูล


export const mapRowsToUsers = (rows: any[]): User[] => {
    return rows.map((row: any) => ({
        user_id: row.user_id,
        username: row.username,
        email: row.email,
        password: row.password,
        phone: row.phone,
        date_of_birth: row.date_of_birth,
        line_id: row.line_id,
        profile_picture: row.profile_picture,
        created_at: new Date(row.created_at),
        updated_at: new Date(row.updated_at)
    }));
}


export const findAll = async ():Promise<User[]>  => {
    const query: string = "SELECT * FROM Users;";
    const [rows]: any = await (await connection()).query(query);
    return mapRowsToUsers(rows);
}

export const findByPk = async (id: number): Promise<User[]> => {
    const query: string = "SELECT * FROM Users WHERE user_id = ?;";
    const [rows]: any = await (await connection()).query(query, [id]);
    return mapRowsToUsers(rows);
}

export const findUsername = async (username: string): Promise<User[]> => {
    const query: string = "SELECT * FROM Users WHERE username = ?;";
    const [rows] : any = await (await connection()).query(query, [username]);
    return mapRowsToUsers(rows);
}

export const findLikeUsername = async (username: string): Promise<User[]> => {
    const query: string = "SELECT * FROM Users WHERE username LIKE ?;";
    const [rows] : any = await (await connection()).query(query, [`%${username}%`]);
    return mapRowsToUsers(rows);
}

export const findEmail = async (email: string): Promise<User[]> => {
    const query: string = "SELECT * FROM Users WHERE email = ?;";
    const [rows]: any = await (await connection()).query(query, [email]);
    return mapRowsToUsers(rows);
}

export const findLikeEmail = async (email: string): Promise<User[]> => {
    const query: string = "SELECT * FROM Users WHERE email LIKE ?;";
    const [rows]: any = await (await connection()).query(query, [`%${email}%`]);
    return mapRowsToUsers(rows);
}
