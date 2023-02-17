const express = require('express');
const employeeRoutes = require('./src/routes/employeeRoutes');
const customerRoutes = require('./src/routes/customerRoutes');
const ingredientRoutes = require('./src/routes/ingredientRoutes');
const productRoutes = require('./src/routes/productRoutes');
const orderRoutes = require('./src/routes/orderRoutes');
const recipeRoutes = require('./src/routes/recipeRoutes.js');
const orderlineRoutes = require('./src/routes/orderlineRoutes.js');
const app = express();
const port = 8000;

app.use(express.json());

app.get('/', (req, res) => {
    res.send('hello');
});

app.use('/customers', customerRoutes);
app.use('/employees', employeeRoutes);
app.use('/products', productRoutes);
app.use('/ingredients', ingredientRoutes);
app.use('/orders', orderRoutes);
app.use('/recipes', recipeRoutes);
app.use('/orderlines', orderlineRoutes);
app.listen(port, () => console.log(`App listening on port http://localhost:${port}`));