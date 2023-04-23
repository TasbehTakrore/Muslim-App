const router = require('express').Router();
const mistakeController = require('../controllers/mistakeController');

router.post('/addMistake',mistakeController.addMistake);


module.exports= router;
