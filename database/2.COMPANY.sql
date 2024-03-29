CREATE TABLE IF NOT EXISTS TB_COMPANY_ADDRESS(
    ID_COMPANY_ADDRESS INT AUTO_INCREMENT PRIMARY KEY,
    ID_COMPANY VARCHAR(50),
    ADDRESS_LINE VARCHAR(255),
    CITY VARCHAR(100),
    STATE VARCHAR(100),
    COUNTRY VARCHAR(100),
    POSTAL_CODE VARCHAR(20),
    STATUS ENUM("PUBLIC","PRIVATE") DEFAULT "PUBLIC",
    LATITUDE VARCHAR(50) NOT NULL,
    LONGTITUDE VARCHAR(50) NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELETED_AT TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (ID_COMPANY) REFERENCES TB_COMPANY (ID_COMPANY)
);

-- สร้างตาราง AMENITIES เพื่อเก็บข้อมูลสิ่งอำนวยความสะดวกในห้อง
CREATE TABLE TB_COMPANY_AMENITIES (
    ID_COMPANY_AMENITIES INT AUTO_INCREMENT PRIMARY KEY,
    ID_COMPANY VARCHAR(50),
    PARKING BOOLEAN, -- ที่จอดรถ
    FOOD BOOLEAN, -- ของกินครบครัน
    PEACEFUL BOOLEAN, -- สงบ
    CLEAN BOOLEAN, -- สะอาด
    CONVENIENT BOOLEAN, -- สะดวก
    SAFE BOOLEAN, -- ปลอดภัย
    FREE_INTERNET BOOLEAN, -- ฟรีอินเทอร์เน็ต
    PETS_ALLOWED BOOLEAN, -- อนุญาตให้เลี้ยงสัตว์
    SMOKING_ALLOWED BOOLEAN, -- อนุญาตให้สูบบุหรี่ในห้องพัก
    MOTORCYCLE_BICYCLE_PARKING BOOLEAN, -- ที่จอดรถมอเตอร์ไซด์/จักรยาน
    SWIMMING_POOL BOOLEAN, -- สระว่ายน้ำ
    GYM BOOLEAN, -- โรงยิม / ฟิตเนส
    WIFI_IN_ROOM BOOLEAN, -- อินเทอร์เน็ตไร้สาย (WIFI) ในห้อง
    KEYCARD_SECURITY BOOLEAN, -- มีระบบรักษาความปลอดภัย (keycard)
    FINGERPRINT_SECURITY BOOLEAN, -- มีระบบรักษาความปลอดภัย (สแกนลายนิ้วมือ)
    CCTV_SECURITY BOOLEAN, -- กล้องวงจรปิด (CCTV)
    FOOD_SHOP BOOLEAN, -- ร้านขายอาหาร
    CONVENIENCE_STORE BOOLEAN, -- ร้านค้า สะดวกซื้อ
    STATUS ENUM("PUBLIC","PRIVATE") DEFAULT "PUBLIC",
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELETED_AT TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (ID_COMPANY) REFERENCES TB_COMPANY (ID_COMPANY)
);

CREATE TABLE IF NOT EXISTS TB_COMPANY_PROVINCE(
    ID_COMPANY_PROVINCE INT AUTO_INCREMENT PRIMARY KEY,
    ID_TRAVEL INT,
    ID_COMPANY VARCHAR(50),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_TRAVEL) REFERENCES TB_TRAVEL (ID_TRAVEL),
    FOREIGN KEY (ID_COMPANY) REFERENCES TB_COMPANY (ID_COMPANY)
);

CREATE TABLE IF NOT EXISTS TB_COMPANY_POST(
    ID_COMPANY_POST INT AUTO_INCREMENT PRIMARY KEY,
    ID_COMPANY VARCHAR(50),
    ID_USER_POST VARCHAR(50),
    ID_USER_EDIT VARCHAR(50),
    TITLE VARCHAR(255) NOT NULL,
    IMAGE VARCHAR(50) NOT NULL,
    VIDEO VARCHAR(50) NOT NULL,
    IS_SHARE BOOLEAN DEFAULT TRUE,
    IS_COMMENT BOOLEAN DEFAULT TRUE,
    LINK_VIDEO VARCHAR(100) NOT NULL,
    TYPE_UPLOAD ENUM("TEXT", "IMAGE", "VIDEO", "LINK_VIDEO") DEFAULT "TEXT",
    TYPE_POST ENUM("NORMAL","PROMOTE") DEFAULT "NORMAL",
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELETED_AT TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (ID_COMPANY) REFERENCES TB_COMPANY (ID_COMPANY)
);


CREATE TABLE IF NOT EXISTS TB_COMPANY_SETTING_REFUND
(
    ID_COMPAY_SETTING_REFUND INT AUTO_INCREMENT PRIMARY KEY,
    ID_COMPANY VARCHAR(50),
    UINT DECIMAL(10,2),
    TYPE ENUM("BATH","PERSEN") DEFAULT "BATH",
    DESCRIPTION VARCHAR(255) NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELETED_AT TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (ID_COMPANY) REFERENCES TB_COMPANY (ID_COMPANY)
);