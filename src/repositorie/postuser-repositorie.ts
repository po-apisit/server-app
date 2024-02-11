import { connection } from '../connection/database-connection';
import { mappingarray } from '../installer/mappingmodel';
import { PostUser } from '../model/postuser';


export const nonauthen_findrandom = async ():Promise<PostUser[]> => {
    try {
        const query: string = "SELECT * FROM PostsUsers WHERE deleted_at IS NULL ORDER BY created_at DESC LIMIT 50;";
        const [rows]: any = await (await connection()).query(query);
        return mappingarray<PostUser>(rows);
    } catch (error) {
        console.error('Error finding users by findAll:', error);
        throw error; // ส่ง error ออกไปถ้าเกิดข้อผิดพลาด
    }
}