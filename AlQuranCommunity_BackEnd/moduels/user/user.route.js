const router = require('express').Router();
const userController = require('../../controllers/userController');
const auth = require('../../middleware/auth');
const upload = require('../../middleware/upload');

router.post('/signUp',upload.single('image'),userController.signUp);
router.post('/upload',upload.single('image'),(req,res)=>{
    res.status(200).json({message:"uploaded"});
});
router.post('/logIn',userController.logIn);
router.get('/showUser/:userId',userController.userDetails);
router.put('/updateUser/:userId',userController.updateUser);
router.get('/showUserByEmail/:userEmail',userController.userDetailsByEmail);


//router.get('/showUser',auth(),userController.userDetails);
router.post('/checkEmail',userController.checkEmail);
//router.get('/getAll',userController.getAllUsers);
//router.get('/logIn',userController.logIn);

router.get('/getAll',userController.getAllUsers);
router.post('/signUp',userController.signUp);
router.get('/getDetails',auth(),userController.userDetails);


router.post('/logIn',userController.logIn);
router.post('/updatePassword',userController.updatePassword);
router.put('/:id',userController.updateUser);
router.delete('/:id',userController.deleteUser);
router.post('/addCoins',userController.addCoins);

module.exports= router;