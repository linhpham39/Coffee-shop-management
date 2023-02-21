const getProducts = 'SELECT * FROM products';
const getProductById = 'SELECT * FROM products WHERE product_id = $1';
const addProduct = 'INSERT INTO products VALUES($1, $2 ,$3, $4, $5, $6)';
const removeProduct = 'DELETE FROM products WHERE product_id = $1';
const updateProduct = 'UPDATE products SET name = $2, category = $3, selling_price = $4, state = $5, profit = $6 WHERE product_id = $1';
const showIngredient = `SELECT product_id, p.name, i.name, r.ingRedient_mass FROM products p NATURAL JOIN recipes r 
                        JOIN ingredients i
                        ON i.ingredient_id = r.ingredient_id
                        WHERE p.product_id = $1
                        `;
const rankProduct = `select * from high_consumed_product()`
    
module.exports = {
    getProducts, 
    getProductById,
    addProduct,
    removeProduct, 
    updateProduct,
    showIngredient,
    rankProduct
}