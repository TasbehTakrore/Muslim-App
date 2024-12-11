const userModel= require("../DB/models/thikr.model");

const signUp = async(req,res)=>{
    try{
        const {id,morning,evening,sleeping,wakingup,pray,wudu}=req.body;
        await thikrModel.create({
            id: id,
            morning: morning,
            evening: evening,
            sleeping: sleeping,
            wakingup: wakingup,
            wakingup: wakingup,
            wudu: wudu
            });
            res.status(200);
            res.json({message:'success',user});
        
  
        }catch(e){

        res.status(500).json({error:e.message});
        console.log(" erooor!!\n \n"+error);

    }

 
}