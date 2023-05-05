
import 'package:alquramcommunity_frontend/view/screen/auth/signup.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../core/services/services.dart';
import 'package:alquramcommunity_frontend/core/services/auth_services.dart';

import 'auth/signup_controller.dart';

MyServices myServices = Get.put(MyServices());
SignUpControllerImp controller = Get.put(SignUpControllerImp());
class ProfileController extends GetxController {
  MyServices myServices = Get.put(MyServices());
  RxString userName=''.obs;
  RxString userEmail=''.obs;
  RxString userAge=''.obs;
  RxString userGender=''.obs;
  String?location;
  RxString img=''.obs;
  String?joinDate;

 @override
  void onInit() {
    super.onInit();
    //userInformation();
    }
  
Future<void> userInformation() async{
  print(myServices.sharedPreferences.getInt("user_id").toString());
  final userProfile= await authservices.getUserProfile(myServices.sharedPreferences.getInt("user_id")!);
  userName.value=userProfile['user']['userName'];
  userEmail.value=userProfile['user']['userEmail'];
  userAge.value=userProfile['user']['userAge'].toString();
  userGender.value=userProfile['user']['userGender'];
  location="Palestine";
  final createdAt = DateTime.parse(userProfile['user']['createdAt']);
  final formattedDate = DateFormat('yyyy-MM-dd').format(createdAt);
  joinDate=formattedDate;
  print('${authservices.uri}/images/${userProfile['user']['imageUrl']}');
  img.value ='${authservices.uri2}/AlQuranCommunity_BackEnd/images/${userProfile['user']['imageUrl']}';

}

void setDetails(){
  controller.name.text=userName.value;
  controller.age.text=userAge.value;
  controller.selectedGender.value=userGender.value;
}
void updateDetails(){
  authservices.updateUser(
    id: (myServices.sharedPreferences.getInt("user_id")!.toString()),
    name:controller.name.text ,
    age: controller.age.text ,
    gender: controller.selectedGender.value,
    password: controller.password.text,
    checkPassword: controller.checkPassword.text);
}
void clearFields(){
  controller.name.text='';
  controller.age.text='';
  controller.password.text='';
  controller.checkPassword.text='';


}

}
