import 'package:get/get.dart';
import '../core/services/auth_services.dart';
import '../core/services/notificationServices.dart';
 import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class NotificationController extends GetxController {
  int userId = 0;
  NotificationServices notifyServices = Get.put(NotificationServices());
  List<dynamic> notifications = [];

  Future <List<dynamic>> getNotifications() async {
    userId = myServices.sharedPreferences.getInt("user_id")!;
    return notifyServices.getUserNotificationHistory(userId.toString());
  }
String convertToArabicDateTime(String dateTimeString) {
  initializeDateFormatting('ar', null);  var inputFormat = DateFormat('h:mma M/d/yyyy');
  var outputFormat = DateFormat('hh:mm a dd/MM/yyyy', 'ar');
  var dateTime = inputFormat.parse(dateTimeString);  var formattedDateTime = outputFormat.format(dateTime);
  return formattedDateTime;
}
}
