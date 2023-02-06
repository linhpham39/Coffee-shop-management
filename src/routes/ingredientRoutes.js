const {Router} = require('express');
const ingredients = require('../controllers/ingredientController');
var router = Router();

router.get('/:id', ingredients.getIngredientByID);
router.get('/', ingredients.getIngredients);
router.put('/:id', ingredients.updateIngredient);
router.post('/', ingredients.addIngredient);
router.delete(':id', ingredients.deleteIngredient);
module.exports = router;