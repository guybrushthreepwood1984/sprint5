DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica CHARACTER SET utf8mb4;
USE optica;

CREATE TABLE suppliers (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 `name` VARCHAR(100) NOT NULL,
 street VARCHAR(100) NOT NULL,
 street_number VARCHAR(30) NOT NULL,
 floor VARCHAR(30),
 door VARCHAR(30),
 city VARCHAR(100) NOT NULL,
 country VARCHAR(100) NOT NULL,
 phone_number VARCHAR(30),
 fax_number VARCHAR(30) DEFAULT NULL,
 tax_identification_number VARCHAR(40) NOT NULL
);

CREATE INDEX idx_supplier_name ON suppliers (name);

CREATE TABLE glasses (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(100) NOT NULL,
    supplied_by INT UNSIGNED,
    left_eye_graduation DECIMAL(4,2) NOT NULL,
    left_eye_degree INT,
    right_eye_graduation DECIMAL(4,2) NOT NULL,
    right_eye_degree INT,
    frame_type ENUM("floating", "paste", "metallic"),
    frame_color VARCHAR(100) NOT NULL,
    left_glass_color VARCHAR(100),
    right_glass_color VARCHAR(100),
    price INT UNSIGNED NOT NULL,
    FOREIGN KEY (supplied_by) REFERENCES suppliers(id) 
);

CREATE TABLE customers (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    street_number VARCHAR(30) NOT NULL,
    floor VARCHAR(30),
    door VARCHAR(30),
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    phone_number VARCHAR(30),
    email VARCHAR(100),
    registration_date DATE NOT NULL
    );

CREATE TABLE recommendations (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    new_customer INT UNSIGNED NOT NULL,
    recommended_by INT UNSIGNED NOT NULL,
    FOREIGN KEY (new_customer) REFERENCES customers(id),
    FOREIGN KEY (recommended_by) REFERENCES customers(id)
);


CREATE TABLE employees (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL
);

CREATE TABLE sales (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    glasses_sold INT UNSIGNED NOT NULL,
    sold_by INT UNSIGNED NOT NULL,
    sold_to INT UNSIGNED NOT NULL,
    sale_date DATE NOT NULL,
    FOREIGN KEY (sold_by) REFERENCES employees(id),
    FOREIGN KEY (sold_to) REFERENCES customers(id),
    FOREIGN KEY (glasses_sold) REFERENCES glasses(id)
);

INSERT INTO suppliers (`name`, street, street_number, floor, door, city, country, phone_number, fax_number, tax_identification_number) VALUES ("firstSupplier", "C/Mallorca", "123", "bj", "1a", "Barcelona", "España", "654321123", NULL, "A3212321");
