const mistakeModel= require("../DB/models/mistake.model");

const addMistake=async(req,res)=>{
    try{
        console.log("here+++++++++++");
        const {userEmail, mistakeType, weight, surahId,ayahId,}=req.body;
        let mistake = await mistakeModel.create({userEmail:userEmail,mistakeType:mistakeType,weight:weight,surahId:surahId,ayahId:ayahId});
         res.json({message: 'success add mistake', mistake});
    }catch(error){
        console.log("fail added mistake!"+error);
    }
}

module.exports={addMistake}