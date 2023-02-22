const { Router } = require('express');
const ingredients = require('../controllers/ingredientController');
var router = Router();
const ROLES_LIST = require('../../config/role_list');
const verifyRoles = require('../middleware/verifyRoles');

router.get('/:id', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Employee), ingredients.getIngredientByID);
router.get('/', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Employee), ingredients.getIngredients);
router.put('/:id', verifyRoles(ROLES_LIST.Manager), ingredients.updateIngredient);
router.post('/', verifyRoles(ROLES_LIST.Manager), ingredients.addIngredient);
router.delete('/:id', verifyRoles(ROLES_LIST.Manager), ingredients.deleteIngredient);
module.exports = router;