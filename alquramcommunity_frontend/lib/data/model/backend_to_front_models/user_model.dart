
import 'dart:convert';

class RegisterModel {

    final String id;
    final String userName;
    final String userEmail;
    final int userAge;
    final String userPassword;
    final String userGender;
    final String token ;
    final String imageUrl;

    RegisterModel({
        required this.id,
        required this.userName,
        required this.userEmail,
        required this.userAge,
        required this.userGender,
        required this.userPassword,
        required this.token,
        required this.imageUrl,
    });

    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'userEmail': userEmail,
      'userAge': userAge,
      'userGender': userGender,
      'userPassword': userPassword,
      'token':token,
      'imageUrl':imageUrl
    
    };
  }
 
  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      id: map['id'] ?? '',
      userName: map['userName'] ?? '',
      userEmail: map['userEmail'] ?? '',
      userAge: map['userAge'] ?? 0,
      userGender: map['userGender'] ?? '',
      userPassword: map['userPassword'] ?? '',
      token: map['token'] ?? '',
      imageUrl:map['imageUr;']??'',

    );
  }

String toJson()=> json.encode(toMap());
factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source));

}
