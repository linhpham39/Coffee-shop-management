const getAllOrders = 'SELECT * FROM orders';
const addOrder = 'INSERT INTO orders VALUES($1, $2, $3, $4, $5)';
const showOrderlines = 'SELECT * FROM view_orderlines WHERE order_id = $1'
const getOrderById = '  SELECT * FROM orders WHERE order_id = $1';
const calculateRevenue = `SELECT f_revenue_period($1, $2)`;
const calculateProfit = 'SELECT f_profit_period($1, $2)';
module.exports = {
    getAllOrders,
    addOrder,
    showOrderlines,
    getOrderById,
    calculateRevenue,
    calculateProfit
}