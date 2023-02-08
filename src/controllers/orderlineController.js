const pool  = require('../../db');
const queries = require('../queries/orderlineQueries');



const getOrderlines = (req, res) =>{
    pool.query('SELECT * FROM orderlines', (error, results) =>{
        if(error) throw error;
        res.status(200).json(results.rows);
    });
}

module.exports = {
    getOrderlines
}