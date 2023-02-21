const express = require('express');
const employeeRoutes = require('./src/routes/employeeRoutes');
const customerRoutes = require('./src/routes/customerRoutes');
const ingredientRoutes = require('./src/routes/ingredientRoutes');
const productRoutes = require('./src/routes/productRoutes');
const orderRoutes = require('./src/routes/orderRoutes');
const recipeRoutes = require('./src/routes/recipeRoutes.js');
const orderlineRoutes = require('./src/routes/orderlineRoutes.js');
const authRoutes = require('./src/routes/authRoutes');
const verifyJWT = require('./src/middleware/verifyJWT');
const cookieParser = require('cookie-parser');
const refreshTokenRoute = require('./src/routes/refreshTokenRoute');
const logoutRoute = require('./src/routes/logoutRoute');
const app = express();
const port = 8000;

app.use(express.json());

//middleware for cookies
app.use(cookieParser());

app.get('/', (req, res) => {
    res.send('hello');
});

app.use('/auth', authRoutes);
app.use('/refresh', refreshTokenRoute);
app.use('/logout', logoutRoute);
app.use(verifyJWT); 
app.use('/customers', customerRoutes);
app.use('/employees', employeeRoutes);
app.use('/products', productRoutes);
app.use('/ingredients', ingredientRoutes);
app.use('/orders', orderRoutes);
app.use('/recipes', recipeRoutes);
app.use('/orderlines', orderlineRoutes);
app.listen(port, () => console.log(`App listening on port http://localhost:${port}`));