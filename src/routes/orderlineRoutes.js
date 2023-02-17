const {Router} = require('express');
const orderlines = require('../controllers/orderlineController.js');
var router = Router();

router.get('/', orderlines.getOrderlines);
router.get('/:id', orderlines.getOrderlineByID);
router.post('/', orderlines.addOrderline);
router.delete('/', orderlines.removeOrderline);
router.put('/', orderlines.updateOrderline);
module.exports = router;

