import 'package:alquramcommunity_frontend/data/model/backend_to_front_models/user_model.dart';
import 'package:flutter/Material.dart';

class UserProvider extends ChangeNotifier{
 RegisterModel _user=RegisterModel(
  id: '',
  userName: '',
  userEmail: '',
  userPassword: '',
  userAge: 0,
  token: '', userGender: '', imageUrl: '',
  );
RegisterModel get user=>_user;
void SetUser(String user){
  _user=RegisterModel.fromJson(user);
  notifyListeners();
}

}