const router = require('express').Router();
const mistakeController = require('../controllers/mistakeController');

router.post('/addMistakes',mistakeController.addMistakes);
router.get('/getMistakes/:id',mistakeController.getMistakes);
router.delete('/deleteMistake/:userEmail/:surahId/:ayahId',mistakeController.deleteMistake);


module.exports= router;

