export interface User {
    user_id: number;
    username: string;
    email: string;
    password: string;
    phone?: string;
    date_of_birth?: Date;
    line_id?: string;
    profile_picture?: string;
    created_at: Date;
    updated_at: Date;
}