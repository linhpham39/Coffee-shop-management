const getRecipes = 'select * from recipes';
const addRecipes = 'insert into recipes(product_id, ingredient_id, ingredient_mass) values ($1, $2, $3)';
const getSpecific = 'select * from recipes where product_id = $1 and ingredient_id = $2'
const removeRecipe = 'delete from recipes where product_id = $1 and ingredient_id = $2';
const updateRecipe = 'update recipes set ingredient_mass = $1 where product_id = $2 and ingredient_id = $3'

module.exports = {
    getRecipes,
    addRecipes,
    getSpecific,
    removeRecipe,
    updateRecipe
}