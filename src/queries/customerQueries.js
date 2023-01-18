const getCustomers = 'SELECT * FROM customers';
const getCustomerByEmail = 'SELECT email, password FROM customers WHERE email = $1';
const addCustomer = 'INSERT INTO customers VALUES($1, $2, $3, $4, $5, $6)';


module.exports = {
    getCustomers,
    getCustomerByEmail,
    addCustomer,
}