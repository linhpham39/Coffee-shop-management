-- VIEW ON ORDERLINES AND PRODUCTS 
--để xem các product có trong một order
CREATE VIEW view_orderlines AS
SELECT ol.order_id, ol.product_id, p.name, ol.quantity
FROM orderlines ol JOIN products p ON p.product_id = ol.product_id

-- VIEW ON INGREDIENTS AND PRODUCTS
-- để xem các thành phần của 1 product gồm những ingredients và số lượng
CREATE VIEW view_ingredients AS
SELECT p.product_id, p.name as "product_name", i.name as "ingredient_name", r.ingredient_mass 
FROM products p JOIN recipes r ON p.product_id = r.product_id
                JOIN ingredients i ON r.ingredient_id = i.ingredient_id

-- VIEW ON PRODUCTS AND ORDERLINES
-- để xem các products xếp hạng theo thứ tự số lượng đã bán đi
CREATE VIEW view_products AS
SELECT p.product_id, p.name, ol.quantity
FROM products p JOIN orderlines ol ON p.product_id = ol.product_id 
