const Pool = require("pg").Pool;

var pool = new Pool({
    user: "postgres",
    host: "localhost",
    database: "Coffee Shop Management",
    password: "123123",
    port: 5432
});


module.exports = pool;

