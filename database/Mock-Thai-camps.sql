-- แทรกข้อมูลลงในตาราง Owners
INSERT INTO Owners (username, email, password, phone, profile_picture) VALUES
('john_doe', 'john@example.com', 'password123', '1234567890', 'profile1.jpg'),
('jane_smith', 'jane@example.com', 'pass456', '0987654321', 'profile2.jpg'),
('owner3', 'owner3@example.com', 'pass789', '1122334455', 'profile3.jpg'),
('owner4', 'owner4@example.com', 'passabc', '5544332211', 'profile4.jpg'),
('owner5', 'owner5@example.com', 'passxyz', '9988776655', 'profile5.jpg'),
('owner6', 'owner6@example.com', 'passtuv', '3344556677', 'profile6.jpg'),
('owner7', 'owner7@example.com', 'pass123', '8877665544', 'profile7.jpg'),
('owner8', 'owner8@example.com', 'pass456', '2233445566', 'profile8.jpg'),
('owner9', 'owner9@example.com', 'pass789', '7788990011', 'profile9.jpg'),
('owner10', 'owner10@example.com', 'pass111', '5544332211', 'profile10.jpg');

-- แทรกข้อมูลลงในตาราง Locations
INSERT INTO Locations (name, subdistrict, district, province, postal_code, logo_url, status, latitude, longitude, owner_id) VALUES
('Location 1', 'Subdistrict 1', 'District 1', 'Province 1', '10000', 'logo1.jpg', 'Premium', 13.7563, 100.5018, 1),
('Location 2', 'Subdistrict 2', 'District 2', 'Province 2', '20000', 'logo2.jpg', 'Verified', 13.7388, 100.5302, 2),
('Location 3', 'Subdistrict 3', 'District 3', 'Province 3', '30000', 'logo3.jpg', 'Unverified', 13.7246, 100.3522, 3),
('Location 4', 'Subdistrict 4', 'District 4', 'Province 4', '40000', 'logo4.jpg', 'Premium', 13.7209, 100.5266, 4),
('Location 5', 'Subdistrict 5', 'District 5', 'Province 5', '50000', 'logo5.jpg', 'Verified', 13.6888, 100.7501, 5),
('Location 6', 'Subdistrict 6', 'District 6', 'Province 6', '60000', 'logo6.jpg', 'Unverified', 13.7563, 100.5018, 6),
('Location 7', 'Subdistrict 7', 'District 7', 'Province 7', '70000', 'logo7.jpg', 'Premium', 13.7563, 100.5018, 7),
('Location 8', 'Subdistrict 8', 'District 8', 'Province 8', '80000', 'logo8.jpg', 'Verified', 13.7563, 100.5018, 8),
('Location 9', 'Subdistrict 9', 'District 9', 'Province 9', '90000', 'logo9.jpg', 'Unverified', 13.7563, 100.5018, 9),
('Location 10', 'Subdistrict 10', 'District 10', 'Province 10', '10000', 'logo10.jpg', 'Premium', 13.7563, 100.5018, 10);

-- แทรกข้อมูลลงในตาราง MenuCategories
INSERT INTO MenuCategories (name, location_id) VALUES
('Category 1', 1),
('Category 2', 2),
('Category 3', 3),
('Category 4', 4),
('Category 5', 5),
('Category 6', 6),
('Category 7', 7),
('Category 8', 8),
('Category 9', 9),
('Category 10', 10);

-- แทรกข้อมูลลงในตาราง Menus
INSERT INTO Menus (name, description, price, cost, image_url, is_reservation_allowed, category_id, location_id) VALUES
('Menu 1', 'Description 1', 100.50, 50, 'menu1.jpg', TRUE, 1, 1),
('Menu 2', 'Description 2', 120.75, 60, 'menu2.jpg', FALSE, 2, 2),
('Menu 3', 'Description 3', 80.25, 40, 'menu3.jpg', TRUE, 3, 3),
('Menu 4', 'Description 4', 150.00, 75, 'menu4.jpg', FALSE, 4, 4),
('Menu 5', 'Description 5', 200.00, 100, 'menu5.jpg', TRUE, 5, 5),
('Menu 6', 'Description 6', 90.75, 45, 'menu6.jpg', FALSE, 6, 6),
('Menu 7', 'Description 7', 110.25, 55, 'menu7.jpg', TRUE, 7, 7),
('Menu 8', 'Description 8', 130.50, 65, 'menu8.jpg', FALSE, 8, 8),
('Menu 9', 'Description 9', 75.25, 37, 'menu9.jpg', TRUE, 9, 9),
('Menu 10', 'Description 10', 100.00, 50, 'menu10.jpg', FALSE, 10, 10);

