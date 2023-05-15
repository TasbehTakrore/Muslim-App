class MyURL {
  static const String uri = 'http://192.168.1.19:5000';
  // static const String uri = 'http://172.19.66.29:5000';

  static const String addAllMistakeURL = '$uri/mistake/addMistakes';
  static const String getAllMistakeURL = '$uri/mistake/getMistakes/';
  static const String deleteMistake = '$uri/mistake/deleteMistake';
  static const String addCoins = '$uri/users/addCoins';
  static const String getSurahMistakeURL = '$uri/mistake/getMistakesSurah/';
  static const String getJuzMistakeURL = '$uri/mistake/getMistakesJuz/';
  static const String getPagehMistakeURL = '$uri/mistake/getMistakesPage/';
  static const String createCommunityURL = '$uri/communities/createCommunity/';
  static const String getAllCommunitiesFemaleURL =
      '$uri/communities/findAllCommunitiesFemale';
  static const String getAllCommunitiesMaleURL =
      '$uri/communities/findAllCommunitiesMale';
  static const String sendRequest = '$uri/communities/requestToCommunity';
  static const String deleteRequest = '$uri/communities/deleteRequest';


  
}
