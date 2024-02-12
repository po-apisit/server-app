CREATE TABLE IF NOT EXISTS TB_TYPE_RENTAL
(
    id_type_rental INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล 
);

CREATE TABLE IF NOT EXISTS TB_OWNER_RENTAL
(
    id_owner_rental INT AUTO_INCREMENT PRIMARY KEY,
    id_owner INT,
    id_type_rental INT
    name VARCHAR(30) NOT NULL,
    description VARCHAR(255) NOT NULL,
    public BOOLEAN TRUE,
    stock INT DEFAULT 0,
    price DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (id_owner) REFERENCES TB_OWNER (id_owner),
    FOREIGN KEY (id_type_rental) REFERENCES TB_TYPE_RENTAL (id_type_rental)
);

CREATE TABLE IF NOT EXISTS TB_OWNER_RENTAL_IMAGE
(
    id_owner_rental_image INT AUTO_INCREMENT PRIMARY KEY,
    id_owner_rental INT,
    post_picture VARCHAR(100) NOT NULL, -- รูปโพส
    post_picture_convert VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (id_owner_rental) REFERENCES TB_OWNER_RENTAL (id_owner_rental)
);

CREATE TABLE IF NOT EXISTS TB_GROUP_TOUR_RESERVATION_RENTAL
(
    id_group_tour_reservation_room INT AUTO_INCREMENT PRIMARY KEY,
    id_group_tour_reservation_owner VARCHAR(50),
    id_owner_rental INT,
    qty INT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    rating INT DEFAULT 1,
    comment VARCHAR(255) NOT NULL,
    payment ENUM("pending","approved", "received","complete") DEFAULT "pending",
    FOREIGN KEY (id_group_tour_reservation_owner) REFERENCES TB_GROUP_TOUR_RESERVATION_OWNER (id_group_tour_reservation_owner),
    FOREIGN KEY (id_owner_rental) REFERENCES TB_OWNER_RENTAL (id_owner_rental)
);