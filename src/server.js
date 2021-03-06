const express = require('express')
const nunjucks = require('nunjucks')
const methodOverride = require('method-override')
const router = require('./router/routers')

const server = express()

//Leitura do body - form post
server.use(express.urlencoded({ extended: true }))

//Leitura da pasta public - Leitura de css e scripts do site
server.use(express.static('public'))

//Sobrescrever as rotas para o método put e delete
server.use(methodOverride('_method'))
//Leitura de rotas
server.use(router)

server.set('view engine', 'njk')

nunjucks.configure('src/app/views', {
    express: server,
    autoescape: false,
    noCache: true
})

server.listen(5000, function() {
    console.log('server is running')
})