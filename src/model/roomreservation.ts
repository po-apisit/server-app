export interface RoomReservation {
    reservation_id: number;
    room_id: number;
    user_id: number;
    reservation_date: Date;
    check_in_date: Date;
    check_out_date: Date;
    rating?: number;
    comment: string;
    status: 'Pending' | 'Approved' | 'Cancelled' | 'Completed';
}