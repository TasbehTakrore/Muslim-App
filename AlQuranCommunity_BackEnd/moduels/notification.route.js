const express = require('express');
const router = express.Router();
const notification = require('../controllers/notificationController');
//const notification = require('../controllers/notify');


router.post('/send', notification.sendPushNotification);
module.exports = router;
