const getOrderline = 'select * from orderlines';
const getOrderlineByID = 'select * from orderlines where order_id = $1';
const getSpecificOrl = 'select * from orderlines where order_id = $1 and product_id = $2';
const addOrderline = 'insert into orderlines values ($1, $2, $3)';
const removeOrderline = 'delete from orderlines where order_id = $1 and product_id = $2';
const updateOrderline = 'update orderlines set quantity = $1 where order_id = $2 and product_id = $3';

module.exports = {
    getOrderline,
    getOrderlineByID,
    getSpecificOrl,
    addOrderline,
    removeOrderline,
    updateOrderline
}