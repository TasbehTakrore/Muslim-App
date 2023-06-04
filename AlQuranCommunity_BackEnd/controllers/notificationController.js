const notificationModel = require('../DB/models/notification.model');
const admin = require('firebase-admin');
const serviceAccount = require('../config/projectchat-93af3-firebase-adminsdk-stve5-7294570190.json');
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  projectId: "alqurancommunity-24a89"

});

const sendPushNotification = async (notification) => {
  const { title, body, token } = notification;

  const message = {
    data: {
      title: title,
      body: body,
    //  topic: 'my-topic',

    },
        token: token,

  };

  try {
    const response = await admin.messaging().send(message);
    console.log('Push notification sent:', response);
    return response;
  } catch (error) {
    console.error('Error sending push notification:', error);
    throw error;
  }
};

const createNotification = async (req, res) => {
    const { scheduledTime, title, body, token } = req.body;
  
    try {
      // Create a new notification object
      let notification = await notificationModel.create({
        scheduledTime: new Date(scheduledTime), // Convert scheduledTime to a valid date object
        title:title,
        body:body,
        token:token,
      });
  
      // Schedule the push notification to be sent at the specified time
      setTimeout(async () => {
        await sendPushNotification(notification);
  
        // Update the notification status to sent
        notification.sent = true;
        await notification.save();
      }, notification.scheduledTime.getTime() - new Date().getTime());
   return res.status(200).json({ message: 'Notification created' });
    } catch (error) {
      console.log(error);
      return res.status(500).json({ message: 'Internal server error' });
    }
  };


  
module.exports = {sendPushNotification,createNotification,};