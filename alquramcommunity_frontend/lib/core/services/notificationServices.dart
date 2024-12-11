import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:alquramcommunity_frontend/core/constant/errorhandling.dart';

import '../constant/urls.dart';

// import 'package:app_settings/app_settings.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/Material.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:get/get.dart';
// import 'package:path/path.dart';
// import 'package:timezone/timezone.dart' as tz;
// import '../../data/model/backend_to_front_models/notification_model.dart';

class NotificationServices {

Future<void> checkOrCreatePlanNotification(int userId, bool planAlarm) async {
  
  try {
    final response = await http.post(
      Uri.parse('${MyURL.addPlanNotification}'),
      body: jsonEncode({
          'userId': userId,
          'planAlarm': planAlarm,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
    );
    
    if (response.statusCode == 200) {
      print('User notification updated or created');
    } else {
      print('Failed to update or create user notification');
    }
  } catch (error) {
    print('Error checking or creating user notification: $error');
  }
}



Future<void> checkUserWithPlanAlarm(int userId) async {
  final String apiUrl = '${MyURL.checkPlanNotification}/$userId';

  try {
    final response = await http.put(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final bool hasPlanAlarm = data['hasPlanAlarm'];

      if (hasPlanAlarm) {
        FirebaseMessaging.instance.subscribeToTopic("planNotification");
      } else {
        print('User does not have plan alarm');
      }
    } else {
      print('Failed to check user with planAlarm');
    }
  } catch (error) {
    print('Error checking user with planAlarm: $error');
  }
}


Future<List<dynamic>> getUserNotificationHistory(String userId) async {
  final url = Uri.parse('${MyURL.getUserAllnotification}/$userId');
  
  final response = await http.put(url);
  
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final notifications = data['data'] as List<dynamic>;
    return notifications;
  } else {
    throw Exception('Failed to retrieve user notification history');
  }
}






}
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin localNotificationPlugin =
//       FlutterLocalNotificationsPlugin();
//   //get permission for accessing notifications
//   void requestNotificationPermissions() async {
//     NotificationSettings settings = await _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('User granted permission');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print('User granted provisional permission');
//     } else {
//       /*flutter pub add app_settings
//      showDialog(
//     context: context,
//     builder: (_) => AlertDialog(
//       title: Text("Permission denied"),
//       content: Text("Please enable notifications in app settings"),
//       actions: [
//         TextButton(
//           child: Text("Cancel"),
//           onPressed: () => Navigator.pop(context),
//         ),
//         TextButton(
//           child: Text("Open settings"),
//           onPressed: () => InAppSettings.openNotificationSettings(),
//         ),
//       ],
//     ),
//   );
//     */

//       AppSettings.openNotificationSettings();
//       print('User declined or has not accepted permission');
//     }
//   }

//   //get the device token
//   Future<String> getDeviceToken() async {
//     String? Dtoken = await _firebaseMessaging.getToken();
//     return Dtoken!;
//   }

//   void isTokenRefreash() async {
//     _firebaseMessaging.onTokenRefresh.listen((event) {
//       event.toString();
//     });
//   }

//   void initLocalNotification(
//       BuildContext context, RemoteMessage message) async {
//     var initializationSettingsAndroid =
//         const AndroidInitializationSettings('@mipmap/ic_launcher');
//     /*var  initializationSettingsIos =
//         DarwinInitializationSettings();*/
//     var initilizationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       //iOS: initializationSettingsIos,
//     );
//     await localNotificationPlugin.initialize(
//       initilizationSettings,
//       onSelectNotification: (payload) {
//         return Future.value();
//       },
//     );
//   }

//   void firebaseinit() {
//     print('enter:::::::::::::::::::::::::::::');
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       if (message != null && message.notification != null) {
//         print(
//             'Received a notification message: ${message.notification!.title} ${message.notification!.body}');
//         RemoteNotification? notification = message.notification;
//         AndroidNotification? android = message.notification?.android;
//         if (notification != null && android != null) {
//           // Show a local notification with the received message
//           showNotification(message);
//         }
//       }
//     });
//   }

//   Future<void> showNotification(RemoteMessage message) async {
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//         'channel id', 'channel name', 'channel description',
//         importance: Importance.max, priority: Priority.high, ticker: 'ticker');
//     var platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await localNotificationPlugin.show(
//       message.notification!.hashCode,
//       message.notification!.title,
//       message.notification!.body,
//       platformChannelSpecifics,
//       payload: message.data.toString(),
//     );
//     print(
//         'Notification shown: ${message.notification!.title} ${message.notification!.body}');
//   }

//   String uri = 'http://172.19.21.46:5000';

//   Future<void> createNotification({
//     required DateTime scheduledTime,
//     required String token,
//     required String title,
//     required String body,
//   }) async {
//     try {
//       final message = json.encode({
//         'scheduledTime': scheduledTime.toIso8601String(),
//         'token': token,
//         'title': title,
//         'body': body,
//       });

//       final response = await http.post(
//         Uri.parse('$uri/notification/send'),
//         body: message,
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//       print('Notification created: ${response.body}');
//     } catch (error) {
//       print('Error creating notification: $error');
//     }
//   }

//   void sendNotification() async {
//     String deviceToken = await NotificationServices().getDeviceToken();
//     print('token: ${deviceToken}');
//     NotificationModel notification = NotificationModel(
//       scheduledTime: DateTime.now(),
//       title: 'New Notification',
//       body: 'This is a notification sent from Flutter',
//       token: deviceToken,
//     );

//     await createNotification(
//       scheduledTime: notification.scheduledTime,
//       title: notification.title,
//       body: notification.body,
//       token: notification.token,
//     );
//   }

// //******************************************************************* //
// //plan reminder
//   Future<void> scheduleNotification(
//       int id, DateTime scheduledTime, tz.Location location) async {
//     final locall = tz.local;

//     final AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'alarm_notification_$id',
//       'Alarm Notification $id',
//       'Shows an alarm notification at a certain time of day',
//       importance: Importance.high,
//       priority: Priority.high,
//       showWhen: false,
//     );
//     final NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await localNotificationPlugin.zonedSchedule(
//       id,
//       'Alarm $id',
//       "Don't forget your plan! Keep going on to finish before the end of the day.",
//       tz.TZDateTime.from(scheduledTime, locall),
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );

//     print('Notification scheduled successfully.');
//   }
// }
