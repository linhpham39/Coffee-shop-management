const {Router} = require('express');
const product = require('../controllers/productController');
var router = Router();

router.get('/:id', product.getProductById);
router.get('/', product.getAllProducts);
router.post('/', product.addProduct);
router.delete('/:id', product.removeProduct);
router.put('/', product.updateProduct);
router.get('/recipe/:id', product.showIngredient);

module.exports = router;