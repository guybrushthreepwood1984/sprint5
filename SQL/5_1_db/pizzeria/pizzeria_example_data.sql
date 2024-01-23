
INSERT INTO customer (customer_name, last_name, street, street_number, door, postal_code, city, country, province, phone_number)
VALUES ('Carlos', 'Gomez', 'Carrer de la Marina', '123', '1A', '08013', 'Barcelona', 'Spain', 'Catalonia', '123-456-789'),
       ('Maria', 'Lopez', 'Avinguda Diagonal', '456', '2B', '08028', 'Barcelona', 'Spain', 'Catalonia', '987-654-321');
       
INSERT INTO store (street, street_number, door, postal_code, city, country, province)
VALUES ('Carrer de la Marina', '123', '1A', '08013', 'Barcelona', 'Spain', 'Catalonia'),
       ('Avinguda Diagonal', '456', '2B', '08028', 'Barcelona', 'Spain', 'Catalonia');
       
INSERT INTO orders (ordered_by, delivery_or_pick_up, total_price, store_id)
VALUES (1, "Delivery", 19.99, 1),
       (2, "Pick up", 29.99, 1);

INSERT INTO employee (employee_firstname, employee_familyname, NIF, phone_number, store_assigned)
VALUES ('Juan', 'Martinez', '12345678Z', '123-456-789', 1),
       ('Ana', 'Garcia', '98765432Y', '987-654-321', 2);

INSERT INTO product_category (category)
VALUES ('Pizza'), 
       ('Hamburger'), 
       ('Beverage');

INSERT INTO products (product_name, product_description, product_category, price)
VALUES ('Margherita Pizza', 'Classic Italian pizza with tomatoes, mozzarella, fresh basil, salt, and extra-virgin olive oil.', 1, 10),
       ('Pepperoni Pizza', 'Pizza topped with mozzarella cheese and pepperoni.', 1, 12),
       ('Veggie Pizza', 'Pizza topped with bell peppers, onions, and olives.', 1, 11),
       ('Veggie Burger', 'Long live the beans.', 2, 11),
       ('Coca Cola', 'Refreshing soft drink.', 3, 3),
       ('Water', 'Bottled water.', 3, 2),
       ('Beer', 'Local craft beer.', 3, 4);

      
INSERT INTO products_ordered (order_id, product_id, product_quantity)
VALUES (1, 1, 1), 
        (1, 5, 2);

INSERT INTO order_processed_by (order_id, processed_by)
VALUES (1, 1);




