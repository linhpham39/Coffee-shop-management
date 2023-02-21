const { Router } = require('express');
const customers = require('../controllers/customerController');
var router = Router();
const ROLES_LIST = require('../../config/role_list');
const verifyRoles = require('../middleware/verifyRoles');

router.get('/', verifyRoles(ROLES_LIST.Manager), customers.getCusomter);
router.post('/signup', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Employee), customers.signUp);
router.post('/login', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Customer), customers.login);
router.put('/updatePassword', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Customer), customers.updatePassword);
router.get('/expense/:id', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Customer), customers.getExpense);
module.exports = router;