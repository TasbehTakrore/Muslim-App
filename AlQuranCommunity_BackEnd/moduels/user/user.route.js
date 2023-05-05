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

//router.get('/showUser',auth(),userController.userDetails);
router.get('/checkEmail',userController.checkEmail);
//router.get('/getAll',userController.getAllUsers);
//router.get('/logIn',userController.logIn);
router.put('/:id',userController.updateUser);
router.delete('/:id',userController.deleteUser);

module.exports= router;