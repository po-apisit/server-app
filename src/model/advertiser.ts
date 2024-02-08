export interface Advertiser {
    advertiser_id: number;
    user_id: number;
    company_name: string;
    contact_email: string;
    phone_number?: string;
    website?: string;
    created_at: Date;
}