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
const activePlanRouter = require('./moduels/plans/active.plan.route');
app.use('/activeplan/',activePlanRouter);

const backUpPlanRouter = require('./moduels/plans/backup.plan.route');
app.use('/BackUpplan/',backUpPlanRouter);

/*const notificationRouter = require('./moduels/notification.route');
app.use('/notification/',notificationRouter);
*/
const tasbehRouter = require('./moduels/tasbeh.route');
app.use('/tasbeh/',tasbehRouter);

const communityRouter = require('./moduels/community.route');
app.use('/communities/',communityRouter);

const communityRequestRouter = require('./moduels/communityRequest.route');
app.use('/communities/',communityRequestRouter);

app.get('*',(req,res)=>{
    res.json({message:'page not found'}); 
})
// const bodyParser = require('body-parser');

// app.use(bodyParser.json({ limit: '1gb' }));
// app.use(bodyParser.urlencoded({ limit: '1gb', extended: true }));
const notifyRouter = require('./moduels/notification.route');
app.use('/notify/',notifyRouter);

/*
app.post('/addUser',(req,res)=>{
    Connection.execute(`INSERT into users (user_name,user_email,gender,user_age,user_pass) 
    VALUES('test','test@gmail','f','20','1111')`);
    res.json({message:'success'});
})*/
  


app.listen( port,()=>console.log(`listen on port ${port}`))

