const express = require('express');
//const employeeRoutes = require('./src/routes/employeeRoutes');
const customerRoutes = require('./src/routes/customerRoutes');
const app = express();
const port = 8000;

app.use(express.json());

app.get('/', (req, res) => {
    res.send('hello');
});

app.use('/customers', customerRoutes);
//app.use('/employees', employeeRoutes);
app.listen(port, () => console.log(`app listening on port  ${port}`));