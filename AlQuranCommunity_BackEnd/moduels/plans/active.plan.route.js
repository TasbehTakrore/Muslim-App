const router = require('express').Router();
const activePlanController = require('../../controllers/plansControllers/activePlansController');

router.post('/addupPlan/:id',activePlanController.addupActivePlan);
router.get('/getPlan/:id',activePlanController.getActivePlan);
router.post('/refreshTasks/:id',activePlanController.refreshTasks);

module.exports= router;

