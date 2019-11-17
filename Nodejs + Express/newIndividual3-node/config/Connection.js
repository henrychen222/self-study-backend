// IMPORT MODELS
// =============================================================================
var Sequelize = require('sequelize');

// db config
var env = "dev";
var config = require('./database')[env];
var password = config.password ? config.password : null;

// initialize database connection
var sequelize = new Sequelize(
    config.database,
    config.user,
    config.password,
    {
        dialect: config.driver,
        host: config.host,
        logging: console.log,
        define: {
            timestamps: false
        }
    }
);

module.exports = sequelize;
