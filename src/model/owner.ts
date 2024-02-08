export interface Owner {
    owner_id: number;
    username: string;
    email: string;
    password: string;
    phone?: string;
    profile_picture?: string;
    created_at: Date;
    updated_at: Date;
}
