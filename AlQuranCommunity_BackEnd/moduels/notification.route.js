const express = require('express');
const router = express.Router();
const notification = require('../controllers/notificationController');


router.post('/send', notification.sendPushNotification);
module.exports = router;
