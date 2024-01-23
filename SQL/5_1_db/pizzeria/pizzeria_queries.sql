-- Llista quantes comandes ha efectuat un determinat empleat/da.

SELECT COUNT(processed_by) FROM order_processed_by opb JOIN employee e ON opb.processed_by = e.id WHERE e.id = 1;

--Llista quants productes de tipus “Begudes”. s'han venut en una determinada localitat.

-- SELECT SUM(product_quantity) Number_sold_beverages FROM products_ordered po JOIN orders o ON po.order_id = o.id JOIN store s ON o.store_id = s.id JOIN products p ON po.product_id = p.id JOIN product_category pc ON p.product_category = pc.id WHERE pc.category = "Beverage";