const { Sequelize } = require('sequelize');
const dotenov =require('dotenv')
dotenov.config({path:"./.env"});
const sequelize = new Sequelize(process.env.DATABASE, process.env.DATABASE_USER, process.env.DATABASE_PASSWORD, {
    host: process.env.DATABASE_HOST,
    dialect: 'mysql' 
  });

 
const connectDB = async()=>{

    return await sequelize.sync({alter:true});


}
/*
db.connect((err)=>{
    if(err){
        console.log(err)
    }
    else{
        console.log("connected")
    }
}
)

app.get('',(req,res)=>{
    res.send("home");
})
//listening to port*/
module.exports= {sequelize,connectDB};
