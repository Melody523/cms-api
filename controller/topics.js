var db = require('../modules/db')
var moment = require('moment')
var path = require('path')

exports.list = async (req, res, next) => {
    try {
        var { _page = 1, _limit = 20 } =req.query
        if (_page < 1) {
            _page = 1
        }
        if (_limit < 1) {
            _limit = 1
        }
        if (_limit > 20) {
            _limit = 20
        }
        var start = (_page - 1) * _limit
        var sqlStr = `SELECT * FROM topics LIMIT ${start}, ${_limit}`
        var [{count}] = await db.query(`SELECT count(*)as count  FROM topics`)
        var topics = await db.query(sqlStr)
        res.status(200).json({
            topics,
            count
        })
    } catch (err) {
        next(err)
    }
}

exports.getOne = async (req, res, next) => {
    try {
        var params = req.params
        var sqlStr = `SELECT * FROM topics WHERE id = ${params.id}`
        var [topic] = await db.query(sqlStr)
        res.status(200).json(topic)
    } catch (err) {
        next(err)
    }
}

exports.create = async (req, res, next) => {
    try {
        var body = req.body
        body.user_id = req.session.user.id
        body.create_time = moment().format('YYYY-MM-DD hh:mm:ss')
        body.modify_time = moment().format('YYYY-MM-DD hh:mm:ss')
        var sqlStr = `
        INSERT INTO topics (title, content, user_id, create_time, modify_time)
        VALUES ('${body.title}', 
        '${body.content}',
        '${body.user_id}',
        '${body.create_time}',
        '${body.modify_time}'
        )
        `
        var ret = await db.query(sqlStr)
        var [topic] = await db.query(`SELECT * FROM topics WHERE id = ${ret.insertId}`)
        res.status(201).json(topic)
    } catch (err) {
        next(err)
    }

}

exports.update = async (req, res, next) => {
    try {
        var body = req.body
        var params = req.params
        body.modify_time = moment().format('YYYY-MM-DD hh:mm:ss')
        var sqlStr = `UPDATE topics SET 
        title = '${body.title}', 
        content = '${body.content}' ,
        modify_time = '${body.modify_time}'
        WHERE id = ${params.id} `
        var ret = await db.query(sqlStr)
        var [topic] = await db.query(`SELECT * FROM topics WHERE id = ${params.id}`)
        res.status(200).json(topic)
    } catch (err) {
        next(err)
    }
}

exports.destroy = async (req, res, next) => {
    try {
        // var user = req.session.user
        var params = req.params
        var sqlStr = `DELETE FROM topics WHERE id = ${params.id} `
        var ret = await db.query(sqlStr)
        res.status(204).json({})
    } catch (err) {
        next(err)
    }
}