const PlansBackUPModel= require("../../DB/models/plans/plans.backup.model");
const { sequelize } = require('sequelize');

const addBackUpRcd=async(req,res)=>{
    const {user_id,fiveprays,fivepraysF,Duha,DuhaF,qiyam,qiyamF,traweeh,traweehF,
           morning,morningF,evening,eveningF,sleeping,sleepingF,wakingup,wakingupF,wudu,wuduF,praythikr,praythikrF,athanthikr,athanthikrF,
           readplan,read_amount,read_amountCount,
           tadaburplan,tadabur_amount,tadabur_amountCount,
           memorizingplan,memorizing_amount,memorizing_amountCount,plan_id
          } = req.body;

    try {
         /*
            const done_count=
            fivepraysF+DuhaF+qiyamF+traweehF+morningF+eveningF+
            sleepingF+wakingupF+wuduF+praythikrF+athanthikrF+
            (read_amountCount==0? 0:1)+ (tadabur_amountCount==0? 0:1)+
            (memorizing_amountCount==0? 0:1)
          
            const tasks_number=fiveprays+Duha+qiyam+traweeh+morning+evening+sleeping+wakingup
            +wudu+praythikr+athanthikr+(readplan=='none'?1:0)+(tadaburplan=='none'?1:0)+
            memorizingplan;*/
            const NewBackUPRecord = await PlansBackUPModel.create({
                user_id:user_id,
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
            });
          res.status(200).json({ message: 'New  Record inserted', data: NewBackUPRecord });
        }
       catch (error) {
        console.error(error);
        res.status(500).send('Something went wrong');
      }
    }

    const getWeekData = async (req, res) => {
      try {
        const  user_id  = req.params.id;
        const maxPlan = await PlansBackUPModel.findOne({
          where: { user_id :user_id},
          order: [['plan_id', 'DESC']],
          attributes: ['plan_id'],
        });
    
        if (!maxPlan) {
          console.log("No plan found for the user");
          return res.status(404).json({ message: 'No plan found for the user' });
        }
    
        const maxPlanId = maxPlan.plan_id;
        console.log(maxPlanId); // Log the value of maxPlanId
        const weekData = await PlansBackUPModel.findAll({
          where: { user_id, plan_id: maxPlanId },
        });
    
        res.status(200).json({ message: 'Weekly data retrieved', data: weekData });
      } catch (error) {
        console.error(error);
        res.status(500).send('Something went wrong');
      }
    };
    
    
    const deleteRecords = async (req, res) => {
      const userId = req.params.id;
      try {
        await PlansBackUPModel.destroy({ where: { user_id: userId } });
        res.status(200).json({ message: 'Records deleted successfully' });
      } catch (error) {
        console.error(error);
        res.status(500).send('Something went wrong');
      }
    }



module.exports={addBackUpRcd,deleteRecords,getWeekData};

