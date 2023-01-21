const getIngredients = 'SELECT * FROM ingredients';
const getIngredientByID = 'SELECT * FROM ingredients WHERE ingredient_id = $1';
const getIngredientByName = 'select * from ingredients where name = $1';
const addIngredient = 'insert into ingredients(ingredient_id, price_per_kg, name, available_mass) values ($1,$2,$3,$4)';
const updateIngredient = 'update ingredients set price_per_kg = $1, name = $2, available_mass = $3 where ingredient_id = $4';
const deleteIngredient = 'delete from ingredients where ingredient_id = $1';
module.exports = {
    getIngredients,
    getIngredientByID,
    getIngredientByName,
    addIngredient,
    updateIngredient,
    deleteIngredient,
}