export interface PostUser {
    post_id: number;
    user_id: number;
    content: string;
    image_url?: string;
    created_at: Date;
    updated_at: Date;
}
