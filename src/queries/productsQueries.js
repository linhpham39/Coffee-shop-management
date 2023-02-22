const getProducts = 'SELECT * FROM products';
const getProductById = 'SELECT * FROM products WHERE product_id = $1';
const addProduct = 'INSERT INTO products VALUES($1, $2 ,$3, $4, $5, $6)';
const removeProduct = 'DELETE FROM products WHERE product_id = $1';
const updateProduct = 'UPDATE products SET name = $2, category = $3, selling_price = $4, state = $5, profit = $6 WHERE product_id = $1';
const showIngredient = `SELECT * from view_ingredients
                        WHERE p.product_id = $1
                        `;
const rankProduct = `SELECT * FROM f_high_consumed_product()`;
const filter = 'select * from f_filter_product($1)';
    
module.exports = {
    getProducts, 
    getProductById,
    addProduct,
    removeProduct, 
    updateProduct,
    showIngredient,
    rankProduct,
    filter,
}