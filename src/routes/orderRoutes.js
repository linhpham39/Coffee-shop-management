const { Router } = require('express');
const orders = require('../controllers/orderController');
var router = Router();
const ROLES_LIST = require('../../config/role_list');
const verifyRoles = require('../middleware/verifyRoles');

router.get('/:id', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Employee), orders.getOrderById);
router.get('/', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Employee), orders.getAllOrders);
router.post('/add', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Employee), orders.addOrder);
router.get('/orderlines/:id', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Employee), orders.showOrderlines);
router.post('/revenue-period', verifyRoles(ROLES_LIST.Manager), orders.calculateRevenue);
router.post('/profit-period', verifyRoles(ROLES_LIST.Manager), orders.calculateProfit);
//show ra các order trong một ngày

// các chức năng của order:
/* 
- add 1 order
- delete 1 order
- show ra các orderlines của order đó dựa trên order_id
- show ra các order trong 1 ngày
- tính tổng doanh thu từ date1 đến date 2
- tính tổng lợi nhuận từ date 1 đến date 2
*/


module.exports = router;