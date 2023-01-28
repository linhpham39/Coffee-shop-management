const pool = require('../../db');
const queries = require('../queries/orderQueries');

const getAllOrders = (req, res)=>{
    pool.query(queries.getAllOrders, (error, results) =>{
        if(error) throw error;
        res.status(200).json(results.rows);
    })
}

const addOrder = (req, res) =>{
    const {order_id, total_price, date, employee_id, customer_id} = req.body;
    pool.query(queries.addOrder, [order_id, total_price, date, employee_id, customer_id], (error, results) =>{
        if(error) throw error;
        res.status(200).json('Add order successfully');
    })
}

const showOrderlines = (req, res)=>{
    const id = req.params.id;
    pool.query(queries.showOrderlines, [id], (error, results)=>{
        if(error) throw error;
        res.status(200).json(results.rows);
    })
}


module.exports = {
    getAllOrders,
    addOrder,
    showOrderlines
}