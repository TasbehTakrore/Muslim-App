import 'package:get/get.dart';

class CommunitityDetailsDialogController extends GetxController {
  Rx<String> buttonTxt='Request to join'.obs;
  Rx<bool> rqFLag=false.obs;
  void buttonText(){
    if(buttonTxt.value=="Request to join"){
      buttonTxt.value="Request sended";
      rqFLag.value=true;

      }


      else{
      buttonTxt.value="Reqest to join";
      rqFLag.value=false;
      }
    }
  }

