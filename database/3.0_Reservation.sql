CREATE TABLE IF NOT EXISTS TB_GROUP_TOUR_RESERVATION_OWNER
(
    id_group_tour_reservation_owner VARCHAR(50),
    id_payment VARCHAR(100),
    id_owner INT,
    id_group_tour INT,
    reservation_date DATE,
    status ENUM("pending","approve","success") DEFAULT "pending",
    check_in_date DATE, -- วันที่เช็คอิน
    check_out_date DATE, -- วันที่เช็คเอาท์
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
);