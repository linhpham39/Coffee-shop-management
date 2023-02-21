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
    const {name, customer_id, dob, password, rank, email, spend} = req.body;
    pool.query(queries.getCustomerByEmail, [email], (error, results)=> {
        if(error)   throw error;
        if(results.rows.length <= 0){
            pool.query(queries.addCustomer, [name, customer_id, dob, password, rank, email, spend], (error, results)=>{
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

//đổi mật khẩu
const updatePassword = (req, res) =>{
    const {email, currentPassword, newPassword} = req.body;
    pool.query(queries.getCustomerByEmail, [email], (error, results) =>{
        if(error) throw error;
        if(!results.rows.length || results.rows[0].password != currentPassword)
            res.status(401).json('Incorrect Username or old Password');
        else if(results.rows[0].password == currentPassword)
            //nếu nhập mật khẩu hiện tại đúng => đổi sang mật khẩu mới
            pool.query(queries.updatePassword, [newPassword, email], (error, results)=>{
                if(error) throw error;
                console.log(newPassword);
                res.status(200).json('Update password successfully!');  

            })

    })
}

//cập nhật lại rank done 

//customer xem minh da tieu bnhieu
const getExpense = (req, res) =>{
    var id = req.params.id;
    pool.query(queries.getExpense, [id], (error, results) =>{
        if (error) throw error;
        res.status(200).json(results.rows);
    })
}

module.exports = {
    signUp,
    getCusomter,
    login,
    updatePassword,
    getExpense
}