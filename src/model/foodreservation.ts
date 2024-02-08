export interface FoodReservation {
    reservation_id: number;
    menu_id: number;
    user_id: number;
    reservation_date: Date;
    reservation_time: Date;
    quantity: number;
    rating?: number;
    comment: string;
    status: 'Pending' | 'Approved' | 'Cancelled' | 'Completed';
}