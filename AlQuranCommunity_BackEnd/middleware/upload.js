const router = require('express').Router();
const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null,path.join(__dirname, '../images'))  ;
  },
  filename: function (req, file, cb) {
    const ext = file.mimetype.split('/')[1];
    const tempFilename = `user-temp-${Date.now()}.${ext}`;
    cb(null, tempFilename);
    req.tempFilename = tempFilename; 
  }
});

const upload = multer({ storage: storage ,limits:{fileSize:1024*1024*1024}});
module.exports=upload;