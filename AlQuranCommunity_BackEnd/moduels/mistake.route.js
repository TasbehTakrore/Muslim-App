const router = require('express').Router();
const mistakeController = require('../controllers/mistakeController');

router.post('/addMistakes',mistakeController.addMistakes);
router.get('/getMistakes/:id',mistakeController.getMistakes);
router.delete('/deleteMistake/:userEmail/:surahId/:ayahId',mistakeController.deleteMistake);
router.get('/getMistakesSurah/:id/:surahId',mistakeController.getMistakesSurah);
router.get('/getMistakesJuz/:id/:juzId',mistakeController.getMistakesJuz);
router.get('/getMistakesPage/:id/:pageId',mistakeController.getMistakesPage);

module.exports= router;

