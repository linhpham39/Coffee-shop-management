const getEmployees = 'SELECT * FROM employees';
const getEmployeeById = "SELECT * FROM employees WHERE employee_id = $1";
const checkEmailExists = 'SELECT * FROM employees where email = $1';
const addEmployee = 'INSERT INTO employees VALUES($1, $2, $3, $4, $5, $6)';
const removeEmployee = 'DELETE FROM employees WHERE employee_id = $1';
const updateEmployee = 'UPDATE employees SET salary = $1 WHERE employee_id = $2';
const notHardWork = 'select * from f_least_takeOrder_emps($1, $2)';

module.exports = {
    getEmployees,
    getEmployeeById,
    checkEmailExists,
    addEmployee,
    removeEmployee,
    updateEmployee,
    notHardWork
}