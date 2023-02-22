const { Router } = require('express');
const employees = require('../controllers/employeeController');
var router = Router();
const ROLES_LIST = require('../../config/role_list');
const verifyRoles = require('../middleware/verifyRoles');

router.get('/:id', verifyRoles(ROLES_LIST.Manager), employees.getEmployeeById);
router.get('/', verifyRoles(ROLES_LIST.Manager), employees.getEmployees);
router.post('/', verifyRoles(ROLES_LIST.Manager), employees.addEmployee);
router.put('/:id', verifyRoles(ROLES_LIST.Manager), employees.updateEmployee);
router.delete('/:id', verifyRoles(ROLES_LIST.Manager), employees.removeEmployee);
router.get('/decs', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Employee), employees.notHardWork);
module.exports = router;