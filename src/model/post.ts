export interface Post {
    post_id: number;
    owner_id: number;
    content: string;
    image_url: string;
    created_at: Date;
    updated_at: Date;
    deleted_at?: Date | null;
}
