CREATE TABLE IF NOT EXISTS TB_OWNER_LOCATION
(
    id_owner_location INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255) NOT NULL,
    post_picture VARCHAR(100) NOT NULL, -- รูปโพส
    post_picture_convert VARCHAR(50) NOT NULL,
    public BOOLEAN DEFAULT TRUE,
    price DECIMAL(10,2) DEFAULT 0.00,
    cost DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS TB_GROUP_TOUR_RESERVATION_LOCATION
(
    id_group_tour_reservation_location INT AUTO_INCREMENT PRIMARY KEY,
    running_reservation_location VARCHAR(50) NOT NULL,
    id_owner_location INT,
    id_group_tour_reservation_owner VARCHAR(50),
    price DECIMAL(10, 2) DEFAULT 0.00,
    reservation_date DATE, -- วันที่จอง
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
     rating INT DEFAULT 1,
    comment VARCHAR(255) NOT NULL,
    status ENUM("pending","Reservation successful", "complete") DEFAULT "pending",
    FOREIGN KEY (id_owner_location) REFERENCES TB_OWNER_LOCATION (id_owner_location),
    FOREIGN KEY (id_group_tour_reservation_owner) REFERENCES TB_GROUP_TOUR_RESERVATION_OWNER (id_group_tour_reservation_owner)
);