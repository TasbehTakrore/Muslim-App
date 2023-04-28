const mistakeModel= require("../DB/models/mistake.model");

// const addMistake=async(req,res)=>{
//     try{
//         console.log("here+++++++++++");
//         const {userEmail, mistakeType, weight, surahId,ayahId,}=req.body;
//         let mistake = await mistakeModel.create({userEmail:userEmail,mistakeType:mistakeType,weight:weight,surahId:surahId,ayahId:ayahId});
//          res.json({message: 'success add mistake', mistake});
//     }catch(error){
//         console.log("fail added mistake!"+error);
//     }
// }

const addMistakes=async(req,res)=>{
    try{
        const mistakes = req.body;
        let newMistakes = [];
        for (let i = 0; i < mistakes.length; i++) {
            const {userEmail, mistakeType, weight, surahId, ayahId} = mistakes[i];
            let [mistake, created] = await mistakeModel.findOrCreate({
                where: {userEmail:userEmail, surahId: surahId, ayahId: ayahId},
                defaults: {userEmail: userEmail, mistakeType: mistakeType, weight: weight, surahId: surahId, ayahId: ayahId}
            });
            if (!created) {
                mistake.weight += weight;
                await mistake.save();
            }
            newMistakes.push(mistake);
        }
        res.json({message: 'success add mistakes', mistakes: newMistakes});
    } catch(error) {
        console.log("fail added mistakes!"+error);
    }
}


const deleteMistake = async (req, res) =>{
    try{
        const {userEmail, surahId, ayahId} = req.params;
        const numDeletedRows = await mistakeModel.destroy({
            where: {
              userEmail: userEmail,
              surahId: surahId,
              ayahId: ayahId,
            },
          });
          if (numDeletedRows === 0) {
            return res.status(404).json({
              message: "No mistake found with the given email and IDs",
            });
          }
          res.json({ message: "Mistake deleted successfully" });
        } catch (error) {
          console.log("Error deleting mistake: " + error);
          res.status(500).json({ message: "Error deleting mistake" });
        }
}
    

const getMistakes = async(req,res)=>{
    try{
        const userEmail = req.params.id;
        mistakes = await mistakeModel.findAll({where: {userEmail: userEmail}});
        if (!mistakes || mistakes.length === 0) {
            return res.status(404).send({ message: 'User not found or No mistakes' });
          }
        res.json({message: "here all of mistakes for this user",mistakes: mistakes})
    }catch(error){
        console.log("fail get mistakes!"+error);
    }
}



// const addMistakes=async(req,res)=>{
//     try{
//         const mistakes = req.body;
//         let newMistakes = [];
//         for (let i = 0; i < mistakes.length; i++) {
//             const {userEmail, mistakeType, weight, surahId, ayahId}=mistakes[i];
//             let mistake = await mistakeModel.create({userEmail:userEmail,mistakeType:mistakeType,weight:weight,surahId:surahId,ayahId:ayahId});
//             newMistakes.push(mistake);
//         }
//         res.json({message: 'success add mistakes', mistakes: newMistakes});
//     }catch(error){
//         console.log("fail added mistakes!"+error);
//     }
// }

module.exports={addMistakes,getMistakes,deleteMistake}
