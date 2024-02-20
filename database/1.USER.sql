-- USER
CREATE TABLE IF NOT EXISTS TB_USER(
    ID_USER VARCHAR(50)  PRIMARY KEY,
    FIRST_NAME VARCHAR(50) NOT NULL,
    LAST_NAME VARCHAR(50) NOT NULL,
    IMAGE VARCHAR(100) NOT NULL,
    USERNAME VARCHAR(30) NOT NULL,
    PASSWORD VARCHAR(60) NOT NULL,
    PHONE VARCHAR(15) NOT NULL,
    EMAIL VARCHAR(80) NOT NULL,
    ID_EMAIL VARCHAR(100) NOT NULL,
    ID_FACEBOOK VARCHAR(100) NOT NULL,
    ID_GITHUB VARCHAR(100) NOT NULL,
    ID_IG VARCHAR(100) NOT NULL,
    ID_LINE VARCHAR(100) NOT NULL,
    ID_LINE_NAME VARCHAR(100) NOT NULL,
    LOGIN_BY ENUM("SYSTEM", "GMAIL", "FACEBOOK", "GITHUB", "IG", "LINE") DEFAULT "SYSTEM",
    STATUE ENUM("PUBLIC", "PRIVATE") DEFAULT "PUBLIC",
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELETED_AT TIMESTAMP DEFAULT NULL -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
);

CREATE TABLE IF NOT EXISTS TB_USER_POST(
    ID_USER_POST INT AUTO_INCREMENT PRIMARY KEY,
    ID_USER VARCHAR(50),
    TITLE VARCHAR(255) NOT NULL,
    IMAGE VARCHAR(50) NOT NULL,
    VIDEO VARCHAR(50) NOT NULL,
    TYPE_UPLOAD ENUM("TEXT", "IMAGE", "VIDEO") DEFAULT "TEXT",
    TYPE_POST ENUM("NORMAL","SHARE") DEFAULT "NORMAL",
    REFERENCES_ID_USER_POST INT DEFAULT 0,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELETED_AT TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (ID_USER) REFERENCES TB_USER(ID_USER)
);

 -- กด หัวใจให้ post
CREATE TABLE IF NOT EXISTS TB_USER_LIKE_POST(
    ID_USER_LIKE_POST INT AUTO_INCREMENT PRIMARY KEY,
    ID_USER_POST INT,
    ID_USER_TO VARCHAR(50),
    ID_USER_REPLY VARCHAR(50),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_USER_TO) REFERENCES TB_USER(ID_USER),
    FOREIGN KEY (ID_USER_REPLY) REFERENCES TB_USER(ID_USER),
    FOREIGN KEY (ID_USER_POST) REFERENCES TB_USER_POST(ID_USER_POST)
);

 -- กด ติดตามใน post
CREATE TABLE IF NOT EXISTS TB_USER_FAVORITE_POST(
    ID_USER_FAVORITE_POST INT AUTO_INCREMENT PRIMARY KEY,
    ID_USER_POST INT,
    ID_USER VARCHAR(50),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_USER) REFERENCES TB_USER(ID_USER),
    FOREIGN KEY (ID_USER_POST) REFERENCES TB_USER_POST(ID_USER_POST)
);

CREATE TABLE IF NOT EXISTS TB_USER_COMMENT_POST(
    ID_USER_COMMENT_POST INT AUTO_INCREMENT PRIMARY KEY,
    ID_USER_POST INT,
    ID_USER_TO VARCHAR(50),
    ID_USER_REPLY VARCHAR(50),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_USER_TO) REFERENCES TB_USER(ID_USER),
    FOREIGN KEY (ID_USER_REPLY) REFERENCES TB_USER(ID_USER),
    FOREIGN KEY (ID_USER_POST) REFERENCES TB_USER_POST(ID_USER_POST)
);

CREATE TABLE IF NOT EXISTS TB_TYPE_USER_BLACKLIST(
    ID_TYPE_USER_BLACKLIST INT AUTO_INCREMENT PRIMARY KEY,
    TITLE VARCHAR(100) NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELETED_AT TIMESTAMP DEFAULT NULL -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
);

CREATE TABLE IF NOT EXISTS TB_USER_BLACKLIST(
    ID_USER_BLACKLIST INT AUTO_INCREMENT PRIMARY KEY,
    ID_USER_REPORTING VARCHAR(50),
    ID_USER_REPORTER VARCHAR(50),
    ID_TYPE_USER_BLACKLIST INT,
    STATUS_BLACKLIST ENUM("PENDING", "REJECT","BLOCK")DEFAULT "PENDING",
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELETED_AT TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (ID_USER_REPORTING) REFERENCES TB_USER (ID_USER), 
    FOREIGN KEY (ID_USER_REPORTER) REFERENCES TB_USER (ID_USER), 
    FOREIGN KEY (ID_TYPE_USER_BLACKLIST) REFERENCES TB_TYPE_USER_BLACKLIST (ID_TYPE_USER_BLACKLIST)
);

