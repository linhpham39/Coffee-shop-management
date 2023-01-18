const {Router} = require('express');
const employees = require('../controllers/employeeController');
var router = Router();

router.get('/:id', employees.getEmployeeById);
router.get('/', employees.getEmployees);
router.post('/', employees.addEmployee);
router.put('/:id', employees.updateEmployee);
router.delete('/:id', employees.removeEmployee);
module.exports = router;