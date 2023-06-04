const express = require('express');
const router = express.Router();
//const notification = require('../controllers/notificationController');
const sendNotification = require('../controllers/notificationFinal');
const planNotification = require('../controllers/notificationFinal');

router.post('/send-notification', sendNotification.sendNotification);
router.post('/addUpdatePlanNotfication', planNotification.checkOrCreatePlanNotification);
router.put('/checkUserWithPlanAlarm/:id',planNotification.checkUserWithPlanAlarm);
router.post('/notificationHistoryInsert',planNotification.notificationHistoryInsert);
router.put('/getUserNotification/:id',planNotification.getUserNotificationHistory);

module.exports = router;
