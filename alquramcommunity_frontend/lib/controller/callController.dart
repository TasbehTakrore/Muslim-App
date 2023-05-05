// import 'package:get/get.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

// class CallController extends GetxController {
//   final DateTime scheduledTime;

//   CallController(this.scheduledTime);

//   void scheduleCall() async {
//     DateTime now = DateTime.now();
//     Duration difference = scheduledTime.difference(now);
//     if (difference.inSeconds > 0) {
//       await Future.delayed(Duration(seconds: difference.inSeconds));
//       FlutterPhoneDirectCaller.callNumber('<PHONE_NUMBER>');
//     }
//   }
// }
