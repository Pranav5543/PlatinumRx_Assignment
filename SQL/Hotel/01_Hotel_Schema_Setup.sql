-- ============================================================
-- PlatinumRx Assignment | Phase 1 - Part A
-- File: 01_Hotel_Schema_Setup.sql
-- Description: Create tables and insert sample data for Hotel
--              Management System
-- Compatible with: MySQL, PostgreSQL, SQLite
-- ============================================================

DROP TABLE IF EXISTS booking_commercials;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS users;

-- TABLE: users
CREATE TABLE users (
    user_id         VARCHAR(50)  PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    phone_number    VARCHAR(20),
    mail_id         VARCHAR(100),
    billing_address VARCHAR(255)
);

-- TABLE: items
CREATE TABLE items (
    item_id   VARCHAR(50)    PRIMARY KEY,
    item_name VARCHAR(100)   NOT NULL,
    item_rate DECIMAL(10, 2) NOT NULL
);

-- TABLE: bookings
CREATE TABLE bookings (
    booking_id   VARCHAR(50) PRIMARY KEY,
    booking_date DATETIME    NOT NULL,
    room_no      VARCHAR(50) NOT NULL,
    user_id      VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- TABLE: booking_commercials
CREATE TABLE booking_commercials (
    id            VARCHAR(50)    PRIMARY KEY,
    booking_id    VARCHAR(50)    NOT NULL,
    bill_id       VARCHAR(50)    NOT NULL,
    bill_date     DATETIME       NOT NULL,
    item_id       VARCHAR(50)    NOT NULL,
    item_quantity DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (item_id)    REFERENCES items(item_id)
);

-- INSERT: users
INSERT INTO users (user_id, name, phone_number, mail_id, billing_address) VALUES
('21wrcxuy-67erfn', 'John Doe',    '9711111111', 'john.doe@example.com',    '10, Street A, Delhi'),
('u2-abcdef-ghijk', 'Jane Smith',  '9722222222', 'jane.smith@example.com',  '22, MG Road, Mumbai'),
('u3-lmnopq-rstuv', 'Raj Kumar',   '9733333333', 'raj.kumar@example.com',   '5, Brigade Rd, Bengaluru'),
('u4-wxyzab-cdefg', 'Priya Patel', '9744444444', 'priya.patel@example.com', '8, Park St, Kolkata'),
('u5-hijklm-nopqr', 'Sam Wilson',  '9755555555', 'sam.wilson@example.com',  '3, Anna Salai, Chennai');

-- INSERT: items
INSERT INTO items (item_id, item_name, item_rate) VALUES
('itm-a9e8-q8fu',  'Tawa Paratha',    18.00),
('itm-a07vh-aer8', 'Mix Veg',         89.00),
('itm-w978-23u4',  'Butter Chicken', 220.00),
('itm-b234-xyzw',  'Dal Makhani',    150.00),
('itm-c567-pqrs',  'Paneer Tikka',   180.00),
('itm-d890-mnop',  'Naan',            30.00),
('itm-e123-abcd',  'Masala Chai',     25.00),
('itm-f456-efgh',  'Room Service',   500.00),
('itm-g789-ijkl',  'Laundry',        200.00),
('itm-h012-mnop',  'Spa Treatment',  800.00);

-- INSERT: bookings
INSERT INTO bookings (booking_id, booking_date, room_no, user_id) VALUES
('bk-09f3e-95hj', '2021-09-23 07:36:48', 'rm-bhf9-aerjn', '21wrcxuy-67erfn'),
('bk-10a1b-22kl', '2021-10-05 09:00:00', 'rm-c2d3-efgh4', '21wrcxuy-67erfn'),
('bk-11x2y-33mn', '2021-11-12 14:20:00', 'rm-e4f5-ijkl6', '21wrcxuy-67erfn'),
('bk-q034-q4o',   '2021-09-23 11:30:00', 'rm-g6h7-mnop8', 'u2-abcdef-ghijk'),
('bk-20b2c-44op', '2021-10-18 16:00:00', 'rm-i8j9-qrst0', 'u2-abcdef-ghijk'),
('bk-21c3d-55qr', '2021-11-25 10:00:00', 'rm-k0l1-uvwx2', 'u2-abcdef-ghijk'),
('bk-30d4e-66st', '2021-10-07 08:00:00', 'rm-m2n3-yzab4', 'u3-lmnopq-rstuv'),
('bk-31e5f-77uv', '2021-11-03 13:00:00', 'rm-o4p5-cdef6', 'u3-lmnopq-rstuv'),
('bk-40f6g-88wx', '2021-11-14 11:00:00', 'rm-q6r7-ghij8', 'u4-wxyzab-cdefg'),
('bk-41g7h-99yz', '2021-12-01 15:00:00', 'rm-s8t9-klmn0', 'u4-wxyzab-cdefg'),
('bk-50h8i-00ab', '2021-10-20 07:30:00', 'rm-u0v1-opqr2', 'u5-hijklm-nopqr'),
('bk-51i9j-11cd', '2021-11-28 12:00:00', 'rm-w2x3-stuv4', 'u5-hijklm-nopqr');

-- INSERT: booking_commercials
INSERT INTO booking_commercials (id, booking_id, bill_id, bill_date, item_id, item_quantity) VALUES
('bc-001', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a9e8-q8fu',  3),
('bc-002', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a07vh-aer8', 1),
('bc-003', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-d890-mnop',  2),
('bc-004', 'bk-q034-q4o',   'bl-34qhd-r7h8', '2021-09-23 12:05:37', 'itm-w978-23u4',  0.5),
('bc-005', 'bk-q034-q4o',   'bl-34qhd-r7h8', '2021-09-23 12:05:37', 'itm-b234-xyzw',  1),
('bc-006', 'bk-q034-q4o',   'bl-34qhd-r7h8', '2021-09-23 12:05:37', 'itm-e123-abcd',  3),
('bc-007', 'bk-10a1b-22kl', 'bl-oct1-john1', '2021-10-05 10:00:00', 'itm-f456-efgh',  2),
('bc-008', 'bk-10a1b-22kl', 'bl-oct1-john1', '2021-10-05 10:00:00', 'itm-w978-23u4',  3),
('bc-009', 'bk-10a1b-22kl', 'bl-oct1-john1', '2021-10-05 10:00:00', 'itm-d890-mnop',  4),
('bc-010', 'bk-20b2c-44op', 'bl-oct2-jane1', '2021-10-18 17:00:00', 'itm-h012-mnop',  1),
('bc-011', 'bk-20b2c-44op', 'bl-oct2-jane1', '2021-10-18 17:00:00', 'itm-c567-pqrs',  2),
('bc-012', 'bk-20b2c-44op', 'bl-oct2-jane1', '2021-10-18 17:00:00', 'itm-g789-ijkl',  1),
('bc-013', 'bk-30d4e-66st', 'bl-oct3-raj1',  '2021-10-07 09:00:00', 'itm-b234-xyzw',  2),
('bc-014', 'bk-30d4e-66st', 'bl-oct3-raj1',  '2021-10-07 09:00:00', 'itm-a9e8-q8fu',  5),
('bc-015', 'bk-30d4e-66st', 'bl-oct3-raj1',  '2021-10-07 09:00:00', 'itm-e123-abcd',  2),
('bc-016', 'bk-50h8i-00ab', 'bl-oct4-sam1',  '2021-10-20 08:30:00', 'itm-f456-efgh',  1),
('bc-017', 'bk-50h8i-00ab', 'bl-oct4-sam1',  '2021-10-20 08:30:00', 'itm-w978-23u4',  2),
('bc-018', 'bk-50h8i-00ab', 'bl-oct4-sam1',  '2021-10-20 08:30:00', 'itm-d890-mnop',  3),
('bc-019', 'bk-11x2y-33mn', 'bl-nov1-john1', '2021-11-12 15:00:00', 'itm-h012-mnop',  2),
('bc-020', 'bk-11x2y-33mn', 'bl-nov1-john1', '2021-11-12 15:00:00', 'itm-c567-pqrs',  3),
('bc-021', 'bk-11x2y-33mn', 'bl-nov1-john1', '2021-11-12 15:00:00', 'itm-w978-23u4',  2),
('bc-022', 'bk-21c3d-55qr', 'bl-nov2-jane1', '2021-11-25 11:00:00', 'itm-g789-ijkl',  2),
('bc-023', 'bk-21c3d-55qr', 'bl-nov2-jane1', '2021-11-25 11:00:00', 'itm-b234-xyzw',  3),
('bc-024', 'bk-21c3d-55qr', 'bl-nov2-jane1', '2021-11-25 11:00:00', 'itm-d890-mnop',  5),
('bc-025', 'bk-31e5f-77uv', 'bl-nov3-raj1',  '2021-11-03 14:00:00', 'itm-f456-efgh',  1),
('bc-026', 'bk-31e5f-77uv', 'bl-nov3-raj1',  '2021-11-03 14:00:00', 'itm-a07vh-aer8', 2),
('bc-027', 'bk-31e5f-77uv', 'bl-nov3-raj1',  '2021-11-03 14:00:00', 'itm-e123-abcd',  4),
('bc-028', 'bk-40f6g-88wx', 'bl-nov4-priy1', '2021-11-14 12:00:00', 'itm-h012-mnop',  1),
('bc-029', 'bk-40f6g-88wx', 'bl-nov4-priy1', '2021-11-14 12:00:00', 'itm-c567-pqrs',  2),
('bc-030', 'bk-40f6g-88wx', 'bl-nov4-priy1', '2021-11-14 12:00:00', 'itm-w978-23u4',  1),
('bc-031', 'bk-51i9j-11cd', 'bl-nov5-sam1',  '2021-11-28 13:00:00', 'itm-b234-xyzw',  4),
('bc-032', 'bk-51i9j-11cd', 'bl-nov5-sam1',  '2021-11-28 13:00:00', 'itm-d890-mnop',  6),
('bc-033', 'bk-51i9j-11cd', 'bl-nov5-sam1',  '2021-11-28 13:00:00', 'itm-e123-abcd',  3),
('bc-034', 'bk-41g7h-99yz', 'bl-dec1-priy1', '2021-12-01 16:00:00', 'itm-f456-efgh',  3),
('bc-035', 'bk-41g7h-99yz', 'bl-dec1-priy1', '2021-12-01 16:00:00', 'itm-g789-ijkl',  2),
('bc-036', 'bk-41g7h-99yz', 'bl-dec1-priy1', '2021-12-01 16:00:00', 'itm-a9e8-q8fu',  8);
