const { Router } = require('express');
const recipe = require('../controllers/recipeControllers.js');
var router = Router();
const ROLES_LIST = require('../../config/role_list');
const verifyRoles = require('../middleware/verifyRoles');

router.get('/', verifyRoles(ROLES_LIST.Manager, ROLES_LIST.Employee), recipe.getRecipes);
router.post('/', verifyRoles(ROLES_LIST.Manager), recipe.addRecipes);
router.delete('/', verifyRoles(ROLES_LIST.Manager), recipe.removeRecipe);
router.put('/', verifyRoles(ROLES_LIST.Manager), recipe.updateRecipe);
module.exports = router;

