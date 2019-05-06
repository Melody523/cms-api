var express = require('express')
var bodyParser = require('body-parser')
var session = require('express-session')
var router = require('./router')
var proxy = require('http-proxy-middleware')
const config = require('./config')



var app = express()

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({
    extended: false
}))

// parse application/json
app.use(bodyParser.json())

app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true
}))

app.use('/api', proxy({target: 'http://localhost:8080/api/', changeOrigin: true}))

app.use(router)

app.get((err, req, res, next) => {
    res.status(500).json({
        error: err.message
    })
})

app.listen(config.port, config.host, () => {
    console.log(`App is running at port ${config.port}.`)
    console.log(`Please visit http://${config.host}:${config.port}/`)
})