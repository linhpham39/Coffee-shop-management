const {Router} = require('express');
const orders = require('../controllers/orderController');
var router = Router();


router.get('/:id', orders.getOrderById);
router.get('/', orders.getAllOrders);
router.post('/add', orders.addOrder);
router.get('/orderlines/:id', orders.showOrderlines);
router.post('/revenue-period', orders.calculateRevenue);
router.post('/profit-period', orders.calculateProfit);
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