-- แทรกข้อมูลลงในตาราง Users
INSERT INTO Users (username, email, password, phone, date_of_birth, line_id, profile_picture) VALUES
('user1', 'user1@example.com', 'userpass1', '1112223333', '1990-01-01', 'lineuser1', 'user1.jpg'),
('user2', 'user2@example.com', 'userpass2', '2223334444', '1992-02-02', 'lineuser2', 'user2.jpg'),
('user3', 'user3@example.com', 'userpass3', '3334445555', '1994-03-03', 'lineuser3', 'user3.jpg'),
('user4', 'user4@example.com', 'userpass4', '4445556666', '1996-04-04', 'lineuser4', 'user4.jpg'),
('user5', 'user5@example.com', 'userpass5', '5556667777', '1998-05-05', 'lineuser5', 'user5.jpg'),
('user6', 'user6@example.com', 'userpass6', '6667778888', '2000-06-06', 'lineuser6', 'user6.jpg'),
('user7', 'user7@example.com', 'userpass7', '7778889999', '2002-07-07', 'lineuser7', 'user7.jpg'),
('user8', 'user8@example.com', 'userpass8', '8889990000', '2004-08-08', 'lineuser8', 'user8.jpg'),
('user9', 'user9@example.com', 'userpass9', '9990001111', '2006-09-09', 'lineuser9', 'user9.jpg'),
('user10', 'user10@example.com', 'userpass10', '0001112222', '2008-10-10', 'lineuser10', 'user10.jpg');

-- แทรกข้อมูลลงในตาราง Locations_Users
INSERT INTO Locations_Users (location_user_id, user_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- แทรกข้อมูลลงในตาราง PostsUsers
INSERT INTO PostsUsers (user_id, content, image_url) VALUES
(1, 'Post content 1', 'post1.jpg'),
(2, 'Post content 2', 'post2.jpg'),
(3, 'Post content 3', 'post3.jpg'),
(4, 'Post content 4', 'post4.jpg'),
(5, 'Post content 5', 'post5.jpg'),
(6, 'Post content 6', 'post6.jpg'),
(7, 'Post content 7', 'post7.jpg'),
(8, 'Post content 8', 'post8.jpg'),
(9, 'Post content 9', 'post9.jpg'),
(10, 'Post content 10', 'post10.jpg');

-- แทรกข้อมูลลงในตาราง CommentsUsers
INSERT INTO CommentsUsers (post_id, user_id, content) VALUES
(1, 1, 'Comment 1 by user 1'),
(2, 2, 'Comment 2 by user 2'),
(3, 3, 'Comment 3 by user 3'),
(4, 4, 'Comment 4 by user 4'),
(5, 5, 'Comment 5 by user 5'),
(6, 6, 'Comment 6 by user 6'),
(7, 7, 'Comment 7 by user 7'),
(8, 8, 'Comment 8 by user 8'),
(9, 9, 'Comment 9 by user 9'),
(10, 10, 'Comment 10 by user 10');

-- แทรกข้อมูลลงในตาราง LikesUsers
INSERT INTO LikesUsers (post_id, user_id) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);

-- แทรกข้อมูลลงในตาราง Rooms
INSERT INTO Rooms (location_id, room_number, type, price, status) VALUES
(1, '101', 'Standard', 50.00, 'Available'),
(1, '102', 'Deluxe', 75.00, 'Available'),
(2, '201', 'Standard', 60.00, 'Available'),
(2, '202', 'Deluxe', 90.00, 'Occupied'),
(3, '301', 'Standard', 55.00, 'Available'),
(3, '302', 'Suite', 100.00, 'Out of Service'),
(4, '401', 'Standard', 70.00, 'Available'),
(4, '402', 'Deluxe', 110.00, 'Available'),
(5, '501', 'Standard', 65.00, 'Occupied'),
(5, '502', 'Suite', 120.00, 'Available');

