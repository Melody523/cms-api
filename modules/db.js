var mysql = require('mysql');
var curUser = require('../config')

// var pool = mysql.createPool({
//     host: 'localhost',
//     user: 'melody',
//     password: '123456',
//     database: 'cms'
// });

var pool = mysql.createPool({
    host: curUser.db.host,
    user: curUser.db.user,
    password: curUser.db.password,
    database: curUser.db.database
});

exports.query = function (sqlStr) {
    return new Promise((resolve, reject) => {
        pool.getConnection(function (err, connection) {
            if (err) {
                reject(error)
            }
            connection.query(sqlStr, function (error, results, fields) {
                connection.release();
                if (error) {
                    reject(error)
                }
                resolve(results)
            });
        });
    })
}