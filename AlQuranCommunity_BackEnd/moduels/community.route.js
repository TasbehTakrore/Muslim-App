const router = require('express').Router();
const communityController  = require('../controllers/communityController');

router.post('/createCommunity',communityController.createCommunity);
router.get('/findAllCommunitiesFemale', communityController.findAllCommunitiesFemale);
router.get('/findAllCommunitiesMale', communityController.findAllCommunitiesMale);

module.exports= router;

