const axios = require('axios');
const cron = require('node-cron');
const userNotification = require('../DB/models/notification.model');
const notficationHistory=require('../DB/models/notficationHostiry');

const sendNotification = async (req, res) => {
    try {
      const { title, message, topic, pageid, pagename } = req.body;
  
      const url = 'https://fcm.googleapis.com/fcm/send';
      const data = {
        to: '/topics/' + topic,
        priority: 'high',
        content_available: true,
        notification: {
          body: message,
          title: title,
          click_action: 'FLUTTER_NOTIFICATION_CLICK',
          sound: 'default'
        },
        data: {
          pageid: pageid,
          pagename: pagename
        },
        notification_style: {
            type: 'big_text',
            big_text: message,
            title: title,


        }

      };
  
      const headers = {
        'Content-Type': 'application/json',
        Authorization: 'key=AAAAI03IwMs:APA91bEHfmV4j3oHTXmOToohdH-uPQyo9FtbffZmpi4TXGMFb1MBh23vQ5pSYFLpRtlFsq2vgjXifdY3T5pTpcyVs2mt3YizyNde2snwCNmvWJ32NxP_s1WJFeD8OUWkhTSnTfUZ9_R8' // Replace with your FCM server key
      };
  
      const response = await axios.post(url, data, { headers });
      console.log('Notification sent successfully:', response.data);
      res.json({ success: true, message: 'Notification sent successfully' });
    } catch (error) {
      console.error('Error sending notification:', error);
      res.status(500).json({ success: false, message: 'Failed to send notification' });
    }
  };

const checkOrCreatePlanNotification = async (req, res) => {
    try {
      const { userId, planAlarm } = req.body;
  
      let userNotif = await userNotification.findOne({
        where: { user_id: userId },
      });
  
      if (userNotif) {
        // If the record exists, update the data
        userNotif.Planalarm = planAlarm;
        await userNotif.save();
        console.log('User notification record updated');
      } else {
        // If the record doesn't exist, create a new one
        await userNotification.create({
          user_id: userId,
          Planalarm: planAlarm,
        });
        console.log('New user notification record created');
      }
  
      res.json({ success: true, message: 'User notification updated or created' });
    } catch (error) {
      console.error('Error checking or creating user notification:', error);
      res.status(500).json({ success: false, message: 'Failed to update or create user notification' });
    }
  };
 

  const checkUserWithPlanAlarm = async (req, res) => {
    try {
      const userId = req.params.id; 
  
      const user = await userNotification.findOne({
        where: { user_id: userId, Planalarm: true },
      });
  
      const hasPlanAlarm = !!user; 
  
      res.status(200).json({ success: true, hasPlanAlarm });
    } catch (error) {
      console.error('Error checking user with planAlarm:', error);
      res.status(500).json({ success: false, message: 'Failed to check user with planAlarm' });
    }
  };


  const getUserNotificationHistory = async (req, res) => {
    const { id } = req.params;
  
    try {
      const notifications = await notficationHistory.findAll({
        where: {
          user_id: id,
        },
        order: [['timestamp', 'DESC']],
      });
  
      res.json({ success: true, data: notifications });
    } catch (error) {
      console.error('Error retrieving user notification history:', error);
      res.status(500).json({ success: false, message: 'Failed to retrieve user notification history' });
    }
  };
  
  

  
  const notificationHistoryInsert = async (req, res) => {
    try {
      const { notifyTitle, notifyBody, userId } = req.body;
  
      const newNotification = await notficationHistory.create({
        Notifytitle: notifyTitle,
        Notifybody: notifyBody,
        user_id: userId,
      });
  
      res.json({ success: true, message: 'Notification created successfully', notification: newNotification });
    } catch (error) {
      console.error('Error creating notification:', error);
      res.status(500).json({ success: false, message: 'Failed to create notification' });
    }
  };

  

  
  
  
  module.exports ={ sendNotification,checkOrCreatePlanNotification,checkUserWithPlanAlarm,notificationHistoryInsert,getUserNotificationHistory};
  
  const scheduledNotification = () => {
    // Schedule the function to run at 5:04 PM daily
    cron.schedule('21 23 * * *', async () => {
      const req = {
        body: {
          title: ' تذكير الخطة اليومية' ,
          message: 'قارب اليوم على الانتهاء! اغتنم  وقتك وأكمل مهامك المتبقية.',
          topic: 'planNotification',
          pageid: 'your-pageid',
          pagename: 'your-pagename'
        }
      };
      const res = {
        json: (data) => console.log('Notification sent successfully:', data),
        status: (code) => res // Dummy implementation of res.status
      };

  
      sendNotification(req, res)
        .then(async () => {
          console.log('Notification sent successfully');
    
          const userNotifs = await userNotification.findAll({
            attributes: ['user_id'],
          });
    
          for (const userNotif of userNotifs) {
            const userId = userNotif.user_id;

            // Create a new notification history entry
            await notficationHistory.create({
              Notifytitle: req.body.title,
              Notifybody: req.body.message,
              user_id: userId,
            });
          }
          
        })
        .catch((error) => {
          console.error('Error sending notification:', error);
        });
    });
  };

  const scheduledNotificationSalat = () => {
    // Schedule the function to run every 2 hours
    cron.schedule('0 */2 * * *', async () => {
      // Your code for sending the notification goes here
      const req = {
        body: {
          title: "اللهمّ صلِّ وسلِّم وبارك على سيّدنا مُحمّد | ﷺ",
         // message: '(إِنَّ اللَّهَ وَمَلائِكَتَهُ يُصَلُّونَ عَلَى النَّبِيِّ يَا أَيُّهَا الَّذِينَ آمَنُوا صَلُّوا عَلَيْهِ وَسَلِّمُوا تَسْلِيمًا)',
          topic: 'salatNotification',
          pageid: 'your-pageid',
          pagename: 'your-pagename'
        }
      };
      const res = {
        json: (data) => console.log('Notification sent successfully:', data),
        status: (code) => res // Dummy implementation of res.status
      };
  
      sendNotification(req, res)
        .then(async () => {
          console.log('Notification sent successfully');
        })
        .catch((error) => {
          console.error('Error sending notification:', error);
        });
    });
  };
  
  scheduledNotificationSalat();
  // Start the scheduled notification
  scheduledNotification();
  