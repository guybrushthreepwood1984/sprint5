DROP DATABASE pizzeria IF EXISTS;

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

CREATE TABLE orders (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    ordered_by INT UNSIGNED,
    order_date_time DEFAULT CURRENT_TIMPESTAMP,
    delivery_or_pick_up ENUM ("Delivery", "Pick up"),
    number_products INT UNSIGNED,
    total_price INT UNSIGNED,
    FOREIGN KEY (ordered_by) REFERENCES (customer.id)
);

CREATE TABLE ordered_products(
    order INT,
    product_ordered INT,
    PRIMARY KEY (order, product_ordered),
    FOREIGN KEY (order) REFERENCES (orders.id),
    FOREIGN KEY (product_ordered) REFERENCES (products.id)
)

CREATE TABLE products (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(60),
    product_description VARCHAR(100),
    product_category INT,
    product_image MEDIUMBLOB,
    price INT UNSIGNED,
    FOREIGN KEY (product_category) REFERENCES(product_category.id)
);

CREATE TABLE product_category (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category ENUM ("Pizza", "Hamburger", "Beverage"),
    );

CREATE TABLE store (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(60),
    street_number VARCHAR(20),
    door VARCHAR(20),
    postal_code VARCHAR(20),
    city VARCHAR(60),
    country VARCHAR(60),
    province VARCHAR(60),
    order INT,
    FOREIGN KEY (order) REFERENCES (orders.id)
);

CREATE TABLE employee (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_firstname VARCHAR(60),
    employee_familyname VARCHAR(100),
    NIF VARCHAR(9),
    phone_number VARCHAR(20),
    store_assigned INT,
    FOREIGN KEY (store_assigned) REFERENCES (store.id)
);

CREATE TABLE order_processed_by (
    order INT,
    processed_by INT,
    time_processed DEFAULT CURRENT_TIMPESTAMP,
    PRIMARY KEY (order, processed_by),
    FOREIGN KEY (order) REFERENCES (orders.id),
    FOREIGN KEY (processed_by) REFERENCES (employee.id)
);