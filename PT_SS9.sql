CREATE DATABASE IF NOT EXISTS hospital_pharmacy_db;

USE hospital_pharmacy_db;

DROP TABLE IF EXISTS pharmacy_inventory;

CREATE TABLE pharmacy_inventory (
    inventory_id int AUTO_INCREMENT PRIMARY KEY,
    drug_name varchar(255) NOT NULL,
    batch_number varchar(50) NOT NULL,
    expiry_date date NOT NULL,
    quantity int NOT NULL
);

-- Dữ liệu mẫu nhỏ để test nhanh
INSERT INTO pharmacy_inventory (drug_name, batch_number, expiry_date, quantity)
VALUES
    ('Paracetamol', 'BATCH001', '2026-01-10', 100),
    ('Paracetamol', 'BATCH002', '2025-12-20', 50),
    ('Paracetamol', 'BATCH003', '2027-03-15', 200),
    ('Amoxicillin', 'BATCH004', '2025-11-01', 80),
    ('Amoxicillin', 'BATCH005', '2026-08-12', 120),
    ('Vitamin C', 'BATCH006', '2025-10-05', 300),
    ('Vitamin C', 'BATCH007', '2026-04-25', 150);

EXPLAIN
SELECT
    *
FROM
    pharmacy_inventory
WHERE
    drug_name = 'Paracetamol'
    AND expiry_date <= '2026-12-31'
ORDER BY
    expiry_date ASC;

CREATE INDEX idx_drug_name ON pharmacy_inventory (drug_name);

CREATE INDEX idx_expiry_date ON pharmacy_inventory (expiry_date);

EXPLAIN
SELECT
    *
FROM
    pharmacy_inventory
WHERE
    drug_name = 'Paracetamol'
    AND expiry_date <= '2026-12-31'
ORDER BY
    expiry_date ASC;

DROP INDEX idx_drug_name ON pharmacy_inventory;

DROP INDEX idx_expiry_date ON pharmacy_inventory;

CREATE INDEX idx_drug_expiry ON pharmacy_inventory (drug_name, expiry_date);

EXPLAIN
SELECT
    *
FROM
    pharmacy_inventory
WHERE
    drug_name = 'Paracetamol'
    AND expiry_date <= '2026-12-31'
ORDER BY
    expiry_date ASC;


