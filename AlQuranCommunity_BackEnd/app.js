const express = require('express');
const dotenv =require('dotenv');
dotenv.config({path:'./config/.env'});
const {connectDB}= require('./DB/connection');
const app=express()
const port = process.env.PORT || 5000
connectDB ();
app.use(express.json())
const userRouter  = require('./moduels/user/user.route');
app.use('/users/',userRouter);
const mistakeRouter = require('./moduels/mistake.route');
app.use('/mistake/',mistakeRouter);

const notificationRouter = require('./moduels/notification.route');
app.use('/notification/',notificationRouter);

const communityRouter = require('./moduels/community.route');
app.use('/communities/',communityRouter);


app.get('*',(req,res)=>{
    res.json({message:'page not found'}); 
})
// const bodyParser = require('body-parser');

// app.use(bodyParser.json({ limit: '1gb' }));
// app.use(bodyParser.urlencoded({ limit: '1gb', extended: true }));


/*
app.post('/addUser',(req,res)=>{
    Connection.execute(`INSERT into users (user_name,user_email,gender,user_age,user_pass) 
    VALUES('test','test@gmail','f','20','1111')`);
    res.json({message:'success'});
})*/
  


app.listen( port,()=>console.log(`listen on port ${port}`))

