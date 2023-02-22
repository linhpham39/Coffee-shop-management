const Pool = require("pg").Pool;

const pool = new Pool({
    user: "postgres",
    host: "localhost",
    database: "coffeeshop",
    password: "425222",
    port: 5432
});

module.exports = pool;