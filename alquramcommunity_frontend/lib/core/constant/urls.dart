class MyURL {
  static const String uri = 'http://192.168.1.106:5000';

  // static const String uri = 'http://172.19.108.121:5000';

  static const String addAllMistakeURL = '$uri/mistake/addMistakes';
  static const String getAllMistakeURL = '$uri/mistake/getMistakes/';
  static const String deleteMistake = '$uri/mistake/deleteMistake';
  static const String addCoins = '$uri/users/addCoins';
  //plan url's
  static const String addupActivePlanURL = '$uri/activeplan/addupPlan';
  static const String getPlanURL = '$uri/activeplan/getPlan';
  static const String addBackup = '$uri/BackUpplan/addBackUpRecord';
  static const String deleteRecords = '$uri/BackUpplan/deleteRecord';
  static const String refreshRecords = '$uri/activeplan/refreshTasks';
  static const String getWeekRecored = '$uri/BackUpplan/getWeekData';
  //tasbeh url's
  static const String addTasbehCount = '$uri/tasbeh/addTasbehCount';
  static const String getTsbehCount = '$uri/tasbeh/getUserTasbeh';

  //user url's
  static const String checkEmail = '$uri/users/checkEmail';
  static const String updatePassword = '$uri/users/updatePassword';

  static const String getSurahMistakeURL = '$uri/mistake/getMistakesSurah/';
  static const String getJuzMistakeURL = '$uri/mistake/getMistakesJuz/';
  static const String getPagehMistakeURL = '$uri/mistake/getMistakesPage/';
  static const String createCommunityURL = '$uri/communities/createCommunity/';
  static const String getAllCommunitiesFemaleURL =
      '$uri/communities/findAllCommunitiesFemale';
  static const String getAllCommunitiesMaleURL =
      '$uri/communities/findAllCommunitiesMale';
  static const String getAllCommunitie = '$uri/communities/findAllCommunities';
  static const String sendRequest = '$uri/communities/requestToCommunity';
  static const String deleteRequest = '$uri/communities/deleteRequest';
  static const String addMemberCommunity =
      '$uri/communities/addMemberCommunity';
  static const String getMyCommunities = '$uri/communities/getMyCommunities';
  static const String getAllMemberRequests =
      '$uri/communities/getAllMemberRequests';
  static const String getAllCommunityMembers =
      '$uri/communities/getAllCommunityMembers';

  // showUserByEmail

  //notifciation
    static const String addPlanNotification = '$uri/notify/addUpdatePlanNotfication';
   static const String checkPlanNotification = '$uri/notify/checkUserWithPlanAlarm';
   static const String getUserAllnotification = '$uri/notify/getUserNotification';


}
