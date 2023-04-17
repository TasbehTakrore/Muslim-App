var  jwt  = require("jsonwebtoken");
const userModel= require('../DB/models/user.model')


const auth= ()=>{
    try{
        return async(req,res,next)=>{
            const {token}= req.headers;
            const decoded = jwt.verify(token,'QuranLogIn@123');
            if(!decoded){ 
                res.json({message:'invalid-token'})
            }
            else {
                const user= await userModel.findOne({
                    where:{
                        id: decoded.id,
                    }
                });
                req.user=user;
                next();
    
            }
    
        }
    }catch(error){
        res.json({message:'catch error',error})
    }
   
}

module.exports=auth;