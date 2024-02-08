import { connection } from '../connection/database-connection';
import { mappingarray } from '../installer/mappingmodel';
import { User } from '../model/user';

export const findAll = async ():Promise<User[]>  => {
    const query: string = "SELECT * FROM Users;";
    const [rows]: any = await (await connection()).query(query);
    return mappingarray<User>(rows);
}

export const findByPk = async (id: number): Promise<User[]> => {
    const query: string = "SELECT * FROM Users WHERE user_id = ?;";
    const [rows]: any = await (await connection()).query(query, [id]);
    return mappingarray<User>(rows);
}

export const findUsername = async (username: string): Promise<User[]> => {
    const query: string = "SELECT * FROM Users WHERE username = ?;";
    const [rows] : any = await (await connection()).query(query, [username]);
    return mappingarray<User>(rows);
}

export const findLikeUsername = async (username: string): Promise<User[]> => {
    const query: string = "SELECT * FROM Users WHERE username LIKE ?;";
    const [rows] : any = await (await connection()).query(query, [`%${username}%`]);
    return mappingarray<User>(rows);
}

export const findEmail = async (email: string): Promise<User[]> => {
    const query: string = "SELECT * FROM Users WHERE email = ?;";
    const [rows]: any = await (await connection()).query(query, [email]);
    return mappingarray<User>(rows);
}

export const findLikeEmail = async (email: string): Promise<User[]> => {
    const query: string = "SELECT * FROM Users WHERE email LIKE ?;";
    const [rows]: any = await (await connection()).query(query, [`%${email}%`]);
    return mappingarray<User>(rows);
}
