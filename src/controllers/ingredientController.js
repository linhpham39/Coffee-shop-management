const pool = require('../../db');
const queries = require('../queries/ingredientQueries')

const getIngredients = (req, res) => {
    pool.query(queries.getIngredients, (error, results) => {
        if (error) throw error;
        res.status(200).json(results.rows);
    });
}

const getIngredientByID = (req, res) => {
    var id = req.params.id;
    pool.query(queries.getIngredientByID, [id], (error, results) => {
        if (error) throw error;
        res.status(200).json(results.rows);
    });
}

const updateIngredient = (req, res) => {
    var id = req.params.id;
    const { ingredient_id, price_per_kg, name, available_mass } = req.body;
    pool.query(queries.getIngredientByID, [id], (error, results) => {
        if (results.rows.length == 0)
            res.send("Ingredient does not exist in the database");
        //update
        pool.query(queries.updateIngredient, [price_per_kg, name, available_mass, ingredient_id], (error, results) => {
            if (error) throw error;
            res.status(200).send('Update ingredient successfully');
        });
    })
};

const addIngredient = (req, res) => {
    const { ingredient_id, price_per_kg, name, available_mass } = req.body;
    pool.query(queries.getIngredientByName, [name], (error, results) => {
        if(results.rows.length != 0){
            res.send("This ingredient's name is already exist");
        };
        pool.query(queries.addIngredient, [ingredient_id, price_per_kg, name, available_mass], (error, results) =>{
            if(error) throw error;
            res.status(200).send("Add ingredient successfully!");
        });
    });
}

const deleteIngredient = (req, res) => {
    var id = req.params.id;
    pool.query(queries.getIngredientByID, [ingredient_id], (error, results) =>{
        if(results.rows.length == 0){
            res.send("The ingredient does not exist!");
        }
        pool.query(queries.deleteIngredient,[ingredient_id],(error, results)=>{
            if(error) throw error;
            res.status(200).send("Delete ingredient successfully");
        });
    });
};
module.exports = {
    getIngredients,
    getIngredientByID,
    updateIngredient,
    addIngredient,
    deleteIngredient,
}