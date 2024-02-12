CREATE TABLE IF NOT EXISTS TB_GENDER
(
    id_gender INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);

CREATE TABLE IF NOT EXISTS TB_EMOJI
(
    id_emoji INT AUTO_INCREMENT PRIMARY KEY,
    name_emoji VARCHAR(30) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);

CREATE TABLE IF NOT EXISTS TB_USERS
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_user VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    description VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    profile_picture VARCHAR(100) NOT NULL, -- รูปโปรไฟล์
    profile_picture_convert VARCHAR(50) NOT NULL,
    profile_cover_picture VARCHAR(100) NOT NULL, -- รูปโปรไฟล์
    profile_cover_picture_convert VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);


CREATE TABLE IF NOT EXISTS TB_ROLE_USER_ADMIN
(
    id_role_user_admin INT AUTO_INCREMENT PRIMARY KEY,
    number INT NOT NULL,
    name VARCHAR(30),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);  

CREATE TABLE IF NOT EXISTS TB_USER_ADMIN
(
    id_user_admin INT AUTO_INCREMENT PRIMARY KEY,
    id_user VARCHAR(50),
    id_role_user_admin INT,
    description VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS TB_USER_ADDRESS
(
    id_user_address INT AUTO_INCREMENT PRIMARY KEY,
    id_user VARCHAR(50),
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL,
    public BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES TB_USERS(id_user)
);

CREATE TABLE IF NOT EXISTS TB_USER_DESCRIPTION
(
    id_user_description INT AUTO_INCREMENT PRIMARY KEY,
    id_user VARCHAR(50),
    phone VARCHAR(20),
    date_of_birth DATE,
    line_id VARCHAR(100) NOT NULL,
    id_gender INT,
    public BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_gender) REFERENCES TB_GENDER(id_gender),
    FOREIGN KEY (id_user) REFERENCES TB_USERS(id_user)
);

CREATE TABLE IF NOT EXISTS TB_USER_POST
(
    id_user_post INT AUTO_INCREMENT PRIMARY KEY,
    id_user VARCHAR(255),
    title VARCHAR(255) NOT NULL,
    post_picture VARCHAR(100) NOT NULL, -- รูปโพส
    post_picture_convert VARCHAR(500) NOT NULL,
    post_video VARCHAR(100) NOT NULL, -- วีดีโอโพส
    post_video_convert VARCHAR(500) NOT NULL,
       BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (id_user) REFERENCES TB_USERS(id_user)
);

CREATE TABLE IF NOT EXISTS TB_LIKE_USER_POST
(
    id_like_user_post INT AUTO_INCREMENT PRIMARY KEY,
    id_user_post INT, -- โพส
    id_user VARCHAR(255), -- คนไลค์โพส
    id_emoji INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (id_user_post) REFERENCES TB_USER_POST(id_user_post),
    FOREIGN KEY (id_user) REFERENCES TB_USERS(id_user),
    FOREIGN KEY (id_emoji) REFERENCES TB_EMOJI(id_emoji)
);

CREATE TABLE IF NOT EXISTS TB_COMMENT_USER_POST
(
    id_comment_user_post INT AUTO_INCREMENT PRIMARY KEY,
    id_user_post INT,
    id_user VARCHAR(255),
    comment VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (id_user_post) REFERENCES TB_USER_POST(id_user_post),
    FOREIGN KEY (id_user) REFERENCES TB_USERS(id_user)
);

CREATE TABLE IF NOT EXISTS TB_LIKE_COMMENT_USER_POST
(
    id_like_comment_user_post INT AUTO_INCREMENT PRIMARY KEY,
    id_comment_user_post INT, -- โพส
    id_user VARCHAR(255), -- คนไลค์โพส
    id_emoji INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (id_comment_user_post) REFERENCES TB_COMMENT_USER_POST(id_comment_user_post),
    FOREIGN KEY (id_user) REFERENCES TB_USERS(id_user),
    FOREIGN KEY (id_emoji) REFERENCES TB_EMOJI(id_emoji)
);


CREATE TABLE IF NOT EXISTS TB_USER_FOLLOWING
(
    id_user_following INT AUTO_INCREMENT PRIMARY KEY,
    id_user VARCHAR(50),
    id_following VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (id_user) REFERENCES TB_USERS(id_user),
    FOREIGN KEY (id_following) REFERENCES TB_USERS(id_user)
)

CREATE TABLE IF NOT EXISTS TB_USER_FOLLOWER
(
    id_user_follower INT AUTO_INCREMENT PRIMARY KEY,
    id_user VARCHAR(50),
    id_follower VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (id_user) REFERENCES TB_USERS(id_user),
    FOREIGN KEY (id_follower) REFERENCES TB_USERS(id_user)
)

CREATE TABLE IF NOT EXISTS TB_USER_VERIFY
(
    id_user_verify INT AUTO_INCREMENT PRIMARY KEY,
    id_user VARCHAR(50),
    status ENUM("normal","pending","verify") DEFAULT "normal",
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES TB_USERS(id_user)
);


-- หัวข้อ Report

CREATE TABLE IF NOT EXISTS TB_LIST_REPORT
(
    id_list_report INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
);

CREATE TABLE IF NOT EXISTS TB_USER_REPORT
(
    id_user_report INT AUTO_INCREMENT PRIMARY KEY,
    id_reported VARCHAR(50), --คน report
    id_reposter VARCHAR(50), --คนโดน report
    id_list_report INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (id_reported) REFERENCES TB_USERS(id_user),
    FOREIGN KEY (id_reposter) REFERENCES TB_USERS(id_user),
    FOREIGN KEY (id_list_report) REFERENCES TB_LIST_REPORT(id_list_report)
);

CREATE TABLE IF NOT EXISTS TB_USER_BLACKLIST
(
    id_user_blacklist INT AUTO_INCREMENT PRIMARY KEY,
    id_user_report INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL, -- เพิ่มคอลัมน์สำหรับเก็บวันที่ลบข้อมูล
    FOREIGN KEY (id_user_report) REFERENCES TB_USER_REPORT(id_user_report)
);