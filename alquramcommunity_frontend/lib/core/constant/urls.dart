class MyURL {
  static const String uri = 'http://192.168.1.19:5000';
  static const String addAllMistakeURL = '$uri/mistake/addMistakes';
  static const String getAllMistakeURL = '$uri/mistake/getMistakes/';
  static const String deleteMistake = '$uri/mistake/deleteMistake';
  static const String addCoins = '$uri/users/addCoins';
  //plan url's
  static const String addupActivePlanURL = '$uri/activeplan/addupPlan';
  static const String getPlanURL = '$uri/activeplan/getPlan';
  static const String addBackup= '$uri/BackUpplan/addBackUpRecord';
  static const String deleteRecords='$uri/BackUpplan/deleteRecord';
  static const String refreshRecords='$uri/activeplan/refreshTasks';
  static const String getWeekRecored='$uri/BackUpplan/getWeekData';
  //tasbeh url's
  static const String addTasbehCount = '$uri/tasbeh/addTasbehCount';
  static const String getTsbehCount='$uri/tasbeh/getUserTasbeh';

  //user url's
  static const String checkEmail = '$uri/users/checkEmail';
  static const String updatePassword= '$uri/users/updatePassword';


}
