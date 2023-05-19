const router = require('express').Router();
const tasbehController = require('../controllers/tasbehController');

router.post('/addTasbehCount',tasbehController.createTasbehEntry);

router.get('/getUserTasbeh/:id',tasbehController.getUsertasbeh);

module.exports= router;
