/**
 * 10.22 night
 * https://www.codementor.io/julieisip/learn-rest-api-using-express-js-and-mysql-db-ldflyx8g2
 * https://www.restapiexample.com/build-rest-api/create-rest-api-using-node-js-mysql-express/
 */
const mysql = require('mysql')

const conn  = mysql.createConnection({
    host: 'localhost',
    database: 'wchen',
    user: 'root',
    password: '123',
    // 最大连接数，默认为10
    connectionLimit: 10
})

conn.connect((error) => {
    if (error) throw error
    console.log("connect to MySQL database successfully")
})

module.exports = {
    connection: conn
}


