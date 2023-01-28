const getAllOrders = 'SELECT * FROM orders';
const addOrder = 'INSERT INTO orders VALUES($1, $2, $3, $4, $5)';
const showOrderlines = 'SELECT order_id, product_id, name, quantity FROM orderlines natural join products WHERE order_id = $1'


module.exports = {
    getAllOrders,
    addOrder,
    showOrderlines
}