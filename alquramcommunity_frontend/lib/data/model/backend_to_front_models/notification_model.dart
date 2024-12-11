class NotificationModel {
  NotificationModel({
    required this.scheduledTime,
    required this.title,
    required this.body,
    required this.token,
  });
  late final DateTime scheduledTime;
  late final String title;
  late final String body;
  late final String token;
  
  NotificationModel.fromJson(Map<String, dynamic> json){
    scheduledTime = json['scheduledTime'];
    title = json['title'];
    body = json['body'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['scheduledTime'] = scheduledTime;
    _data['title'] = title;
    _data['body'] = body;
    _data['token'] = token;
    return _data;
  }
}