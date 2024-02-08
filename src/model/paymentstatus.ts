export interface PaymentStatus {
    status_id: number;
    status_name: 'Pending' | 'Paid' | 'Completed';
    created_at: Date;
}