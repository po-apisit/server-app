export interface Menu {
    menu_id: number;
    name: string;
    description?: string;
    price: number;
    cost: number;
    image_url?: string;
    is_reservation_allowed: boolean;
    category_id?: number; // ข้อมูลนี้ถูกต้องหรือไม่ขึ้นอยู่กับการใช้งานของแอปพลิเคชัน
    location_id?: number; // ข้อมูลนี้ถูกต้องหรือไม่ขึ้นอยู่กับการใช้งานของแอปพลิเคชัน
}