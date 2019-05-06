var db = require('../modules/db')
var md5 = require('blueimp-md5')
var moment = require('moment')

exports.list = async (req, res, next) => {
    try {
        var query = req.query
        var str = ' 1=1 '
        for (var key in query) {
            str += `and ${key} = '${query[key]}'`
        }
        var sqlStr = `SELECT * FROM users WHERE ${str}`
        res.status(200).json(await db.query(sqlStr))
    } catch (err) {
        next(err)
    }
}

exports.create = async (req, res, next) => {
    try {
        var body = req.body
        body.create_time = moment().format('YYYY-MM-DD hh:mm:ss')
        body.modify_time = moment().format('YYYY-MM-DD hh:mm:ss')
        var sqlStr = `
    INSERT INTO users (username, password, email, nickname, avatar, gender, create_time, modify_time)
    VALUES (
        '${body.email}', 
        '${md5(md5(body.password))}', 
        '${body.email}', 
        '${body.nickname}',
        'default_avatar.png', 
        0, 
        '${body.create_time}', 
        '${body.modify_time}')
    `
        var ret = await db.query(sqlStr)
        var [user] = await db.query(`SELECT * FROM users WHERE id = ${ret.insertId}`)
        // console.log(user)
        req.session.user = user
        res.status(201).json(user)
    } catch (err) {
        next(err)
    }
}

exports.update = async (req, res, next) => {
    try {
        var params = req.params
        var user = req.session.user
        if (parseInt(params.id) !== parseInt(user.id)) {
            return res.status(404).json({
                error: 'Action Invalid.'
            })
        }
        var [user] = await db.query(`SELECT * FROM users WHERE id=${user.id}`)
        if (!user) {
            return res.status(404).json({
                error: 'User not Found.'
            })
        }
        var {
            email = user.email,
            nickname = user.nickname,
            avatar = user.avatar,
            gender = user.gender
        } = req.body
        var password = req.body.password ? md5(md5(req.body.password)) : user.password
        var sqlStr = `UPDATE users SET 
        email = '${email}',
        password = '${password}',
        nickname = '${nickname}',
        avatar = '${avatar}',
        gender = ${gender},
        modify_time = '${moment().format('YYYY-MM-DD hh:mm:ss')}'
        WHERE id = ${user.id}
        `
        var ret = await db.query(sqlStr) 
        var [user] = await db.query(`SELECT * FROM users WHERE id = ${user.id}`)
        res.status(201).json(user)
    } catch (err) {
        next(err)
    }
}

exports.destroy = async (req, res, next) => {
    try {
        var params = req.params
        var [user] = await db.query(`SELECT * FROM users WHERE id=${params.id}`)
        if (!user) {
            return res.status(404).json({
                error: 'User not Found.'
            })
        }
        var sqlStr = `DELETE FROM users WHERE id=${params.id}`
        var ret = await db.query(sqlStr)
        res.status(204).json({})
    } catch (err) {
        next(err)
    }
}