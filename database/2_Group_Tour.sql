CREATE TABLE IF NOT EXISTS TB_GROUP_TOURS
(
    id_group_tour INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100) NOT NULL,
    profile_picture VARCHAR(100) NOT NULL, -- รูปโปรไฟล์
    profile_picture_convert VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS TB_GROUP_TOURS_MEMBER
(
    id_grout_tour_member INT AUTO_INCREMENT PRIMARY KEY,
    id_group_tour INT,
    id_user VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (id_user) REFERENCES TB_USERS (id_user)
)