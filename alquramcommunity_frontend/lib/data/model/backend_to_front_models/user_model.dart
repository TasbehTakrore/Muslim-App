
import 'dart:convert';

class RegisterModel {

    final String id;
    final String userName;
    final String userEmail;
    final int userAge;
    final String userPassword;
    //String userGender;

    RegisterModel({
        required this.id,
        required this.userName,
        required this.userEmail,
        required this.userAge,
        required this.userPassword,
        //required this.userGender,
    });

    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'userEmail': userEmail,
      'userAge': userAge,
      'userPassword': userPassword,
    
    };
  }
 
  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      id: map['id'] ?? '',
      userName: map['userName'] ?? '',
      userEmail: map['userEmail'] ?? '',
      userAge: map['userAge'] ?? '',
      userPassword: map['userPassword'] ?? '',

    );
  }

String toJson()=> json.encode(toMap());
factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source));



   
     
 

  

   
}
