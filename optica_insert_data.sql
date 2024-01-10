INSERT INTO suppliers (supplier_name, street, street_number, floor, door, city, postal_code, country, phone_number, fax_number, tax_identification_number) VALUES ("firstSupplier", "C/Mallorca", "123", "bj", "1a", "Barcelona", "08010", "España", "654321123", NULL, "A3212321");

INSERT INTO suppliers (supplier_name, street, street_number, floor, door, city, postal_code, country, phone_number, fax_number, tax_identification_number) VALUES ("secondSupplier", "C/Valencia", "456", "1º", "2a", "Barcelona", "08011", "España", "123456789", NULL, "B123456");

INSERT INTO suppliers (supplier_name, street, street_number, floor, door, city, postal_code,country, phone_number, fax_number, tax_identification_number) VALUES ("thirdSupplier", "C/Aragon", "789", "2º", "2a", "Barcelona", "08012", "España", "987654321", NULL, "C987654");

INSERT INTO glasses (brand, supplied_by, left_eye_graduation, left_eye_degree, right_eye_graduation, right_eye_degree, frame_type, frame_color, left_glass_color, right_glass_color, price) VALUES ("Rayban", 1, 0.7, 90, 1.2, 110,"floating", "blue", "pink", "pink", 93);

INSERT INTO glasses (brand, supplied_by, left_eye_graduation, left_eye_degree, right_eye_graduation, right_eye_degree, frame_type, frame_color, left_glass_color, right_glass_color, price) VALUES ("Tom Ford", 2, 0.8, 10, 1.3, 120,"paste", "green", "transparent", "transparent", 103);

INSERT INTO glasses (brand, supplied_by, left_eye_graduation, left_eye_degree, right_eye_graduation, right_eye_degree, frame_type, frame_color, left_glass_color, right_glass_color, price) VALUES ("Gucci", 2, 0.8, 10, 1.3, 120,"paste", "red", "transparent", "transparent", 103);

INSERT INTO customers (customer_name, street, street_number, floor, door, city, postal_code, country, phone_number, email, registration_date) VALUES ("John Gotti", "Mulberry Street", "20", "2º", "3ª", "New York", "10013", "Gringolandia", "123456", "john@fakemail.com", "2024-01-09");

INSERT INTO customers (customer_name, street, street_number, floor, door, city, postal_code, country, phone_number, email, registration_date) VALUES ("Carlo Corleone", "Houston Street", "30", "1º", "2ª", "New York", "10013", "Gringolandia", "654321", "carlo@fakemail.com", "2024-01-09");

INSERT INTO employees (employee_name) VALUES ("Rio Rodriguez");

INSERT INTO sales (glasses_sold, sold_by, sold_to, sale_date) VALUES (1, 1, 1, "2024-01-09");

INSERT INTO sales (glasses_sold, sold_by, sold_to, sale_date) VALUES (2, 1, 2, "2024-01-09");

INSERT INTO recommendations(new_customer, recommended_by) VALUES (1, 2);