CREATE TABLE IF NOT EXISTS TB_TYPE_USER_POST_BLACKLIST(
    ID_TYPE_USER_POST_BLACKLIST INT AUTO_INCREMENT PRIMARY KEY,
    TITLE VARCHAR(100) NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELETED_AT TIMESTAMP DEFAULT NULL -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
);

CREATE TABLE IF NOT EXISTS TB_USER_POST_BLACKLIST(
    ID_USER_BLACKLIST INT AUTO_INCREMENT PRIMARY KEY,
    ID_USER_POST INT,
    ID_USER_REPORTER VARCHAR(50),
    ID_TYPE_USER_POST_BLACKLIST INT,
    STATUS_BLACKLIST ENUM("PENDING", "REJECT","APPROVE")DEFAULT "PENDING",
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELETED_AT TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (ID_USER_POST) REFERENCES TB_USER_POST (ID_USER_POST),
    FOREIGN KEY (ID_USER_REPORTER) REFERENCES TB_USER (ID_USER), 
    FOREIGN KEY (ID_TYPE_USER_POST_BLACKLIST) REFERENCES TB_TYPE_USER_POST_BLACKLIST (ID_TYPE_USER_POST_BLACKLIST)
);


CREATE TABLE IF NOT EXISTS TB_USER_GROUP_CAMPING_HOST(
    ID_USER_GROUP_CAMPING_HOST VARCHAR(50) PRIMARY KEY,
    ID_USER VARCHAR(50),
    TITLE VARCHAR(100) NOT NULL,
    DESCRIPTION VARCHAR(255) NOT NULL,
    IMAGE VARCHAR(50) NOT NULL,
    STATUE ENUM("PRIVATE","PUBLIC") DEFAULT "PRIVATE",
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELETED_AT TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (ID_USER) REFERENCES TB_USER (ID_USER)
);

CREATE TABLE IF NOT EXISTS TB_USER_GROUP_CAMPING_MEMBER(
    ID_USER_GROUP_CAMPING_MEMBER INT AUTO_INCREMENT PRIMARY KEY,
    ID_USER_GROUP_CAMPING_HOST VARCHAR(50),
    ID_USER VARCHAR(50),
    ID_USER_INVITE VARCHAR(50),
    INVITE_BY ENUM("HOST","ADMIN","MEMBER","ME") DEFAULT "HOST" ,
    STATUS ENUM("PENDING","REJECT","APPROVE") DEFAULT "PENDING",
    AUTHORIZATION ENUM("MEMBER", "ADMIN") DEFAULT "MEMBER",
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELETED_AT TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (ID_USER) REFERENCES TB_USER (ID_USER),
    FOREIGN KEY (ID_USER_INVITE) REFERENCES TB_USER (ID_USER)
);

CREATE TABLE IF NOT EXISTS TB_TRAVEL(
    ID_TRAVEL INT AUTO_INCREMENT PRIMARY KEY,
    TITLE VARCHAR(100) NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELETED_AT TIMESTAMP DEFAULT NULL -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
);

CREATE TABLE IF NOT EXISTS TB_USER_TRAVEL(
    ID_USER_TRAVEL INT AUTO_INCREMENT PRIMARY KEY,
    ID_TRAVEL INT,
    ID_USER VARCHAR(50),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_TRAVEL) REFERENCES TB_TRAVEL (ID_TRAVEL),
    FOREIGN KEY (ID_USER) REFERENCES TB_USER (ID_USER)
);

CREATE TABLE IF NOT EXISTS TB_PROVINCE(
    ID_PROVINCE INT AUTO_INCREMENT PRIMARY KEY,
    NAME_TH VARCHAR(100) NOT NULL,
    NAME_EN VARCHAR(100) NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELETED_AT TIMESTAMP DEFAULT NULL -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
);

CREATE TABLE IF NOT EXISTS TB_USER_PROVINCE(
    ID_USER_PROVINCE INT AUTO_INCREMENT PRIMARY KEY,
    ID_PROVINCE INT,
    ID_USER VARCHAR(50),
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_PROVINCE) REFERENCES TB_PROVINCE (ID_PROVINCE),
    FOREIGN KEY (ID_USER) REFERENCES TB_USER (ID_USER)
);