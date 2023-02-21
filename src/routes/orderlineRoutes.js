const { Router } = require('express');
const orderlines = require('../controllers/orderlineController.js');
var router = Router();
const ROLES_LIST = require('../../config/role_list');
const verifyRoles = require('../middleware/verifyRoles');

router.get('/', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Employee), orderlines.getOrderlines);
router.get('/:id', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Employee), orderlines.getOrderlineByID);
router.post('/', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Employee), orderlines.addOrderline);
router.delete('/', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Employee), orderlines.removeOrderline);
router.put('/', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Employee), orderlines.updateOrderline);
module.exports = router;

