const getProducts = 'SELECT * FROM products';
const getProductById = 'SELECT * FROM products WHERE product_id = $1';
const addProduct = 'INSERT INTO products VALUES($1, $2, ,$3, $4, $5, $6)';
const removeProduct = 'DELETE FROM products WHERE product_id = $1';
const updateProduct = `UPDATE products SET name = $1 and category = $2, selling_price = $3, state = $4, revenue = $5 WHERE product_id = $6`;
const showIngredient = `SELECT product_id, p.name, i.name, r.ingRedient_mass FROM products p NATURAL JOIN recipes r 
                        JOIN ingredients i
                        ON i.ingredient_id = r.ingredient_id
                        WHERE p.product_id = $1
                        `;


module.exports = {
    getProducts, 
    getProductById,
    addProduct,
    removeProduct, 
    updateProduct,
    showIngredient
}