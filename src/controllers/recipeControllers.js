const pool = require('../../db');
const queries = require('../queries/recipeQueries');

//Lấy tất cả recipes 
const getRecipes = (req, res) => {
    pool.query(queries.getRecipes, (error, results) => {
        if (error) throw error;
        res.status(200).json(results.rows);
    })
}

//Thêm 1 recipe
const addRecipes = (req, res) => {
    const { product_id, ingredient_id, ingredient_mass } = req.body;
    pool.query(queries.addRecipes, [product_id, ingredient_id, ingredient_mass], (error, results) => {
        if (error) throw (error)
        res.status(200).send("Add recipe successfully!");
    })

}

//xóa đi 1 recipe với productID và ingredientID
const removeRecipe = (req, res) => {
    const { product_id, ingredient_id } = req.body;
    pool.query(queries.getSpecific, [product_id, ingredient_id], (error, results) => {
        if (results.rows.length == 0) {
            res.send("The recipe does not exist!");
        }
        pool.query(queries.removeRecipe, [product_id, ingredient_id], (error, results) => {
            if (error) throw (error)
            res.status(200).send("Delete recipe successfully!");
        });
    });
}

//cập nhật lại Recipe
const updateRecipe = (req, res) => {
    const { product_id, ingredient_id, ingredient_mass } = req.body;
    pool.query(queries.getSpecific, [product_id, ingredient_id], (error, results) => {
        if (results.rows.length == 0) {
            res.send("The recipe does not exist!");
        }
        pool.query(queries.updateRecipe, [ingredient_mass, product_id, ingredient_id], (error, results) => {
            if (error) throw (error)
            res.status(200).send("Update recipe successfully!");
        });
    });
}

module.exports = {
    getRecipes,
    addRecipes,
    removeRecipe,
    updateRecipe
}