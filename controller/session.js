var db =require('../modules/db')
var md5 = require('blueimp-md5')


exports.create = async (req, res, next) => {
    try {
        var body = req.body
        var sqlStr = `SELECT * FROM users WHERE email = '${body.email}' and password = '${md5(md5(body.password))}'`
        var [user] = await db.query(sqlStr)
        if (!user) {
            return res.status(404).json({
                error: 'Invalid email or password'
            })
        }
        req.session.user = user
        res.status(201).json(user)
    } catch(err) {
        next(err)
    }
}

exports.destroy = (req, res, next) => {
    delete req.session.user
    res.status(204).json({})
}


exports.status = (req, res, next) => {
    var user = req.session.user
    res.status(200).json(user)
}