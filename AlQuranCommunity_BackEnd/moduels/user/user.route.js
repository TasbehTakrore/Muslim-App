const router = require('express').Router();
const userController = require('../../controllers/userController');
const auth = require('../../middleware/auth');

//import {Router} from 'express';
//const router =Router();

router.get('/getAll',userController.getAllUsers);
router.post('/signUp',userController.signUp);
router.get('/getDetails',auth(),userController.userDetails);
router.post('/logIn',userController.logIn);
router.put('/:id',userController.updateUser);
router.delete('/:id',userController.deleteUser);
router.post('/addCoins',userController.addCoins);

module.exports= router;