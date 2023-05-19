const userModel= require("../DB/models/user.model");
var bcrypt = require('bcryptjs');
var jwt = require('jsonwebtoken');
const multer = require('multer');
const upload=require("../middleware/upload")
const path = require('path');
const fs = require('fs');
const aurh=require("../middleware/auth");
const { sendEmail } = require("../services/email");
const { nanoid } = require('nanoid');

//add new user `sign up` 
const signUp = async(req,res)=>{
    try{

        const {userName,userEmail,userAge,userPassword,userGender}=req.body;
        const hashPassword = await bcrypt.hashSync(userPassword,8);
        upload.single('image')(req, res, async function (err) {
            if (err instanceof multer.MulterError) {
              console.log(err);
            } else if (err) {
              console.log(err);

            }
            const tempFilename = req.tempFilename; 
         //   const imageUrl = req.file ? req.file.filename : null;
            const user= await userModel.create({userName:userName,userEmail:userEmail,userAge:userAge,userPassword:hashPassword,userGender:userGender,imageUrl:tempFilename});
            const userId = user.id;
            
            const ext = tempFilename.split('.')[1];
            const actualFilename = `user-${userId}.${ext}`;
            fs.renameSync(path.join(__dirname, `../images/${tempFilename}`), path.join(__dirname, `../images/${actualFilename}`));
            await userModel.update(
              { imageUrl: actualFilename },
              {
                where: {
                  id: userId,
                },
              }
            );      
            res.json({message:'success',user});
          });
  
        }catch(e){


        res.status(500).json({error:e.message});
        console.log(" erooor!!\n \n"+error);

    }

 
}

const addCoins = async (req, res)=>{
    try {
        console.log( req.body);
        const{userEmail, userCoins} = req.body;
        const user=  await userModel.findOne({
            where:{
                userEmail:userEmail,
            }
        });
        console.log("gggggggggggggggggggggggggggg");

        if(!user){
            res.status(400)
            res.json({msg:'No user with this email'});
            console.log("nooo user");
        }
        else{
            user.increment('userCoins', {by: userCoins});
            // user.userCoins += userCoins;
            // user.save();
            res.json({message:'success',user});
            console.log("elseeeee user");
        }
    } catch (error) {
        res.json({message:'catch error ++',error})
        console.log("catch" + error);

    }
}

const addJewel = async (req, res)=>{
    try {
        console.log( req.body);
        const{userId, userCoins} = req.body;
        const user=  await userModel.findOne({
            where:{
                id:userId,
            }
        });
        console.log("found");

        if(!user){
            res.status(400)
            res.json({msg:'No user with this email'});
            console.log("not found");
        }
        else{
            user.increment('userCoins', {by: userCoins});
            
            res.json({message:'success',user});
            console.log("done");
        }
    } catch (error) {
        res.json({message:'catch error ++',error})
        console.log("catch" + error);

    }
}


// check user information ` log in `
const logIn = async (req,res)=>{
    try{
    const {userEmail,userPassword} =req.body ;
    const user=  await userModel.findOne({
        where:{
            userEmail:userEmail,
        }
    });
    if(!user){
        res.status(400)
        res.json({msg:'No user with this email'});

    }
    else{
        const matchPass =await bcrypt.compare(userPassword,user.userPassword)
        if(!matchPass){
            res.status(400)
            res.json({msg:'wrong password !'},);
        }
        else{
        const token = jwt.sign({id:user.id},'QuranLogIn@123');
        res.status(200)
        res.json({token,user});
        }

    }}catch(e){
        res.status(500).json({error:e.message});
    }
}

//get user information 
const userDetails=async(req,res)=>{
    try{
    const user= await userModel.findOne({
        where:{
            id: req.params.userId,
            }
        });
        if(!user){
            res.json({message:'no such user'});    
        }
        else{
            res.status(200).json({message:'found',user});}
        }catch(error){
            res.json({message:'catch error',error})
        }
}

//update user information
const updateUser = async(req,res)=>{
    try{
    const {name,age,gender,password,checkPassword} =req.body;
    const user= await userModel.findOne({
        where:{
            id: req.params.userId,}
        });
    if(!user){
        res.json({message:'no such user'});    
    }
    
        const matchPass =await bcrypt.compare(checkPassword,user.userPassword)
        if(!matchPass){
            res.status(400)
            res.json({msg:'wrong password !'},);
            return;
        }
        const hashPassword = await bcrypt.hashSync(password,8);
            await userModel.update({
            userName:name,
            userAge:age,
            userGender:gender,
            userPassword:hashPassword}, 
            {where:{
                id:user.id,}   
            }
        )
        res.status(200).json({msg:'updated',user:user});
    }catch(e){
        res.status(500)
        res.json({error: e.message})
    }
}

//get all users
const getAllUsers=async(req,res)=>{
    const allUsers= await userModel.findAll({
   //  attributes:['userEmail','userPassword'],
    });
    res.json({message:'success',allUsers});
}

//check uer email
const checkEmail = async (req,res)=>{
    try{
        const {userEmail} =req.body ;
        const user = await userModel.findOne({
            where:{
                userEmail: userEmail,
            }
        });
        if(!user){
            res.status(400).json({msg: 'User not found with the specified email'})
        } else {
            const code=nanoid(5);
            await sendEmail(user.userEmail,'forget password' ,`verify code : ${code}`);
            await userModel.update({
                verifyCode:code},
                {where:{
                    id:user.id,}   
                }
                );
            
            res.status(200).json({msg: 'Success', user});   
         //   const updateUser=await userModel.
        }
    } catch(error){
        console.error(error);
        res.status(500).json({message:'Error occurred while checking email', error})
    }

}
const updatePassword=async(req,res)=>{
    try{
        const {vCode,email,newPassword} =req.body ;
        const user = await userModel.findOne({
            where:{
                userEmail: email,
            }
        });
        if(!user){
            res.status(400)
            res.json({message:'no such user'})
        }
        else{
        if(user.verifyCode==null) {
            res.status(400)
            res.json({message:'no code'})
        }
        if(user.verifyCode!=vCode){
            res.status(400)
            res.json({message:"wrong verify code"})

        }
        else if(user.verifyCode==vCode){
            const hash=await bcrypt.hash(newPassword,8);
            await userModel.update({
                userPassword:hash,
                verifyCode:null
            },
                {where:{
                    id:user.id,}   
                }
                );
        res.status(200)
        res.json({message:"password changed"})
        }       
        }
    }catch(e){
       res.status(500)
       res.json({message:"server error:"})
    }
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

module.exports={getAllUsers,signUp,checkEmail,logIn,updateUser,deleteUser,addCoins,userDetails,updatePassword}


