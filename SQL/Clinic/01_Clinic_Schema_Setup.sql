-- ============================================================
-- PlatinumRx Assignment | Phase 1 - Part B
-- File: 03_Clinic_Schema_Setup.sql
-- Description: Create tables and insert sample data for
--              Clinic Management System
-- Compatible with: MySQL, PostgreSQL, SQLite
-- ============================================================

-- Drop tables if they already exist (for clean re-runs)
DROP TABLE IF EXISTS clinic_sales;
DROP TABLE IF EXISTS expenses;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS clinics;

-- ============================================================
-- TABLE: clinics
-- ============================================================
CREATE TABLE clinics (
    cid         VARCHAR(50)  PRIMARY KEY,
    clinic_name VARCHAR(100) NOT NULL,
    city        VARCHAR(100) NOT NULL,
    state       VARCHAR(100) NOT NULL,
    country     VARCHAR(100) NOT NULL
);

-- ============================================================
-- TABLE: customer
-- ============================================================
CREATE TABLE customer (
    uid    VARCHAR(50)  PRIMARY KEY,
    name   VARCHAR(100) NOT NULL,
    mobile VARCHAR(20)
);

-- ============================================================
-- TABLE: clinic_sales
-- ============================================================
CREATE TABLE clinic_sales (
    oid          VARCHAR(50)    PRIMARY KEY,
    uid          VARCHAR(50)    NOT NULL,
    cid          VARCHAR(50)    NOT NULL,
    amount       DECIMAL(10, 2) NOT NULL,
    datetime     DATETIME       NOT NULL,
    sales_channel VARCHAR(50)   NOT NULL,
    FOREIGN KEY (uid) REFERENCES customer(uid),
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

-- ============================================================
-- TABLE: expenses
-- ============================================================
CREATE TABLE expenses (
    eid         VARCHAR(50)    PRIMARY KEY,
    cid         VARCHAR(50)    NOT NULL,
    description VARCHAR(255),
    amount      DECIMAL(10, 2) NOT NULL,
    datetime    DATETIME       NOT NULL,
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

-- ============================================================
-- INSERT: clinics
-- ============================================================
INSERT INTO clinics (cid, clinic_name, city, state, country) VALUES
('cnc-0100001', 'XYZ Clinic',     'Hyderabad', 'Telangana',    'India'),
('cnc-0100002', 'ABC MediCare',   'Hyderabad', 'Telangana',    'India'),
('cnc-0100003', 'HealthFirst',    'Mumbai',    'Maharashtra',  'India'),
('cnc-0100004', 'CurePlus',       'Pune',      'Maharashtra',  'India'),
('cnc-0100005', 'WellCare',       'Chennai',   'Tamil Nadu',   'India'),
('cnc-0100006', 'MediLife',       'Bengaluru', 'Karnataka',    'India'),
('cnc-0100007', 'QuickCure',      'Delhi',     'Delhi',        'India'),
('cnc-0100008', 'PrimeCare',      'Delhi',     'Delhi',        'India');

-- ============================================================
-- INSERT: customer
-- ============================================================
INSERT INTO customer (uid, name, mobile) VALUES
('cust-001', 'Jon Doe',       '9711111111'),
('cust-002', 'Meera Sharma',  '9722222222'),
('cust-003', 'Arun Verma',    '9733333333'),
('cust-004', 'Sneha Nair',    '9744444444'),
('cust-005', 'Rahul Gupta',   '9755555555'),
('cust-006', 'Pooja Singh',   '9766666666'),
('cust-007', 'Vikram Menon',  '9777777777'),
('cust-008', 'Anjali Rao',    '9788888888'),
('cust-009', 'Karthik Iyer',  '9799999999'),
('cust-010', 'Divya Pillai',  '9700000000');

-- ============================================================
-- INSERT: clinic_sales (2021 data)
-- ============================================================
INSERT INTO clinic_sales (oid, uid, cid, amount, datetime, sales_channel) VALUES
-- January 2021
('ord-0001', 'cust-001', 'cnc-0100001', 24999, '2021-01-05 10:00:00', 'online'),
('ord-0002', 'cust-002', 'cnc-0100001',  5500, '2021-01-10 11:00:00', 'walk-in'),
('ord-0003', 'cust-003', 'cnc-0100002', 12000, '2021-01-15 09:30:00', 'online'),
('ord-0004', 'cust-004', 'cnc-0100003',  8000, '2021-01-20 14:00:00', 'referral'),
('ord-0005', 'cust-005', 'cnc-0100003', 15000, '2021-01-25 15:00:00', 'online'),

-- February 2021
('ord-0006', 'cust-006', 'cnc-0100004', 11000, '2021-02-03 10:00:00', 'walk-in'),
('ord-0007', 'cust-007', 'cnc-0100004', 30000, '2021-02-08 11:30:00', 'online'),
('ord-0008', 'cust-008', 'cnc-0100005',  7500, '2021-02-13 13:00:00', 'referral'),
('ord-0009', 'cust-001', 'cnc-0100005', 18000, '2021-02-18 09:00:00', 'online'),
('ord-0010', 'cust-009', 'cnc-0100006',  9500, '2021-02-25 16:00:00', 'walk-in'),

-- March 2021
('ord-0011', 'cust-010', 'cnc-0100006', 22000, '2021-03-02 10:00:00', 'online'),
('ord-0012', 'cust-002', 'cnc-0100007', 14000, '2021-03-07 11:00:00', 'referral'),
('ord-0013', 'cust-003', 'cnc-0100007', 32000, '2021-03-12 12:00:00', 'online'),
('ord-0014', 'cust-004', 'cnc-0100008',  6000, '2021-03-17 13:00:00', 'walk-in'),
('ord-0015', 'cust-005', 'cnc-0100008', 25000, '2021-03-22 14:00:00', 'online'),

-- April 2021
('ord-0016', 'cust-006', 'cnc-0100001', 17000, '2021-04-01 09:00:00', 'online'),
('ord-0017', 'cust-007', 'cnc-0100002',  8500, '2021-04-06 10:30:00', 'walk-in'),
('ord-0018', 'cust-008', 'cnc-0100003', 21000, '2021-04-11 11:00:00', 'referral'),
('ord-0019', 'cust-009', 'cnc-0100004', 45000, '2021-04-16 12:00:00', 'online'),
('ord-0020', 'cust-010', 'cnc-0100005', 13000, '2021-04-21 13:00:00', 'online'),

-- May 2021
('ord-0021', 'cust-001', 'cnc-0100006', 28000, '2021-05-03 09:00:00', 'online'),
('ord-0022', 'cust-002', 'cnc-0100007', 19000, '2021-05-08 10:00:00', 'referral'),
('ord-0023', 'cust-003', 'cnc-0100008', 11500, '2021-05-13 11:00:00', 'walk-in'),
('ord-0024', 'cust-004', 'cnc-0100001',  9000, '2021-05-18 12:00:00', 'online'),
('ord-0025', 'cust-005', 'cnc-0100002', 35000, '2021-05-23 13:00:00', 'online'),

-- June 2021
('ord-0026', 'cust-006', 'cnc-0100003', 16000, '2021-06-02 09:00:00', 'walk-in'),
('ord-0027', 'cust-007', 'cnc-0100004', 27000, '2021-06-07 10:00:00', 'online'),
('ord-0028', 'cust-008', 'cnc-0100005', 12500, '2021-06-12 11:30:00', 'referral'),
('ord-0029', 'cust-009', 'cnc-0100006', 38000, '2021-06-17 12:00:00', 'online'),
('ord-0030', 'cust-010', 'cnc-0100007',  7000, '2021-06-22 13:00:00', 'walk-in'),

-- July 2021
('ord-0031', 'cust-001', 'cnc-0100008', 29000, '2021-07-01 09:00:00', 'online'),
('ord-0032', 'cust-002', 'cnc-0100001', 15500, '2021-07-06 10:00:00', 'referral'),
('ord-0033', 'cust-003', 'cnc-0100002', 41000, '2021-07-11 11:00:00', 'online'),
('ord-0034', 'cust-004', 'cnc-0100003',  8000, '2021-07-16 12:00:00', 'walk-in'),
('ord-0035', 'cust-005', 'cnc-0100004', 23000, '2021-07-21 13:00:00', 'online'),

-- August 2021
('ord-0036', 'cust-006', 'cnc-0100005', 31000, '2021-08-03 09:00:00', 'online'),
('ord-0037', 'cust-007', 'cnc-0100006', 14000, '2021-08-08 10:30:00', 'referral'),
('ord-0038', 'cust-008', 'cnc-0100007', 52000, '2021-08-13 11:00:00', 'online'),
('ord-0039', 'cust-009', 'cnc-0100008', 11000, '2021-08-18 12:00:00', 'walk-in'),
('ord-0040', 'cust-010', 'cnc-0100001', 19500, '2021-08-23 13:00:00', 'online'),

-- September 2021
('ord-0041', 'cust-001', 'cnc-0100001', 24999, '2021-09-23 12:03:22', 'online'),
('ord-0042', 'cust-002', 'cnc-0100002', 33000, '2021-09-04 10:00:00', 'online'),
('ord-0043', 'cust-003', 'cnc-0100003', 17000, '2021-09-09 11:00:00', 'referral'),
('ord-0044', 'cust-004', 'cnc-0100004', 26000, '2021-09-14 12:00:00', 'walk-in'),
('ord-0045', 'cust-005', 'cnc-0100005', 44000, '2021-09-19 13:00:00', 'online'),

-- October 2021
('ord-0046', 'cust-006', 'cnc-0100006', 18000, '2021-10-02 09:00:00', 'referral'),
('ord-0047', 'cust-007', 'cnc-0100007', 36000, '2021-10-07 10:00:00', 'online'),
('ord-0048', 'cust-008', 'cnc-0100008', 22500, '2021-10-12 11:00:00', 'walk-in'),
('ord-0049', 'cust-009', 'cnc-0100001', 13000, '2021-10-17 12:00:00', 'online'),
('ord-0050', 'cust-010', 'cnc-0100002', 47000, '2021-10-22 13:00:00', 'online'),

-- November 2021
('ord-0051', 'cust-001', 'cnc-0100003', 15000, '2021-11-01 09:00:00', 'walk-in'),
('ord-0052', 'cust-002', 'cnc-0100004', 28000, '2021-11-06 10:30:00', 'online'),
('ord-0053', 'cust-003', 'cnc-0100005', 19000, '2021-11-11 11:00:00', 'referral'),
('ord-0054', 'cust-004', 'cnc-0100006', 55000, '2021-11-16 12:00:00', 'online'),
('ord-0055', 'cust-005', 'cnc-0100007', 14000, '2021-11-21 13:00:00', 'online'),

-- December 2021
('ord-0056', 'cust-006', 'cnc-0100008', 24000, '2021-12-03 09:00:00', 'online'),
('ord-0057', 'cust-007', 'cnc-0100001', 39000, '2021-12-08 10:00:00', 'referral'),
('ord-0058', 'cust-008', 'cnc-0100002', 16500, '2021-12-13 11:30:00', 'walk-in'),
('ord-0059', 'cust-009', 'cnc-0100003', 42000, '2021-12-18 12:00:00', 'online'),
('ord-0060', 'cust-010', 'cnc-0100004', 27000, '2021-12-23 13:00:00', 'online');

-- ============================================================
-- INSERT: expenses (2021 data)
-- ============================================================
INSERT INTO expenses (eid, cid, description, amount, datetime) VALUES
-- January
('exp-0001', 'cnc-0100001', 'First-aid supplies',  557,  '2021-01-05 07:36:48'),
('exp-0002', 'cnc-0100001', 'Staff salaries',      15000,'2021-01-31 18:00:00'),
('exp-0003', 'cnc-0100002', 'Medicines purchase',  8000, '2021-01-10 09:00:00'),
('exp-0004', 'cnc-0100003', 'Rent',                5000, '2021-01-01 09:00:00'),
('exp-0005', 'cnc-0100003', 'Utilities',           2000, '2021-01-15 10:00:00'),

-- February
('exp-0006', 'cnc-0100004', 'Staff salaries',      12000,'2021-02-28 18:00:00'),
('exp-0007', 'cnc-0100004', 'Equipment maintenance',3500,'2021-02-10 10:00:00'),
('exp-0008', 'cnc-0100005', 'Medicines purchase',  6000, '2021-02-05 09:00:00'),
('exp-0009', 'cnc-0100005', 'Rent',                4500, '2021-02-01 09:00:00'),
('exp-0010', 'cnc-0100006', 'Utilities',           1800, '2021-02-15 10:00:00'),

-- March
('exp-0011', 'cnc-0100006', 'Staff salaries',      14000,'2021-03-31 18:00:00'),
('exp-0012', 'cnc-0100007', 'Medicines purchase',  9000, '2021-03-08 09:00:00'),
('exp-0013', 'cnc-0100007', 'Rent',                7000, '2021-03-01 09:00:00'),
('exp-0014', 'cnc-0100008', 'First-aid supplies',  1200, '2021-03-10 10:00:00'),
('exp-0015', 'cnc-0100008', 'Staff salaries',      13000,'2021-03-31 18:00:00'),

-- April
('exp-0016', 'cnc-0100001', 'Equipment maintenance',4000,'2021-04-05 10:00:00'),
('exp-0017', 'cnc-0100002', 'Staff salaries',      11000,'2021-04-30 18:00:00'),
('exp-0018', 'cnc-0100003', 'Medicines purchase',  7500, '2021-04-10 09:00:00'),
('exp-0019', 'cnc-0100004', 'Rent',                6000, '2021-04-01 09:00:00'),
('exp-0020', 'cnc-0100005', 'Utilities',           2200, '2021-04-15 10:00:00'),

-- May
('exp-0021', 'cnc-0100006', 'Staff salaries',      15000,'2021-05-31 18:00:00'),
('exp-0022', 'cnc-0100007', 'Medicines purchase',  8500, '2021-05-05 09:00:00'),
('exp-0023', 'cnc-0100008', 'Equipment maintenance',2800,'2021-05-10 10:00:00'),
('exp-0024', 'cnc-0100001', 'Rent',                5500, '2021-05-01 09:00:00'),
('exp-0025', 'cnc-0100002', 'Utilities',           2100, '2021-05-15 10:00:00'),

-- June
('exp-0026', 'cnc-0100003', 'Staff salaries',      12500,'2021-06-30 18:00:00'),
('exp-0027', 'cnc-0100004', 'Medicines purchase',  5500, '2021-06-05 09:00:00'),
('exp-0028', 'cnc-0100005', 'Rent',                4500, '2021-06-01 09:00:00'),
('exp-0029', 'cnc-0100006', 'First-aid supplies',  900,  '2021-06-10 10:00:00'),
('exp-0030', 'cnc-0100007', 'Utilities',           1900, '2021-06-15 10:00:00'),

-- July
('exp-0031', 'cnc-0100008', 'Staff salaries',      14500,'2021-07-31 18:00:00'),
('exp-0032', 'cnc-0100001', 'Medicines purchase',  6500, '2021-07-05 09:00:00'),
('exp-0033', 'cnc-0100002', 'Rent',                5000, '2021-07-01 09:00:00'),
('exp-0034', 'cnc-0100003', 'Equipment maintenance',3200,'2021-07-10 10:00:00'),
('exp-0035', 'cnc-0100004', 'Utilities',           2300, '2021-07-15 10:00:00'),

-- August
('exp-0036', 'cnc-0100005', 'Staff salaries',      13500,'2021-08-31 18:00:00'),
('exp-0037', 'cnc-0100006', 'Medicines purchase',  7000, '2021-08-05 09:00:00'),
('exp-0038', 'cnc-0100007', 'Rent',                7000, '2021-08-01 09:00:00'),
('exp-0039', 'cnc-0100008', 'First-aid supplies',  1100, '2021-08-10 10:00:00'),
('exp-0040', 'cnc-0100001', 'Utilities',           2000, '2021-08-15 10:00:00'),

-- September
('exp-0041', 'cnc-0100002', 'Staff salaries',      12000,'2021-09-30 18:00:00'),
('exp-0042', 'cnc-0100003', 'Medicines purchase',  8000, '2021-09-05 09:00:00'),
('exp-0043', 'cnc-0100004', 'Rent',                6000, '2021-09-01 09:00:00'),
('exp-0044', 'cnc-0100005', 'Equipment maintenance',2600,'2021-09-10 10:00:00'),
('exp-0045', 'cnc-0100006', 'Utilities',           1700, '2021-09-15 10:00:00'),

-- October
('exp-0046', 'cnc-0100007', 'Staff salaries',      16000,'2021-10-31 18:00:00'),
('exp-0047', 'cnc-0100008', 'Medicines purchase',  9500, '2021-10-05 09:00:00'),
('exp-0048', 'cnc-0100001', 'Rent',                5500, '2021-10-01 09:00:00'),
('exp-0049', 'cnc-0100002', 'First-aid supplies',  800,  '2021-10-10 10:00:00'),
('exp-0050', 'cnc-0100003', 'Utilities',           2400, '2021-10-15 10:00:00'),

-- November
('exp-0051', 'cnc-0100004', 'Staff salaries',      11500,'2021-11-30 18:00:00'),
('exp-0052', 'cnc-0100005', 'Medicines purchase',  6500, '2021-11-05 09:00:00'),
('exp-0053', 'cnc-0100006', 'Rent',                5000, '2021-11-01 09:00:00'),
('exp-0054', 'cnc-0100007', 'Equipment maintenance',3000,'2021-11-10 10:00:00'),
('exp-0055', 'cnc-0100008', 'Utilities',           2100, '2021-11-15 10:00:00'),

-- December
('exp-0056', 'cnc-0100001', 'Staff salaries',      15000,'2021-12-31 18:00:00'),
('exp-0057', 'cnc-0100002', 'Medicines purchase',  7500, '2021-12-05 09:00:00'),
('exp-0058', 'cnc-0100003', 'Rent',                5000, '2021-12-01 09:00:00'),
('exp-0059', 'cnc-0100004', 'First-aid supplies',  1300, '2021-12-10 10:00:00'),
('exp-0060', 'cnc-0100005', 'Utilities',           2500, '2021-12-15 10:00:00');

-- ============================================================
-- ADDITIONAL CLINICS: Ensure every state has ≥2 clinics
-- (Required for Q5 - 2nd least profitable per state)
-- ============================================================
INSERT INTO clinics (cid, clinic_name, city, state, country) VALUES
('cnc-0100009', 'CarePlus',    'Chennai',   'Tamil Nadu', 'India'),
('cnc-0100010', 'HealWell',    'Bengaluru', 'Karnataka',  'India');

-- ============================================================
-- ADDITIONAL SALES: Ensure all clinics have Nov 2021 data
-- (Required for Q4 - most profitable clinic per city per month)
-- ============================================================
INSERT INTO clinic_sales (oid, uid, cid, amount, datetime, sales_channel) VALUES
-- Hyderabad clinics in Nov 2021 (were missing)
('ord-0061', 'cust-001', 'cnc-0100001', 32000, '2021-11-05 10:00:00', 'online'),
('ord-0062', 'cust-002', 'cnc-0100002', 18000, '2021-11-10 11:00:00', 'online'),
-- New Tamil Nadu clinic (Nov 2021)
('ord-0063', 'cust-003', 'cnc-0100009', 11000, '2021-11-08 09:00:00', 'walk-in'),
-- New Karnataka clinic (Nov 2021)
('ord-0064', 'cust-004', 'cnc-0100010', 22000, '2021-11-12 10:00:00', 'online');

-- ============================================================
-- ADDITIONAL EXPENSES: For new clinics in Nov 2021
-- ============================================================
INSERT INTO expenses (eid, cid, description, amount, datetime) VALUES
('exp-0061', 'cnc-0100009', 'Staff salaries',      9000, '2021-11-30 18:00:00'),
('exp-0062', 'cnc-0100010', 'Equipment maintenance',8000, '2021-11-15 10:00:00');
