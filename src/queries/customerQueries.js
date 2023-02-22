const getCustomers = 'SELECT * FROM customers';
const getCustomerByEmail = 'SELECT email, password FROM customers WHERE email = $1';
const addCustomer = 'INSERT INTO customers VALUES($1, $2, $3, $4, $5, $6, $7)';
const updatePassword = 'UPDATE customers SET password = $1 WHERE email = $2';
const getExpense = 'select * from count_expense_customer($1)';
<<<<<<< HEAD
const mostConsumedCus = 'select * from high_expense_customer()';
=======
const rankCustomer = 'select * from high_expense_customer()';
const potentialCustomer = 'select * from potential_customer($1,$2)';
const orderCustomer = 'select * from customer_orders($1)';
>>>>>>> 199fc633b1ee3394fa7c43227429b9a86ddf19dd

module.exports = {
    getCustomers,
    getCustomerByEmail,
    addCustomer,
    updatePassword,
    getExpense,
<<<<<<< HEAD
    mostConsumedCus
=======
    rankCustomer,
    potentialCustomer,
    orderCustomer
>>>>>>> 199fc633b1ee3394fa7c43227429b9a86ddf19dd
}