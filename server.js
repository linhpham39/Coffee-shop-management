const express = require('express');
const employeeRoutes = require('./src/routes/employeeRoutes');
const customerRoutes = require('./src/routes/customerRoutes');
const ingredientRoutes = require('./src/routes/ingredientRoutes');
const recipeRoutes = require('./src/routes/recipeRoutes.js');
const app = express();
const port = 8000;

app.use(express.json());

app.get('/', (req, res) => {
    res.send('hello');
});

app.use('/customers', customerRoutes);
app.use('/employees', employeeRoutes);
app.use('/ingredients', ingredientRoutes);
app.use('/recipes', recipeRoutes);
app.listen(port, () => console.log(`App listening on port http://localhost:${port}`));