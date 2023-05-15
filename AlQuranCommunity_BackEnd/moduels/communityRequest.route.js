const router = require('express').Router();
const communityReruestController  = require('../controllers/communityRequestController');

router.post('/requestToCommunity',communityReruestController.requestToCommunity);
router.delete('/deleteRequest/:communityID/:userReqEmail', communityReruestController.deleteRequest);

module.exports= router;