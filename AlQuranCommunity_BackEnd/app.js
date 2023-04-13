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
app.get('*',(req,res)=>{
    res.json({message:'page not found'}); 
})
/*
app.post('/addUser',(req,res)=>{
    Connection.execute(`INSERT into users (user_name,user_email,gender,user_age,user_pass) 
    VALUES('test','test@gmail','f','20','1111')`);
    res.json({message:'success'});
})*/
  
app.listen( port,()=>console.log(`listen on port ${port}`))

