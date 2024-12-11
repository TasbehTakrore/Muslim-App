const router = require('express').Router();
const plansBckUPController = require('../../controllers/plansControllers/plansBackUpController');

router.post('/addBackUpRecord/',plansBckUPController.addBackUpRcd);
router.delete('/deleteRecord/:id',plansBckUPController.deleteRecords);
router.get('/getWeekData/:id',plansBckUPController.getWeekData);
module.exports= router;

