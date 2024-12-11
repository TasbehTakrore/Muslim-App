class Community {
  final int id;
  final String communityChatID;
  final String communityName;
  final String communityDescription;
  final String stickyMessage;
  final String adminEmail;
  final String usersGender;
  final bool timerFlag;
  final DateTime createdAt;
  final DateTime updatedAt;

  Community({
    required this.communityChatID,
    required this.id,
    required this.communityName,
    required this.communityDescription,
    required this.stickyMessage,
    required this.adminEmail,
    required this.usersGender,
    required this.timerFlag,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Community.fromJson(Map<String, dynamic> json) {
    return Community(
      communityChatID: json['communityChatID'],
      id: json['id'],
      communityName: json['communityName'],
      communityDescription: json['communityDescription'],
      stickyMessage: json['stickyMessage'],
      adminEmail: json['adminEmail'],
      usersGender: json['usersGender'],
      timerFlag: json['timerFlage'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
