const pool = require('../../db');
const queries = require('../queries/recipeQueries');

const getRecipes = (req, res) => {
    pool.query(queries.getRecipes, (error, results) => {
        if (error) throw error;
        res.status(200).json(results.rows);
    })
}

const addRecipes = (req, res) => {
    const { product_id, ingredient_id, ingredient_mass } = req.body;
    pool.query(queries.addRecipes, [product_id, ingredient_id, ingredient_mass], (error, results) => {
        if (error) throw (error)
        res.status(200).send("Add recipe successfully!");
    })

}

// const getSpecific = (req, res) => {
//     const{product_id, ingredient_id} = req.body;
//     pool.query(queries.getSpecific, [product_id, ingredient_id], (error, results) => {
//         if(error) throw (error);
//         res.status(200).json(results.rows);
//     })
// }

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
    // getSpecific,
    removeRecipe,
    updateRecipe
}