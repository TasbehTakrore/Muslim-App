const activePlanModel= require("../../DB/models/plans/active.plans.model");

const addupActivePlan=async(req,res)=>{
    const userId = req.params.id;
    
    const {fiveprays,fivepraysF,Duha,DuhaF,qiyam,qiyamF,traweeh,traweehF,
           morning,morningF,evening,eveningF,sleeping,sleepingF,wakingup,wakingupF,wudu,wuduF,praythikr,praythikrF,athanthikr,athanthikrF,
           readplan,read_amount,read_amountCount,
           tadaburplan,tadabur_amount,tadabur_amountCount,
           memorizingplan,memorizing_amount,memorizing_amountCount,dataStatus,
          } = req.body;

    try {
        const activePlan = await activePlanModel.findOne({ where: { user_id: userId } });
        
        if (activePlan) {
          dataStatus==1? plan_id=activePlan.plan_id+1 : (dataStatus==2?plan_id=activePlan.plan_id:plan_id=1),
          await activePlan.update({
            fiveprays:fiveprays,
            Duha:Duha,
            qiyam:qiyam,
            traweeh:traweeh,
            morning:morning,
            evening:evening,
            sleeping:sleeping,
            wakingup:wakingup,
            wudu:wudu,
            praythikr:praythikr,
            athanthikr:athanthikr,
            readplan:readplan,
            read_amount:read_amount,
            tadaburplan:tadaburplan,
            tadabur_amount:tadabur_amount,
            memorizingplan:memorizingplan,
            memorizing_amount:memorizing_amount,
            fivepraysF:fivepraysF,
            DuhaF:DuhaF,
            qiyamF:qiyamF,
            traweehF:traweehF,
            morningF:morningF,
            eveningF:eveningF,
            sleepingF:sleepingF,
            wakingupF:wakingupF,
            wuduF:wuduF,
            praythikrF:praythikrF,
            athanthikrF:athanthikrF,
            read_amountCount:read_amountCount,
            tadabur_amountCount:tadabur_amountCount,
            memorizing_amountCount:memorizing_amountCount,
            plan_id:plan_id,

          }
            
         );
         res.status(200).json({ message: 'Active plan updated successfully', data: activePlan });
        } else {
            const newActivePlan = await activePlanModel.create({
              user_id:req.params.id,
              fiveprays:fiveprays,
              Duha:Duha,
              qiyam:qiyam,
              traweeh:traweeh,
              morning:morning,
              evening:evening,
              sleeping:sleeping,
              wakingup:wakingup,
              wudu:wudu,
              praythikr:praythikr,
              athanthikr:athanthikr,
              readplan:readplan,
              read_amount:read_amount,
              tadaburplan:tadaburplan,
              tadabur_amount:tadabur_amount,
              memorizingplan:memorizingplan,
              memorizing_amount:memorizing_amount,
              fivepraysF:fivepraysF,
              DuhaF:DuhaF,
              qiyamF:qiyamF,
              traweehF:traweehF,
              morningF:morningF,
              eveningF:eveningF,
              sleepingF:sleepingF,
              wakingupF:wakingupF,
              wuduF:wuduF,
              praythikrF:praythikrF,
              athanthikrF:athanthikrF,
              read_amountCount:read_amountCount,
              tadabur_amountCount:tadabur_amountCount,
              memorizing_amountCount:memorizing_amountCount,
              plan_id:1,

          });
          res.status(200).json({ message: 'Active plan created successfully', data: newActivePlan });
        }
      } catch (error) {
        console.error(error);
        res.status(500).send('Something went wrong');
      }
}

const getActivePlan = async (req, res) => {
    const userId = req.params.id;
    try {
      const activePlan = await activePlanModel.findOne({ where: { user_id: userId } });
  
      if (!activePlan) {
        return res.status(404).json({ message: "Active plan not found" });
      }
  
      res.status(200).json({message: "found", data: activePlan });
    } catch (error) {
      console.error(error);
      res.status(500).send("Something went wrong");
    }
  };

const refreshTasks=async (req,res)=>{
  
    const userId = req.params.id;

    try {
        const activePlan = await activePlanModel.findOne({ where: { user_id: userId } });
        
        if (activePlan) {
       //   dataStatus==1? plan_id=activePlan.plan_id+1 : (dataStatus==2?plan_id=activePlan.plan_id:plan_id=1),
          await activePlan.update({
            fivepraysF:0,
            DuhaF:0,
            qiyamF:0,
            traweehF:0,
            morningF:0,
            eveningF:0,
            sleepingF:0,
            wakingupF:0,
            wuduF:0,
            praythikrF:0,
            athanthikrF:0,
            read_amountCount:0,
            tadabur_amountCount:0,
            memorizing_amountCount:0,
          }
            
         );
         res.status(200).json({ message: 'Active plan updated successfully', data: activePlan });
        } else {
          res.status(400).json({ message: 'no user', data: newActivePlan });
        }
      } catch (error) {
        console.error(error);
        res.status(500).send('Something went wrong');
      }

}
module.exports={addupActivePlan,getActivePlan,refreshTasks}
