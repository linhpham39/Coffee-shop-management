const { Router } = require('express');
const product = require('../controllers/productController');
var router = Router();
const ROLES_LIST = require('../../config/role_list');
const verifyRoles = require('../middleware/verifyRoles');

router.get('/rank', verifyRoles(ROLES_LIST.Manager), product.rankProduct);
router.get('/:id', product.getProductById);
router.get('/', product.getAllProducts);
router.post('/', verifyRoles(ROLES_LIST.Manager), product.addProduct);
router.delete('/:id', verifyRoles(ROLES_LIST.Manager), product.removeProduct);
router.put('/', verifyRoles(ROLES_LIST.Manager), product.updateProduct);
router.get('/recipe/:id', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Employee), product.showIngredient);
router.get('/filter', product.filter);

module.exports = router;