const pool = require('../../db');
const queries = require('../queries/orderQueries');

const getAllOrders = (req, res)=>{
    pool.query(queries.getAllOrders, (error, results) =>{
        if(error) throw error;
        res.status(200).json(results.rows);
    })
}

const getOrderById = (req, res) =>{
    const id = req.params.id;
    pool.query(queries.getOrderById, [id], (error, results) =>{
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

//show ra các orderline của 1 order. truyền vào orderID
const showOrderlines = (req, res)=>{
    const id = req.params.id;
    pool.query(queries.showOrderlines, [id], (error, results)=>{
        if(error) throw error;
        res.status(200).json(results.rows);
    })
}


const calculateRevenue = (req, res) =>{
    const {date1, date2} = req.body;
    pool.query(queries.calculateRevenue, [date1, date2], (error, results)=>{
        if(error) throw error;
        res.status(200).json(results.rows);
    })
}

//tinh loi nhuan tu date a den date b
const calculateProfit = (req, res) =>{
    const {date1, date2} = req.body;
    pool.query(queries.calculateProfit, [date1, date2], (error, results)=>{
        if(error) throw error;
        res.status(200).json(results.rows);
    })
}

module.exports = {
    getAllOrders,
    addOrder,
    showOrderlines,
    getOrderById,
    calculateRevenue,
    calculateProfit
}