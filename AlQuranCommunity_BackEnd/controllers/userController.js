const userModel= require("../DB/models/user.model");
var bcrypt = require('bcryptjs');
var jwt = require('jsonwebtoken');

//get all users
const getAllUsers=async(req,res)=>{
    const allUsers= await userModel.findAll({
   //  attributes:['userEmail','userPassword'],
    });
    res.json({message:'success',allUsers});
}

//add new user `sign up` 
const signUp = async(req,res)=>{
    try{
        //from postman or front end 
        const {userName,userEmail,userAge,userPassword,userGender }=req.body;
    
        //insert into users() values()
        const hashPassword = await bcrypt.hashSync(userPassword,8);
        let user= await userModel.create({userName:userName,userEmail:userEmail,userAge:userAge,userPassword:hashPassword,userGender:userGender});
        
        res.json({message:'success',user});
    }catch(error){
        let msg = error.errors[0].message;
        res.json({msg});
    }

 
}

//get user detailsfrom id in the url
const userDetails = async(req,res)=>{
    try{
        //select * from users where id = ..
        const user= await userModel.findOne({
            where:{
                id: req.user.id,
            }
        });
        res.json({message:'success',user});    
    }catch(error){
        res.json({message:'catch error',error})
    }

}

// check user information ` log in `
const logIn = async (req,res)=>{
    const {userEmail,userPassword} =req.body ;
    const user=  await userModel.findOne({
        where:{
            userEmail:userEmail,
        }
    });
    if(!user){
        res.json({message:'invalid-data'});
    }
    else{
        const matchPass =await bcrypt.compare(userPassword,user.userPassword)
        if(matchPass){
        const token = jwt.sign({id:user.id},'QuranLogIn@123');
        res.json({message:'success',token});
        }
        else
        res.json({message:'invalid-data'});

    }
}

// update user information
const updateUser = async(req,res)=>{
    const {id}= req.params; 
    const {name,age,gender} =req.body;

    const user= await userModel.update({
        userName:name,
        userAge:age,
        userGender:gender,}, 
        {where:{
            id:id,}   
        }
        )
    user[0]? res.json({message:"success",user}):res.json({message:"invalid-account",user});


}

//delete user account
const deleteUser = async(req,res)=>{
    const {id}= req.params; 

    const user= await userModel.destroy({ 
        where:{
            id:id
        }     
    });
    user? res.json({message:"success",user}):res.json({message:"invalid-account",user});
}

module.exports={getAllUsers,signUp,userDetails,logIn,updateUser,deleteUser}