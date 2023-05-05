var admin = require("firebase-admin");
//this json file will be provided to you for a particular project //download it and give relative path for the same
const serviceAccount = require('../config/alqurancommunity-24a89-firebase-adminsdk-g4nx9-86c87b5aff.json');
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
 // databaseURL: "url_for_ur_project_in_setup_on_firebase"
});

var registrationToken = "c85Lg5XNS2CfXBTXhYIpvp:APA91bEOhDg9-QbQO2GDLbmTgVFTkPrGjcvKZsWTglR1eDIdIERcknIZCNaPQNas9z2PkrkxcpPkcDZBsq-cm_y8NlS2FykJK7AmvPPo-YinN_3gi4RxHPyn-JucymZwFqZbmSIB7W7S";
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