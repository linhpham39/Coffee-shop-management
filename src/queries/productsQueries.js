const getProducts = 'SELECT * FROM products';
const getProductById = 'SELECT * FROM products WHERE product_id = $1';
const addProduct = 'INSERT INTO products VALUES($1, $2, ,$3, $4, $5, $6)';
const removeProduct = 'DELETE FROM products WHERE product_id = $1';
const updateProduct = 'UPDATE products SET name = $2 and category = $3 and selling_price = $4 and state = $5 and revenue = $6 WHERE product_id = $1'

module.exports = {
    getProducts, 
    getProductById,
    addProduct,
    removeProduct, 
    updateProduct
}