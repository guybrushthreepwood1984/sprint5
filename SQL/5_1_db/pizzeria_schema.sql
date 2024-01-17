DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;
USE pizzeria;

CREATE TABLE customer (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(30),
    last_name VARCHAR(60),
    street VARCHAR(60),
    street_number VARCHAR(20),
    door VARCHAR(20),
    postal_code VARCHAR(20),
    city VARCHAR(60),
    country VARCHAR(60),
    province VARCHAR(60),
    phone_number VARCHAR (30)
);

CREATE TABLE store (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(60),
    street_number VARCHAR(20),
    door VARCHAR(20),
    postal_code VARCHAR(20),
    city VARCHAR(60),
    country VARCHAR(60),
    province VARCHAR(60)
    );

CREATE TABLE orders (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    ordered_by INT(10) UNSIGNED,
    order_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    delivery_or_pick_up ENUM ("Delivery", "Pick up"),
    total_price DECIMAL(10, 2) UNSIGNED,
    store_id INT UNSIGNED,
    FOREIGN KEY (ordered_by) REFERENCES customer(id),
    FOREIGN KEY (store_id) REFERENCES store(id)
);

CREATE TABLE product_category (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category ENUM ("Pizza", "Hamburger", "Beverage")
    );

CREATE TABLE products (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(60),
    product_description VARCHAR(100),
    product_category INT UNSIGNED,
    product_image MEDIUMBLOB,
    price INT UNSIGNED,
    FOREIGN KEY (product_category) REFERENCES product_category(id)
);

CREATE TABLE products_ordered(
    order_id INT UNSIGNED,
    product_id INT UNSIGNED,
    product_quantity INT UNSIGNED,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE employee (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_firstname VARCHAR(60),
    employee_familyname VARCHAR(100),
    NIF VARCHAR(9),
    phone_number VARCHAR(20),
    store_assigned INT UNSIGNED,
    FOREIGN KEY (store_assigned) REFERENCES store(id)
);

CREATE TABLE order_processed_by (
    order_id INT UNSIGNED,
    processed_by INT UNSIGNED,
    time_processed TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (order_id, processed_by),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (processed_by) REFERENCES employee(id)
);

