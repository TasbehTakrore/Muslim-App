import 'dart:convert';

class UserModel {
  final int id;
  final String userName;
  final String userEmail;
  final int userAge;
  final String userGender;
  final String imageUrl;

  UserModel({
    required this.id,
    required this.userName,
    required this.userEmail,
    required this.userAge,
    required this.userGender,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'userEmail': userEmail,
      'userAge': userAge,
      'userGender': userGender,
      'imageUrl': imageUrl
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      userName: map['userName'] ?? '',
      userEmail: map['userEmail'] ?? '',
      userAge: map['userAge'] ?? 0,
      userGender: map['userGender'] ?? '',
      imageUrl: map['imageUr;'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
