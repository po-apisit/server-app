export interface PackageOwner {
    package_id: number;
    package_name: string;
    description?: string;
    price: number;
    duration: number; // in days
    created_at: Date;
    advertiser_id: number;
}