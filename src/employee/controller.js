const pool  = require('../../db');

const getEmployees = (req, res) => {
    pool.query('SELECT * FROM employees', (error, results)=>{
        if(error) throw error;
        res.status(200).json(results.rows);
    });
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
module.exports = {
    getEmployees,
}