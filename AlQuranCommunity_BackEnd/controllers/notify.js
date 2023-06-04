var admin = require("firebase-admin");

const serviceAccount = require('../config/projectchat-93af3-firebase-adminsdk-stve5-7294570190.json');
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
 // databaseURL: "url_for_ur_project_in_setup_on_firebase"
});

var registrationToken = "cN8-ct-ZQ4a48b_rd4RwWp:APA91bGuSfATGTit-ERqdTnFF1POI_gH-NFLizhPteNutQ4BNBIXgOe7dF6kZQcueq8OvXVzWXgYlHzu3q36rBwB0iqG8od2puGb76kaKFpHmRUMlWOrJt2wkxtUh0YH3Rw3O2Pl0x66";
const sendPushNotification = async () => {

const message = {
    data: {
      score: '850',
      time: '2:45'
    },
    token: registrationToken
  };
  
  // Send a message to the device corresponding to the provided
  // registration token.
  admin.messaging().send(message)
    .then((response) => {
      // Response is a message ID string.
      console.log('Successfully sent message:', response);
    })
    .catch((error) => {
      console.log('Error sending message:', error);
    });
}
//module.exports = {sendPushNotification};