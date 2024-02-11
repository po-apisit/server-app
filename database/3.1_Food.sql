CREATE TABLE IF NOT EXISTS TB_TYPE_FOOD
(
    id_type_food INT AUTO_INCREMENT PRIMARY KEY,
    id_owner INT,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (id_owner) REFERENCES TB_OWNER (id_owner)
);

CREATE TABLE IF NOT EXISTS TB_OWNER_FOOD
(
    id_owner_food INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    id_owner INT,
    id_type_food INT,
    post_picture VARCHAR(100) NOT NULL, -- รูปโพส
    post_picture_convert VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULl, -- ราคา
    cost DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    public BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_owner) REFERENCES TB_OWNER (id_owner),
    FOREIGN KEY (id_type_food) REFERENCES TB_TYPE_FOOD (id_type_food)
)

CREATE TABLE IF NOT EXISTS TB_TABLE
(
    id_table INT AUTO_INCREMENT PRIMARY KEY,
    id_owner INT,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    public BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (id_owner) REFERENCES TB_OWNER (id_owner)
);

CREATE TABLE IF NOT EXISTS TB_GROUP_TOUR_RESERVATION_FOOD
(
    id_user_reservation_food INT AUTO_INCREMENT PRIMARY KEY,
    running_reservation_food VARCHAR(50) NOT NULL,
    id_owner_food INT,
    id_group_tour_reservation_owner VARCHAR(50),
    qty INT DEFAULT 1,
    id_table INT NOT NULL DEFAULT 0,
    reservation_date DATE, -- วันที่จอง
    type ENUM("breakfast","lunch","dinner") DEFAULT "breakfast",
    status ENUM("pending","Reservation successful", "complete") DEFAULT "pending",
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    rating INT DEFAULT 1,
    comment VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_owner_food) REFERENCES TB_OWNER_FOOD (id_owner_food),
    FOREIGN KEY (id_group_tour_reservation_owner) REFERENCES TB_GROUP_TOUR_RESERVATION_OWNER (id_group_tour_reservation_owner),
    FOREIGN KEY (id_table) REFERENCES TB_TABLE (id_table)
);