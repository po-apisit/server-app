export interface CommentUser {
    comment_id: number;
    post_id: number;
    user_id: number;
    content: string;
    created_at: Date;
}