-- แทรกข้อมูลลงในตาราง RoomReservations
INSERT INTO RoomReservations (room_id, user_id, reservation_date, check_in_date, check_out_date, rating, comment, status) VALUES
(1, 1, '2024-02-07', '2024-02-10', '2024-02-12', 4, 'Good room!', 'Approved'),
(2, 2, '2024-02-08', '2024-02-11', '2024-02-13', 5, 'Great experience!', 'Approved'),
(3, 3, '2024-02-09', '2024-02-12', '2024-02-14', NULL, '', 'Pending'),
(4, 4, '2024-02-10', '2024-02-13', '2024-02-15', NULL, '', 'Pending'),
(5, 5, '2024-02-11', '2024-02-14', '2024-02-16', NULL, '', 'Pending'),
(6, 6, '2024-02-12', '2024-02-15', '2024-02-17', NULL, '', 'Pending'),
(7, 7, '2024-02-13', '2024-02-16', '2024-02-18', NULL, '', 'Pending'),
(8, 8, '2024-02-14', '2024-02-17', '2024-02-19', NULL, '', 'Pending'),
(9, 9, '2024-02-15', '2024-02-18', '2024-02-20', NULL, '', 'Pending'),
(10, 10, '2024-02-16', '2024-02-19', '2024-02-21', NULL, '', 'Pending');

-- แทรกข้อมูลลงในตาราง FoodReservations
INSERT INTO FoodReservations (menu_id, user_id, reservation_date, reservation_time, quantity, rating, comment, status) VALUES
(1, 1, '2024-02-07', '12:00:00', 2, 4, 'Delicious!', 'Approved'),
(2, 2, '2024-02-08', '13:00:00', 3, 5, 'Amazing food!', 'Approved'),
(3, 3, '2024-02-09', '14:00:00', 1, NULL, '', 'Pending'),
(4, 4, '2024-02-10', '15:00:00', 2, NULL, '', 'Pending'),
(5, 5, '2024-02-11', '16:00:00', 3, NULL, '', 'Pending'),
(6, 6, '2024-02-12', '17:00:00', 1, NULL, '', 'Pending'),
(7, 7, '2024-02-13', '18:00:00', 2, NULL, '', 'Pending'),
(8, 8, '2024-02-14', '19:00:00', 3, NULL, '', 'Pending'),
(9, 9, '2024-02-15', '20:00:00', 1, NULL, '', 'Pending'),
(10, 10, '2024-02-16', '21:00:00', 2, NULL, '', 'Pending');

-- แทรกข้อมูลลงในตาราง Posts เพื่อให้ Owners สามารถโพสต์ได้
INSERT INTO Posts (owner_id, content, image_url) VALUES
(1, 'Owner post 1', 'ownerpost1.jpg'),
(2, 'Owner post 2', 'ownerpost2.jpg'),
(3, 'Owner post 3', 'ownerpost3.jpg'),
(4, 'Owner post 4', 'ownerpost4.jpg'),
(5, 'Owner post 5', 'ownerpost5.jpg'),
(6, 'Owner post 6', 'ownerpost6.jpg'),
(7, 'Owner post 7', 'ownerpost7.jpg'),
(8, 'Owner post 8', 'ownerpost8.jpg'),
(9, 'Owner post 9', 'ownerpost9.jpg'),
(10, 'Owner post 10', 'ownerpost10.jpg');

-- แทรกข้อมูลลงในตาราง Comments เพื่อให้ผู้ใช้สามารถแสดงความคิดเห็นในโพสต์ได้
INSERT INTO Comments (post_id, user_id, content) VALUES
(1, 2, 'Comment on post 1'),
(2, 3, 'Comment on post 2'),
(3, 4, 'Comment on post 3'),
(4, 5, 'Comment on post 4'),
(5, 6, 'Comment on post 5'),
(6, 7, 'Comment on post 6'),
(7, 8, 'Comment on post 7'),
(8, 9, 'Comment on post 8'),
(9, 10, 'Comment on post 9'),
(10, 1, 'Comment on post 10');

