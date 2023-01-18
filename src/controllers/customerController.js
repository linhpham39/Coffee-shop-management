const pool  = require('../../db');
const queries = require('../queries/customerQueries');

//liet ke tat ca cac khach hang
const getCusomter = (req, res)=>{
    pool.query(queries.getCustomers, (error, results) =>{
        if(error) throw error;
        res.status(200).json(results.rows);
    });
};

//dang ky tai khoan cho customer, neu email bi trung roi thi thong bao loi
const signUp = (req, res) => {
    const {name, customer_id, dob, password, rank, email} = req.body;
    pool.query(queries.getCustomerByEmail, [email], (error, results)=> {
        if(error)   throw error;
        if(results.rows.length <= 0){
            pool.query(queries.addCustomer, [name, customer_id, dob, password, rank, email], (error, results)=>{
                if(error)   throw error;
                return res.status(200).json('Successfully registered');
            })
        }else{
            return res.status(400).json('Email already exist');
        }
    }) 
}

//dang nhap
const login = (req, res)=>{
    const {email, password} = req.body;
    pool.query(queries.getCustomerByEmail, [email], (error, results) =>{
        if(error) throw error;
        if(!results.rows.length || results.rows[0].password != password)
            res.status(401).json('Incorrect Username or Password');
        else if(results.rows[0].password == password)
            res.status(200).json('Login successfully');
    })
}
module.exports = {
    signUp,
    getCusomter,
    login,
}