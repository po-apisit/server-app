export interface Room {
    room_id: number;
    location_id: number;
    room_number: string;
    type: 'Standard' | 'Deluxe' | 'Suite';
    price: number;
    status: 'Available' | 'Occupied' | 'Out of Service';
    created_at: Date;
    updated_at: Date;
}