-- แทรกข้อมูลลงในตาราง Likes เพื่อให้ผู้ใช้สามารถกดไลค์โพสต์ได้
INSERT INTO Likes (post_id, user_id) VALUES
(1, 3),
(2, 4),
(3, 5),
(4, 6),
(5, 7),
(6, 8),
(7, 9),
(8, 10),
(9, 1),
(10, 2);

-- แทรกข้อมูลลงในตาราง Follows
INSERT INTO Follows (user_id, location_id) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);

-- แทรกข้อมูลลงในตาราง Advertisers
INSERT INTO Advertisers (user_id, company_name, contact_email, phone_number, website) VALUES
(1, 'Company 1', 'company1@example.com', '1112223333', 'www.company1.com'),
(2, 'Company 2', 'company2@example.com', '2223334444', 'www.company2.com'),
(3, 'Company 3', 'company3@example.com', '3334445555', 'www.company3.com'),
(4, 'Company 4', 'company4@example.com', '4445556666', 'www.company4.com'),
(5, 'Company 5', 'company5@example.com', '5556667777', 'www.company5.com'),
(6, 'Company 6', 'company6@example.com', '6667778888', 'www.company6.com'),
(7, 'Company 7', 'company7@example.com', '7778889999', 'www.company7.com'),
(8, 'Company 8', 'company8@example.com', '8889990000', 'www.company8.com'),
(9, 'Company 9', 'company9@example.com', '9990001111', 'www.company9.com'),
(10, 'Company 10', 'company10@example.com', '0001112222', 'www.company10.com');

-- แทรกข้อมูลลงในตาราง PackagesAdvertisers
INSERT INTO PackagesAdvertisers (package_name, description, price, duration, advertiser_id) VALUES
('Package 1', 'Description for Package 1', 1000.00, 30, 1),
('Package 2', 'Description for Package 2', 1500.00, 30, 2),
('Package 3', 'Description for Package 3', 2000.00, 30, 3),
('Package 4', 'Description for Package 4', 2500.00, 30, 4),
('Package 5', 'Description for Package 5', 3000.00, 30, 5),
('Package 6', 'Description for Package 6', 3500.00, 30, 6),
('Package 7', 'Description for Package 7', 4000.00, 30, 7),
('Package 8', 'Description for Package 8', 4500.00, 30, 8),
('Package 9', 'Description for Package 9', 5000.00, 30, 9),
('Package 10', 'Description for Package 10', 5500.00, 30, 10);

-- แทรกข้อมูลลงในตาราง PaymentsAdvertisers
INSERT INTO PaymentsAdvertisers (advertiser_id, package_id, payment_date, amount, payment_method, payment_status) VALUES
(1, 1, '2024-02-07', 1000.00, 'Credit Card', 'Paid'),
(2, 2, '2024-02-08', 1500.00, 'Credit Card', 'Paid'),
(3, 3, '2024-02-09', 2000.00, 'Credit Card', 'Paid'),
(4, 4, '2024-02-10', 2500.00, 'Credit Card', 'Paid'),
(5, 5, '2024-02-11', 3000.00, 'Credit Card', 'Paid'),
(6, 6, '2024-02-12', 3500.00, 'Credit Card', 'Paid'),
(7, 7, '2024-02-13', 4000.00, 'Credit Card', 'Paid'),
(8, 8, '2024-02-14', 4500.00, 'Credit Card', 'Paid'),
(9, 9, '2024-02-15', 5000.00, 'Credit Card', 'Paid'),
(10, 10, '2024-02-16', 5500.00, 'Credit Card', 'Paid');

-- แทรกข้อมูลลงในตาราง PaymentStatus
INSERT INTO PaymentStatus (status) VALUES
('Pending'),
('Paid'),
('Failed'),
('Cancelled');
