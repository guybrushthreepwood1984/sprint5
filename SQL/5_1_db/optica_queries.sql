--Lista el total de compres d'un client: 
-- SELECT customers.customer_name, glasses.brand, sales.sale_date FROM sales JOIN customers ON customers.id = sales.sold_to JOIN glasses ON glasses.id = sales.glasses_sold WHERE customer_name = "John Gotti";

--Lista diferentes gafas que ha vendido un empleado durant un año:
-- SELECT employees.employee_name, glasses.brand FROM employees JOIN sales ON employees.id = sales.sold_by JOIN glasses ON glasses.id = sales.glasses_sold WHERE YEAR(sales.sale_date) = 2024;

--Lista los diferentes proveedors que han suministrado gafas vendidas con éxito en la optica
--SELECT suppliers.supplier_name, glasses.brand FROM suppliers JOIN glasses ON suppliers.id = glasses.supplied_by JOIN sales ON glasses.id = sales.glasses_sold;
