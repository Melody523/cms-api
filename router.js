var express = require('express')
var router = express.Router()
var db = require('./modules/db')

var userController = require('./controller/users')
var topicController = require('./controller/topics')
var commentController = require('./controller/comments')
var sessionController = require('./controller/session')

function checkLogin(req, res, next) {
    if (!req.session.user) {
        return res.status(401).json({
            error: 'Unauthorized'
        })
    }
    next()
}

router
    .get('/users', userController.list)
    .post('/users', userController.create)
    .patch('/users/:id', checkLogin, userController.update)
    .delete('/users/:id', checkLogin, userController.destroy)


async function checkTopic(req, res, next) {
    var params = req.params
    var [topic] = await db.query(`SELECT * FROM topics WHERE id=${params.id}`)
    if (!topic) {
        return res.status(404).json({
            error: 'Topic not Found.'
        })
    }
    var user = req.session.user
    if (topic.user_id !== user.id) {
        return res.status(400).json({
            error: 'Action Invalid.'
        })
    }
    next()
}

router
    .get('/topics', topicController.list)
    .get('/topics/:id', topicController.getOne)
    .post('/topics', checkLogin, topicController.create)
    .patch('/topics/:id', checkLogin, checkTopic, topicController.update)
    .delete('/topics/:id', checkLogin, checkTopic, topicController.destroy)


async function checkComment(req, res, next) {
    var params = req.params
    var [comment] = await db.query(`SELECT * FROM comments WHERE id=${params.id}`)
    if (!comment) {
        return res.status(404).json({
            error: 'Comment not Found.'
        })
    }
    var user = req.session.user
    if (comment.user_id !== user.id) {
        return res.status(400).json({
            error: 'Action Invalid.'
        })
    }
    next()
}
router
    .get('/comments', commentController.list)
    .post('/comments', checkLogin, commentController.create)
    .patch('/comments/:id', checkLogin, checkComment, commentController.update)
    .delete('/comments/:id', checkLogin, checkComment, commentController.destroy)

router
    .get('/session', sessionController.status)
    .post('/session', sessionController.create)
    .delete('/session', sessionController.destroy)

module.exports = router