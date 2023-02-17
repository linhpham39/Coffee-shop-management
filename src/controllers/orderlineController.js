const pool  = require('../../db');
const queries = require('../queries/orderlineQueries');

const getOrderlines = (req, res) => {
    pool.query(queries.getOrderline, (error, results) => {
        if (error) throw error;
        res.status(200).json(results.rows);
    })
}

const getOrderlineByID = (req,res) =>{
    var id = req.params.id
    pool.query(queries.getOrderlineByID, [id], (error, results) =>{
        if(error) throw error;
        res.status(200).json(results.rows);
    })
}

const addOrderline = (req, res) =>{
    const {order_id, product_id, quantity} = req.body;
    pool.query(queries.addOrderline, [order_id, product_id, quantity], (error, results) =>{
        if (error) throw error;
        res.status(200).send('Add orderline successfully!');
    })
}

const removeOrderline = (req,res) =>{
    const {order_id, product_id} = req.body;
    pool.query(queries.getSpecificOrl, [order_id, product_id], (error, results) =>{
        if (results.rows.length == 0) {
            res.send("The orderline does not exist!");
        }
        pool.query(queries.removeOrderline, [order_id, product_id], (error, results) => {
            if (error) throw (error)
            res.status(200).send("Delete orderline successfully!");
        });
    })
}
const updateOrderline = (req, res) => {
    const { order_id, product_id, quantity } = req.body;
    pool.query(queries.getSpecificOrl, [order_id, product_id], (error, results) => {
        if (results.rows.length == 0) {
            res.send("The orderline does not exist!");
        }
        pool.query(queries.updateOrderline, [quantity, order_id, product_id], (error, results) => {
            if (error) throw (error)
            res.status(200).send("Update recipe successfully!");
        });
    });
}

module.exports = {
    getOrderlines,
    getOrderlineByID,
    addOrderline,
    removeOrderline,
    updateOrderline
}