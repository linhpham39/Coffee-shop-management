
const pool  = require('../../db');
const queries = require('../queries/productsQueries')

const getAllProducts = (req, res) =>{
    pool.query(queries.getProducts, (error, results)=>{
        if(error) throw error;
        res.status(200).json(results.rows);
    }) 
}

const getProductById = (req, res) => {
    var id = req.params.id;
    pool.query(queries.getProductById , [id], (error, results) => {
        if(!results.rows.length)    res.send("Product does not exist");
        res.status(200).json(results.rows);
    })
}

const addProduct = (req, res) =>{
    const {product_id, name, category, selling_price, state, revenue} = req.body;
    console.log(1);
    pool.query(queries.addProduct, [product_id, name, category, selling_price, state, revenue], (error, results)=>{
        if(error) throw error; 
        res.status(200).send('Successfully add product');
    })
}

const removeProduct= (req, res) => {
    const id = req.params.id;
    pool.query(queries.getProductById, [id], (error, results) =>{
        if(!results.rows.length)
            res.send("Product does not exist in the database");
        
        //delete product
        pool.query(queries.removeProduct, [id], (error, results) =>{
            if(error) throw error;
            res.status(200).send('Remove successfully!');
        });
    })
};

const updateProduct = (req, res) =>{
    const {product_id, name, category, selling_price, state, revenue} = req.body;
    pool.query(queries.getProductById, [product_id], (error, results) =>{
        if(!results.rows.length)
            res.send("Product does not exist in the database");
        
        //update product
        pool.query(queries.updateProduct, [product_id, name, category, selling_price, state, revenue], (error, results) =>{
            if(error) throw error;
            res.status(200).send('Update successfully!');
        });
    })
}

const showIngredient = (req, res)=>{
    const id = req.params.id;
    pool.query(queries.showIngredient, [id], (error, results)=>{
        if(error) throw error;
        res.status(200).json(results.rows);
    })
}

module.exports = {
    getAllProducts,
    getProductById,
    addProduct,
    removeProduct,
    updateProduct,
    showIngredient
}

/*
/order- id, fgafd
 /order/id
 {
    {

    },
    {

    },
    {

    },
 }

*/
//get all product,
//hiển thị theo category
//get product by id,
//
//delete product
//get ingredient by product id
// 
//pr
//product/ingredient/3
//select * from ingredients i join recipes r
// where   r.product_id = $1 
//update giá tiền product 