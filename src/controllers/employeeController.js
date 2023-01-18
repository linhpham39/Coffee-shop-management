const pool  = require('../../db');
const queries = require('../queries/employeeQueries')

const getEmployees = (req, res) => {
    pool.query(queries.getEmployees, (error, results)=>{
        if(error) throw error;
        res.status(200).json(results.rows);
    });
}


const getEmployeeById = (req, res) => {
    var id = req.params.id;
    pool.query(queries.getEmployeeById,[id], (error, results)=>{
        if(error) throw error;
        res.status(200).json(results.rows);
    });
}

const addEmployee = (req, res) => {
    const {employee_id, name, salary, email, dob, password} = req.body;
    //check if email exists
    pool.query(queries.checkEmailExists, [email], (error, results) =>{
        if(results.rows.length){
            res.send("email already exists");
        };

        //add student to db
        pool.query(queries.addEmployee, [employee_id, name, salary, email, dob, password], (error, results)=>{
            if(error) throw error;
            res.status(201).send("Create employee successfully!");
        });
    });
}

const removeEmployee = (req, res) => {
    const id = req.params.id;
    pool.query(queries.getEmployeeById, [id], (error, results) =>{
        if(!results.rows.length)
            res.send("Employee does not exist in the database");
        
        //delete employee
        pool.query(queries.removeEmployee, [id], (error, results) =>{
            if(error) throw error;
            res.status(200).send('Remove successfully!');
        });
    })
};

const updateEmployee = (req, res)=>{
    const id = req.params.id;
    const {salary} = req.body;
    pool.query(queries.getEmployeeById, [id], (error, results) =>{
        if(!results.rows.length)
            res.send("Employee does not exist in the database");
        
        //update
        
        pool.query(queries.updateEmployee, [salary, id], (error, results) =>{
            if(error)   throw error;
            res.status(200).send('Update employee successfully');
        });
    })
};

module.exports = {
    getEmployees,
    getEmployeeById,
    addEmployee,
    removeEmployee,
    updateEmployee,
}