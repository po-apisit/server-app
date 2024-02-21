CREATE TABLE IF NOT EXISTS TB_COMPANY(
    ID_COMPANY VARCHAR(50) PRIMARY KEY,
    ID_USER VARCHAR(50),
    COMPANY_NAME VARCHAR(255),
    EMAIL VARCHAR(100) NOT NULL,
    PHONE_NUMBER VARCHAR(20) NOT NULL,
    WEBPAGE VARCHAR(100) NOT NULL,
    ID_LINE VARCHAR(50) NOT NULL,
    IMAGE_PROFILE VARCHAR(50) NOT NULL,
    IMAGE_COVER VARCHAR(50) NOT NULL,
    STATUS_COMPANY ENUM("PENDING","NORMAL","VERIFY","PREMIER") DEFAULT "PENDING",
    STATUS ENUM("PUBLIC","PRIVATE") DEFAULT "PUBLIC",
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELETED_AT TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (ID_USER) REFERENCES TB_USER (ID_USER)
);


CREATE TABLE IF NOT EXISTS TB_COMPANY_ADDRESS(
    ID_COMPANY_ADDRESS INT AUTO_INCREMENT PRIMARY KEY,
    ID_COMPANY VARCHAR(50),
    ADDRESS_LINE VARCHAR(255),
    CITY VARCHAR(100),
    STATE VARCHAR(100),
    COUNTRY VARCHAR(100),
    POSTAL_CODE VARCHAR(20),
    STATUS ENUM("PUBLIC","PRIVATE") DEFAULT "PUBLIC",
    LATITUDE DECIMAL(10,5),
    LONGTITUDE DECIMAL(10,5),
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
    TYPE_UPLOAD ENUM("TEXT", "IMAGE", "VIDEO") DEFAULT "TEXT",
    TYPE_POST ENUM("NORMAL","PROMOTE") DEFAULT "NORMAL",
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELETED_AT TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (ID_COMPANY) REFERENCES TB_COMPANY (ID_COMPANY)
);

CREATE TABLE IF NOT EXISTS TB_COMPANY_LOCATION(
    ID_COMPANY_LOCATION INT AUTO_INCREMENT PRIMARY KEY,
    NAME_LOCATION VARCHAR(100) NOT NULL,

);