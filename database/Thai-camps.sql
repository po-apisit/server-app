-- สร้างตาราง Owners (เจ้าของห้องพัก)
CREATE TABLE IF NOT EXISTS Owners (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    profile_picture VARCHAR(255), -- รูปภาพโปรไฟล์ของเจ้าของห้อง
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- สร้างตาราง Locations (สถานที่)
CREATE TABLE IF NOT EXISTS Locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL, -- ชื่อสถานที่
    subdistrict VARCHAR(100), -- ตำบล
    district VARCHAR(100), -- อำเภอ
    province VARCHAR(100), -- จังหวัด
    postal_code VARCHAR(10), -- รหัสไปรษณีย์
    logo_url VARCHAR(255), -- URL ของโลโก้
    status ENUM('Premium', 'Verified', 'Unverified'), -- สถานะ
    latitude DECIMAL(10, 8), -- ละติจูด
    longitude DECIMAL(11, 8), -- ลองจิจูด
    owner_id INT, -- รหัสเจ้าของกิจการ
    FOREIGN KEY (owner_id) REFERENCES Owners(owner_id) -- เชื่อมโยงกับตาราง Owners
);

-- สร้างตาราง MenuCategories (ประเภทของเมนู)
CREATE TABLE IF NOT EXISTS MenuCategories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

