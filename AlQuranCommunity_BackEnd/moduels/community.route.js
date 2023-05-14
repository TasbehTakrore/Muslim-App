const router = require('express').Router();
const communityController  = require('../controllers/communityController');

router.post('/createCommunity',communityController.createCommunity);
router.get('/findAllCommunities', communityController.findAllCommunities);

module.exports= router;

