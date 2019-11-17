/**
 * 10.22 night
 * configure 10.28 night
 */
var crypto = require('crypto');
var DataTypes = require("sequelize");
var sequelize = require('../config/Connection');

var User = sequelize.define('users', {
    username: DataTypes.STRING,
    password: DataTypes.STRING
}, {
    instanceMethods: {
        retrieveAll: (onSuccess, onError) => {
            User.findAll({}, {raw: true})
                .success(onSuccess).error(onError);
        },
        retrieveById: (user_id, onSuccess, onError) => {
            User.find({where: {id: user_id}}, {raw: true})
                .success(onSuccess).error(onError);
        },

        //has to use function, use arrow function will report "Data must be a string or a buffer", shasum.update(password);
        addUser: function (onSuccess, onError) {
            let username = this.username;
            let password = this.password;

            let shasum = crypto.createHash('sha1');
            shasum.update(password);
            password = shasum.digest('hex');

            User.build({username: username, password: password})
                .save().success(onSuccess).error(onError);
        },

        //has to use function, use arrow function will report "Data must be a string or a buffer", shasum.update(password);
        updateById: function (user_id, onSuccess, onError) {
            let id = user_id;
            let username = this.username;
            let password = this.password;

            let shasum = crypto.createHash('sha1');
            shasum.update(password);
            password = shasum.digest('hex');

            User.update({username: username, password: password}, {id: id})
                .success(onSuccess).error(onError);
        },
        removeById: (user_id, onSuccess, onError) => {
            User.destroy({id: user_id}).success(onSuccess).error(onError);
        }
    }
});

module.exports = User;