-- สร้างตาราง Menus (เมนู)
CREATE TABLE IF NOT EXISTS Menus (
    menu_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL, -- ชื่อเมนู
    description TEXT, -- รายละเอียด
    price DECIMAL(10, 2), -- ราคา
    cost INT, -- ต้นทุน
    image_url VARCHAR(255), -- URL รูปภาพ
    is_reservation_allowed BOOLEAN DEFAULT FALSE, -- อนุญาตให้จองหรือไม่
    category_id INT, -- รหัสประเภทของเมนู
    FOREIGN KEY (category_id) REFERENCES MenuCategories(category_id),
    location_id INT, -- รหัสสถานที่ที่เมนูนี้เป็นไปได้
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

-- สร้างตาราง Users (ผู้ใช้)
CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    date_of_birth DATE,
    line_id VARCHAR(100),
    profile_picture VARCHAR(255), -- รูปโปรไฟล์
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- สร้างตาราง Locations_Users (ผู้ดูแลสถานที่)
CREATE TABLE IF NOT EXISTS Locations_Users (
    location_user_id INT,
    user_id INT,
    PRIMARY KEY (location_user_id, user_id),
    FOREIGN KEY (location_user_id) REFERENCES Locations(location_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


-- สร้างตาราง PostsUsers (โพสต์ของผู้ใช้)
CREATE TABLE IF NOT EXISTS PostsUsers (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT, -- รหัสผู้ใช้ที่โพสต์
    content TEXT, -- เนื้อหาโพสต์
    image_url VARCHAR(255), -- URL รูปภาพ
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- สร้างตาราง CommentsUsers (ความคิดเห็นของผู้ใช้)
CREATE TABLE IF NOT EXISTS CommentsUsers (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT, -- รหัสโพสต์
    user_id INT, -- รหัสผู้ใช้ที่แสดงความคิดเห็น
    content TEXT, -- เนื้อหาความคิดเห็น
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES PostsUsers(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- สร้างตาราง LikesUsers (ไลค์ของผู้ใช้)
CREATE TABLE IF NOT EXISTS LikesUsers (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT, -- รหัสโพสต์
    user_id INT, -- รหัสผู้ใช้ที่กดไลค์
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES PostsUsers(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- สร้างตาราง Rooms (ห้องพัก)
CREATE TABLE IF NOT EXISTS Rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    location_id INT, -- รหัสสถานที่
    room_number VARCHAR(50) NOT NULL, -- เลขที่ห้อง
    type ENUM('Standard', 'Deluxe', 'Suite') NOT NULL, -- ประเภทห้อง
    price DECIMAL(10, 2) NOT NULL, -- ราคา
    status ENUM('Available', 'Occupied', 'Out of Service') DEFAULT 'Available', -- สถานะ
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (location_id) REFERENCES Locations(location_id) -- เชื่อมโยงกับตาราง Locations
);

-- สร้างตาราง RoomReservations (การจองห้อง)
CREATE TABLE IF NOT EXISTS RoomReservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    room_id INT, -- รหัสห้อง
    user_id INT, -- รหัสผู้ใช้ที่จอง
    reservation_date DATE, -- วันที่จอง
    check_in_date DATE, -- วันที่เช็คอิน
    check_out_date DATE, -- วันที่เช็คเอาท์
    rating int,
    comment VARCHAR(100) NOT NULL,
    status ENUM('Pending', 'Approved', 'Cancelled', 'Completed') DEFAULT 'Pending', -- สถานะการจองห้อง
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- สร้างตาราง FoodReservations (การจองอาหาร)
CREATE TABLE IF NOT EXISTS FoodReservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    menu_id INT, -- รหัสเมนู
    user_id INT, -- รหัสผู้ใช้ที่จอง
    reservation_date DATE, -- วันที่จอง
    reservation_time TIME, -- เวลาที่จอง
    quantity INT DEFAULT 1, -- จำนวนเมนูที่จอง
    rating int,
    comment VARCHAR(100) NOT NULL,
    status ENUM('Pending', 'Approved', 'Cancelled', 'Completed') DEFAULT 'Pending', -- สถานะการจองอาหาร
    FOREIGN KEY (menu_id) REFERENCES Menus(menu_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- สร้างตาราง Posts เพื่อให้ Owners สามารถโพสต์ได้
CREATE TABLE IF NOT EXISTS Posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT, -- รหัสเจ้าของกิจการ
    content TEXT, -- เนื้อหาโพสต์
    image_url VARCHAR(255), -- URL รูปภาพ
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES Owners(owner_id)
);

-- สร้างตาราง Comments เพื่อให้ผู้ใช้สามารถแสดงความคิดเห็นในโพสต์ได้
CREATE TABLE IF NOT EXISTS Comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT, -- รหัสโพสต์
    user_id INT, -- รหัสผู้ใช้ที่แสดงความคิดเห็น
    content TEXT, -- เนื้อหาความคิดเห็น
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- สร้างตาราง Likes เพื่อให้ผู้ใช้สามารถกดไลค์โพสต์ได้
CREATE TABLE IF NOT EXISTS Likes (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT, -- รหัสโพสต์
    user_id INT, -- รหัสผู้ใช้ที่กดไลค์
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- สร้างตาราง Follows (การติดตาม)
CREATE TABLE IF NOT EXISTS Follows (
    follow_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT, -- รหัสผู้ใช้
    location_id INT, -- รหัสสถานที่
    follow_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- วันที่เริ่มติดตาม
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);


-- สร้างตาราง Advertisers (ผู้โฆษณา)
CREATE TABLE IF NOT EXISTS Advertisers (
    advertiser_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT, -- รหัสผู้ใช้ที่เป็นผู้โฆษณา
    company_name VARCHAR(255) NOT NULL, -- ชื่อบริษัท
    contact_email VARCHAR(255) NOT NULL, -- อีเมล์ติดต่อ
    phone_number VARCHAR(20), -- เบอร์โทรศัพท์
    website VARCHAR(255), -- เว็บไซต์
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- วันที่สร้างบัญชี
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);



-- สร้างตาราง PackagesAdvertisers (แพ็คเกจโฆษณา)
CREATE TABLE IF NOT EXISTS PackagesAdvertisers (
    package_id INT AUTO_INCREMENT PRIMARY KEY,
    package_name VARCHAR(255) NOT NULL, -- ชื่อแพ็คเกจ
    description TEXT, -- คำอธิบายแพ็คเกจ
    price DECIMAL(10, 2) NOT NULL, -- ราคา
    duration INT NOT NULL, -- ระยะเวลา (เช่น 30 วัน)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- วันที่สร้างแพ็คเกจ
    advertiser_id INT, -- รหัสผู้โฆษณา
    FOREIGN KEY (advertiser_id) REFERENCES Advertisers(advertiser_id)
);

-- สร้างตาราง PackagesOwners (แพ็คเกจโฆษณา)
CREATE TABLE IF NOT EXISTS PackagesOwners (
    package_id INT AUTO_INCREMENT PRIMARY KEY,
    package_name VARCHAR(255) NOT NULL, -- ชื่อแพ็คเกจ
    description TEXT, -- คำอธิบายแพ็คเกจ
    price DECIMAL(10, 2) NOT NULL, -- ราคา
    duration INT NOT NULL, -- ระยะเวลา (เช่น 30 วัน)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- วันที่สร้างแพ็คเกจ
    advertiser_id INT, -- รหัสผู้โฆษณา
    FOREIGN KEY (advertiser_id) REFERENCES Advertisers(advertiser_id)
);

-- สร้างตาราง AdvertisingRelations (ความสัมพันธ์การโฆษณา)
CREATE TABLE IF NOT EXISTS AdvertisingRelations (
    relation_id INT AUTO_INCREMENT PRIMARY KEY,
    package_id INT, -- รหัสแพ็คเกจ
    advertiser_id INT, -- รหัสผู้โฆษณา
    FOREIGN KEY (package_id) REFERENCES PackagesAdvertisers(package_id),
    FOREIGN KEY (advertiser_id) REFERENCES Advertisers(advertiser_id)
);

-- สร้างตาราง OwnersRelations (ความสัมพันธ์การโฆษณา)
CREATE TABLE IF NOT EXISTS OwnersRelations (
    relation_id INT AUTO_INCREMENT PRIMARY KEY,
    package_id INT, -- รหัสแพ็คเกจ
    advertiser_id INT, -- รหัสผู้โฆษณา
    FOREIGN KEY (package_id) REFERENCES PackagesOwners(package_id),
    FOREIGN KEY (advertiser_id) REFERENCES Advertisers(advertiser_id)
);

-- AdvertisingRelations และ OwnersRelations
-- สร้างตาราง PaymentStatus (สถานะการชำระเงิน)
CREATE TABLE IF NOT EXISTS PaymentStatus (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- วันที่ชำระ
    status ENUM('Pending', 'Paid', 'Completed') DEFAULT 'Pending' -- สถานะการชำระเงิน
);