-- VIEW ON ORDERLINES AND PRODUCTS 
--để xem các product có trong một order
CREATE VIEW view_orderlines AS
SELECT order_id, product_id, name, quantity
FROM orderlines NATURAL JOIN products

-- VIEW ON INGREDIENTS AND PRODUCTS
-- để xem các thành phần của 1 product gồm những ingredients và số lượng
CREATE VIEW view_ingredients AS
SELECT product_id, p.name as "product_name", i.name as "ingredient_name", r.ingredient_mass 
FROM products p NATURAL JOIN recipes r 
                NATURAL JOIN ingredients i

-- VIEW ON PRODUCTS AND ORDERLINES
-- để xem các products xếp hạng theo thứ tự số lượng đã bán đi
CREATE VIEW view_ingredients AS
SELECT product_id, p.name as "product_name", i.name as "ingredient_name", r.ingredient_mass 
FROM products p NATURAL JOIN recipes r 
                NATURAL JOIN ingredients i