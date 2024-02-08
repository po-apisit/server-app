export interface Location {
    location_id: number;
    name: string;
    subdistrict?: string;
    district?: string;
    province?: string;
    postal_code?: string;
    logo_url?: string;
    status: 'Premium' | 'Verified' | 'Unverified';
    latitude: number;
    longitude: number;
    owner_id?: number; // ข้อมูลนี้ถูกต้องหรือไม่ขึ้นอยู่กับการใช้งานของแอปพลิเคชัน
}