var db = require('../modules/db')

exports.list = async (req, res, next) => {
    try {
        var query = req.query
        var sqlStr = `SELECT * FROM comments WHERE article_id = ${query.topic_id}`
        var comments = await db.query(sqlStr)
        res.status(200).json(comments)
    } catch (err) {
        next(err)
    }
}

exports.create = async (req, res, next) => {
    try {
        var body = req.body
        var [topic] = await db.query(`SELECT * FROM topics WHERE id=${body.article_id}`)
        if (!topic) {
            return res.status(404).json({
                error: 'Topic not Found.'
            })
        }
        var user = req.session.user
        var sqlStr = `INSERT INTO comments (content, user_id, article_id, create_time, modify_time)
        VALUES ('${body.content}',
        '${user.id}',
        '${body.article_id}',
        '${Date.now()}',
        '${Date.now()}')`
        var ret = await db.query(sqlStr)
        var [comment] = await db.query(`SELECT * FROM comments WHERE id=${ret.insertId}`)
        res.status(201).json(comment)
    } catch (err) {
        next(err)
    }
}

exports.update = async (req, res, next) => {
    try {
        var body = req.body
        var params = req.params
        var sqlStr = `UPDATE comments SET 
        content = '${body.content}' ,
        modify_time = '${Date.now()}'
        WHERE id = ${params.id} `
        var ret = await db.query(sqlStr)
        var [comment] = await db.query(`SELECT * FROM comments WHERE id = ${params.id}`)
        res.status(200).json(comment)
    } catch (err) {
        next(err)
    }
}

exports.destroy = async (req, res, next) => {
    try {
        var params = req.params
        var sqlStr = `DELETE FROM comments WHERE id = ${params.id}`
        var ret = await db.query(sqlStr)
        res.status(204).json({})
    } catch (err) {
        next()
    }
}