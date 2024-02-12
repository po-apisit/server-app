
CREATE TABLE IF NOT EXISTS TB_TYPE_COMPANY
(
    id_type_company INT AUTO_INCREMENT PRIMARY KEY,
    name_company VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);



CREATE TABLE IF NOT EXISTS TB_OWNER
(
    id_owner INT AUTO_INCREMENT PRIMARY KEY,
    id_user VARCHAR(50),
    company_name VARCHAR(255) NOT NULL, -- ชื่อบริษัท
    id_type_company INT,
    phone_number VARCHAR(20), -- เบอร์โทรศัพท์
    email VARCHAR(100), -- อีเมล์
    website VARCHAR(255), -- เว็บไซต์
    founded_date DATE, -- วันที่ก่อตั้ง
    registration_date DATE, -- วันที่ลงทะเบียน
    business_license_number VARCHAR(50), -- เลขที่ใบอนุญาตธุรกิจ
    vat_number VARCHAR(50), -- เลขประจำตัวผู้เสียภาษี
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- วันที่เพิ่มข้อมูล
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- วันที่ปรับปรุงข้อมูล
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (id_user) REFERENCES TB_USERS(id_user),
    FOREIGN KEY (id_type_company) REFERENCES TB_TYPE_COMPANY(id_type_company)
);

CREATE TABLE IF NOT EXISTS TB_OWNER_STATUS
(
    id_status_owner INT AUTO_INCREMENT PRIMARY KEY,
    id_owner INT,
    status ENUM("Unverified Account","Verified Account","Premium Account") DEFAULT "Unverified Account",
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (id_owner) REFERENCES TB_OWNER(id_owner)
);



CREATE TABLE IF NOT EXISTS TB_OWNER_ADMIN
(
    id_owner_admin INT AUTO_INCREMENT PRIMARY KEY,
    id_owner INT,
    id_user VARCHAR(50),
    description VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (id_user) REFERENCES TB_USERS(id_user),
    FOREIGN KEY (id_owner) REFERENCES TB_OWNER(id_owner)
);

CREATE TABLE IF NOT EXISTS TB_ROLE_OWNER_ADMIN
(
    id_role_user_admin INT AUTO_INCREMENT PRIMARY KEY,
    id_owner_admin INT,
    role ENUM("post","food","location","room","equipment rental"),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (id_owner_admin) REFERENCES TB_OWNER_ADMIN (id_owner_admin)
)

CREATE TABLE IF NOT EXISTS TB_OWNER_ADDRESS
(
    id_owner_address INT AUTO_INCREMENT PRIMARY KEY,
    id_owner INT,
    street_address VARCHAR(255) NOT NULL, -- ที่อยู่
    country VARCHAR(100) NOT NULL, -- ประเทศ
    postal_code VARCHAR(10), -- รหัสไปรษณีย์
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_owner) REFERENCES TB_OWNER (id_owner)
);

CREATE TABLE IF NOT EXISTS TB_OWNER_POST
(
    id_owner_post INT AUTO_INCREMENT PRIMARY KEY,
    id_owner INT,
    id_user VARCHAR(50),
    title VARCHAR(255) NOT NULL,
    post_picture VARCHAR(100) NOT NULL, -- รูปโพส
    post_picture_convert VARCHAR(50) NOT NULL,
    post_video VARCHAR(100) NOT NULL, -- วีดีโอโพส
    post_video_convert VARCHAR(50) NOT NULL,
    public BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (id_owner) REFERENCES TB_OWNER(id_owner),
    FOREIGN KEY (id_user) REFERENCES TB_USERS(id_user)
);

CREATE TABLE IF NOT EXISTS TB_LIKE_OWNER_POST
(
    id_like_owner_opost INT AUTO_INCREMENT PRIMARY KEY,
    id_owner_post INT,
    id_user VARCHAR(50),
    id_emoji INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (id_owner_post) REFERENCES TB_OWNER_POST (id_owner_post),
    FOREIGN KEY (id_user) REFERENCES TB_USERS (id_user),
    FOREIGN KEY (id_emoji) REFERENCES TB_EMOJI (id_emoji)
);

CREATE TABLE IF NOT EXISTS TB_COMMENT_OWNER_POST
(
    id_comment_owner_post INT AUTO_INCREMENT PRIMARY KEY,
    id_owner_post INT,
    id_user VARCHAR(50),
    comment VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (id_owner_post) REFERENCES TB_OWNER_POST (id_owner_post)
);

CREATE TABLE IF NOT EXISTS TB_LIKE_COMMENT_OWNER_POST
(
    id_like_comment_owner_post INT AUTO_INCREMENT PRIMARY KEY,
    id_comment_owner_post INT,
    id_user VARCHAR(50),
    id_emoji INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (id_user) REFERENCES TB_USERS (id_user),
    FOREIGN KEY (id_emoji) REFERENCES TB_EMOJI (id_emoji),
    FOREIGN KEY (id_comment_owner_post) REFERENCES TB_COMMENT_OWNER_POST (id_comment_owner_post)
);



-- Promotion
CREATE TABLE IF NOT EXISTS TB_OWNER_PROMOTION_MANAGE
(
    id_owner_promotion INT AUTO_INCREMENT PRIMARY KEY,
    id_payment VARCHAR(50),
    id_owner INT,
    start_date DATE,
    end_date DATE,
    price INT,
    post_picture VARCHAR(100) NOT NULL, -- รูปโพส
    post_picture_convert VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
);