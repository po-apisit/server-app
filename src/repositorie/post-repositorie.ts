import { connection } from '../connection/database-connection';
import { mappingarray } from '../installer/mappingmodel';
import { Post } from '../model/post';
import { PostResponse } from '../model/post-response';



export const nonauthen_findrandom = async ():Promise<Post[]> => {
    try {
        const _postResponses:PostResponse[] = [];
        const query: string = "SELECT * FROM Posts WHERE deleted_at IS NULL ORDER BY created_at DESC LIMIT 50;";
        const [rows]: any = await (await connection()).query(query);
        const _post:Post[] = mappingarray<Post>(rows);
        
        _post.map(row => {
            const _postResponse:PostResponse = {};
            const _query: string = "SELECT COUNT(id)[countlike] FROM LikesUsers";
        })


        return _post;
    } catch (error) {
        console.error('Error finding users by findAll:', error);
        throw error; // ส่ง error ออกไปถ้าเกิดข้อผิดพลาด
    }
}