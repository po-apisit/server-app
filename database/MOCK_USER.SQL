-- INSERT INTO TB_COMPANY_ADDRESS
INSERT INTO TB_COMPANY_ADDRESS (ID_COMPANY, ADDRESS_LINE, CITY, STATE, COUNTRY, POSTAL_CODE, LATITUDE, LONGTITUDE) VALUES
    ('CMP003', '123 Main Street', 'City A', 'State A', 'Country A', '12345', '12.345678', '98.765432'),
    ('CMP004', '456 Elm Street', 'City B', 'State B', 'Country B', '23456', '23.456789', '87.654321'),
    ('CMP005', '789 Oak Street', 'City C', 'State C', 'Country C', '34567', '34.567890', '76.543210'),
    ('CMP006', '321 Pine Street', 'City D', 'State D', 'Country D', '45678', '45.678901', '65.432109'),
    ('CMP007', '654 Cedar Street', 'City E', 'State E', 'Country E', '56789', '56.789012', '54.321098'),
    ('CMP008', '987 Maple Street', 'City F', 'State F', 'Country F', '67890', '67.890123', '43.210987'),
    ('CMP009', '210 Walnut Street', 'City G', 'State G', 'Country G', '78901', '78.901234', '32.109876'),
    ('CMP010', '543 Birch Street', 'City H', 'State H', 'Country H', '89012', '89.012345', '21.098765'),
    ('CMP011', '876 Ash Street', 'City I', 'State I', 'Country I', '90123', '90.123456', '10.987654'),
    ('CMP012', '109 Cherry Street', 'City J', 'State J', 'Country J', '01234', '01.234567', '98.765432');

-- INSERT INTO TB_COMPANY_AMENITIES
INSERT INTO TB_COMPANY_AMENITIES (ID_COMPANY, PARKING, FOOD, PEACEFUL, CLEAN, CONVENIENT, SAFE, FREE_INTERNET, PETS_ALLOWED, SMOKING_ALLOWED, MOTORCYCLE_BICYCLE_PARKING, SWIMMING_POOL, GYM, WIFI_IN_ROOM, KEYCARD_SECURITY, FINGERPRINT_SECURITY, CCTV_SECURITY, FOOD_SHOP, CONVENIENCE_STORE) VALUES
    ('CMP003', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
    ('CMP004', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
    ('CMP005', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
    ('CMP006', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
    ('CMP007', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
    ('CMP008', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
    ('CMP009', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
    ('CMP010', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
    ('CMP011', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
    ('CMP012', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE);


-- INSERT INTO TB_COMPANY_POST
INSERT INTO TB_COMPANY_POST (ID_COMPANY, ID_USER_POST, ID_USER_EDIT, TITLE, IMAGE, VIDEO, IS_SHARE, IS_COMMENT, LINK_VIDEO, TYPE_UPLOAD, TYPE_POST) VALUES
    ('CMP003', 'USR003', 'USR003', 'Post Title 1 by Company C', 'companyC_post_image1.jpg', '', TRUE, TRUE, '', 'IMAGE', 'NORMAL'),
    ('CMP004', 'USR004', 'USR004', 'Post Title 2 by Company D', 'companyD_post_image2.jpg', '', TRUE, TRUE, '', 'IMAGE', 'NORMAL'),
    ('CMP005', 'USR005', 'USR005', 'Post Title 3 by Company E', 'companyE_post_image3.jpg', '', TRUE, TRUE, '', 'IMAGE', 'NORMAL'),
    ('CMP006', 'USR006', 'USR006', 'Post Title 4 by Company F', 'companyF_post_image4.jpg', '', TRUE, TRUE, '', 'IMAGE', 'NORMAL'),
    ('CMP007', 'USR007', 'USR007', 'Post Title 5 by Company G', 'companyG_post_image5.jpg', '', TRUE, TRUE, '', 'IMAGE', 'NORMAL'),
    ('CMP008', 'USR008', 'USR008', 'Post Title 6 by Company H', 'companyH_post_image6.jpg', '', TRUE, TRUE, '', 'IMAGE', 'NORMAL'),
    ('CMP009', 'USR009', 'USR009', 'Post Title 7 by Company I', 'companyI_post_image7.jpg', '', TRUE, TRUE, '', 'IMAGE', 'NORMAL'),
    ('CMP010', 'USR010', 'USR010', 'Post Title 8 by Company J', 'companyJ_post_image8.jpg', '', TRUE, TRUE, '', 'IMAGE', 'NORMAL'),
    ('CMP011', 'USR011', 'USR011', 'Post Title 9 by Company K', 'companyK_post_image9.jpg', '', TRUE, TRUE, '', 'IMAGE', 'NORMAL'),
    ('CMP012', 'USR012', 'USR012', 'Post Title 10 by Company L', 'companyL_post_image10.jpg', '', TRUE, TRUE, '', 'IMAGE', 'NORMAL');

-- INSERT INTO TB_COMPANY_SETTING_REFUND
INSERT INTO TB_COMPANY_SETTING_REFUND (ID_COMPANY, UINT, TYPE, DESCRIPTION) VALUES
    ('CMP003', 100, 'BATH', 'Refund for cancellations more than 7 days prior to check-in date'),
    ('CMP004', 200, 'PERSEN', 'Refund for cancellations more than 14 days prior to check-in date'),
    ('CMP005', 150, 'BATH', 'Refund for cancellations more than 5 days prior to check-in date'),
    ('CMP006', 250, 'PERSEN', 'Refund for cancellations more than 10 days prior to check-in date'),
    ('CMP007', 180, 'BATH', 'Refund for cancellations more than 6 days prior to check-in date'),
    ('CMP008', 220, 'PERSEN', 'Refund for cancellations more than 12 days prior to check-in date'),
    ('CMP009', 120, 'BATH', 'Refund for cancellations more than 4 days prior to check-in date'),
    ('CMP010', 280, 'PERSEN', 'Refund for cancellations more than 16 days prior to check-in date'),
    ('CMP011', 230, 'BATH', 'Refund for cancellations more than 11 days prior to check-in date'),
    ('CMP012', 170, 'PERSEN', 'Refund for cancellations more than 8 days prior to check-in date');
