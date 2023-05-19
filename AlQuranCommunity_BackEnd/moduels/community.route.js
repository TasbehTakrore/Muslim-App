const router = require('express').Router();
const communityController  = require('../controllers/communityController');

router.post('/createCommunity',communityController.createCommunity);
router.get('/findAllCommunitiesFemale', communityController.findAllCommunitiesFemale);
router.get('/findAllCommunitiesMale', communityController.findAllCommunitiesMale);
router.post('/addMemberCommunity', communityController.addMemberCommunity);
router.get('/getMyCommunities/:userEmail', communityController.getMyCommunities);
router.post('/requestToCommunity',communityController.requestToCommunity);
router.delete('/deleteRequest/:communityID/:userReqEmail', communityController.deleteRequest);
router.get('/getAllMemberRequests/:communityID',communityController.getAllMemberRequests);
router.get('/getAllCommunityMembers/:communityID',communityController.getAllCommunityMembers);


module.exports= router;

