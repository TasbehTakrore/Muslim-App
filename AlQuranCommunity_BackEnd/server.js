const express = require('express')
const mongoose = require('mongoose')
const morgan = require('morgan')
const bodyParser = require('body-parser')

mongoose.connect('mongodb://127.0.0.1:27017/quranDB',{useNewURLParser: true, useUnifiedTopology: true})
const db = mongoose.connection

db.on('error', (err) =>{
    console.log(err)

})
db.once('open', ()=>{
    console.log('Database Connection Established!')
})

const app = express()

app.use(morgan('dev'))
app.use(bodyParser.urlencoded({extend: true}))
app.use(bodyParser.json())

const PORT = process.env.PORT || 3000

app.listen(PORT, ()=>{
    console.log(`Server is running on port ${PORT}`)
})
