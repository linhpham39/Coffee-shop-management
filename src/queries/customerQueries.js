const getCustomers = 'SELECT * FROM customers';
const getCustomerByEmail = 'SELECT email, password FROM customers WHERE email = $1';
const addCustomer = 'INSERT INTO customers VALUES($1, $2, $3, $4, $5, $6, $7)';
const updatePassword = 'UPDATE customers SET password = $1 WHERE email = $2';
const getExpense = 'select * from f_count_expense_customer($1)';
const rankCustomer = 'select * from f_high_expense_customer()';
const potentialCustomer = 'select * from f_potential_customer($1,$2)';
const orderCustomer = 'select * from f_customer_orders($1)';

module.exports = {
    getCustomers,
    getCustomerByEmail,
    addCustomer,
    updatePassword,
    getExpense,
    rankCustomer,
    potentialCustomer,
    orderCustomer
}