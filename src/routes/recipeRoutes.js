const {Router} = require('express');
const recipe = require('../controllers/recipeControllers.js');
var router = Router();

router.get('/', recipe.getRecipes);
router.post('/', recipe.addRecipes);
router.delete('/', recipe.removeRecipe);
router.put('/', recipe.updateRecipe);
module.exports = router;

