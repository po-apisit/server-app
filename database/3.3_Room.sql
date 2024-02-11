CREATE TABLE IF NOT EXISTS TB_TYPE_OWNER_ROOM
(
    id_type_owner_room INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
);

CREATE TABLE IF NOT EXISTS TB_OWNER_ROOM
(
    id_owner_room INT AUTO_INCREMENT PRIMARY KEY,
    id_room VARCHAR(30),
    id_owner INT,
    id_type_owner_room INT
    name VARCHAR(30) NOT NULL,
    description VARCHAR(255) NOT NULL,
    public BOOLEAN TRUE,
    price DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (id_owner) REFERENCES TB_OWNER (id_owner),
    FOREIGN KEY (id_type_owner_room) REFERENCES TB_TYPE_OWNER_ROOM (id_type_owner_room)
);

CREATE TABLE IF NOT EXISTS TB_OWNER_ROOM_IMAGE
(
    id_owner_room_image INT AUTO_INCREMENT PRIMARY KEY,
    id_owner_room INT,
    post_picture VARCHAR(100) NOT NULL, -- รูปโพส
    post_picture_convert VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (id_owner_room) REFERENCES TB_OWNER_ROOM (id_owner_room)
)

CREATE TABLE IF NOT EXISTS TB_GROUP_TOUR_RESERVATION_ROOM
(
    id_group_tour_reservation_room INT AUTO_INCREMENT PRIMARY KEY,
    id_group_tour_reservation_owner VARCHAR(50),
    id_owner_room INT,
    check_in_date DATE, -- วันที่เช็คอิน
    check_out_date DATE, -- วันที่เช็คเอาท์
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    rating INT DEFAULT 1,
    comment VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_owner_room) REFERENCES TB_OWNER_ROOM (id_owner_room),
    FOREIGN KEY (id_group_tour_reservation_owner) REFERENCES TB_GROUP_TOUR_RESERVATION_OWNER (id_group_tour_reservation_owner)
);