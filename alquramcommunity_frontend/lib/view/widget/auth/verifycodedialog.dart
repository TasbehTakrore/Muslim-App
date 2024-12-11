import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/fogetpassword_controller.dart';
import '../../../controller/auth/plan_controller.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/quranconst.dart';
import '../custombuttomlang.dart';

class VerifyCodeDialog extends StatelessWidget {
  VerifyCodeDialog({Key?key});
  @override
  Widget build(BuildContext context) {
      ForgetPasswordControllerImp controller =
      Get.put(ForgetPasswordControllerImp());
    return GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => Container(
          width: double.infinity,
          child: AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                content: SingleChildScrollView(
            child: Form(
              child: SizedBox(
                height: 500,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 50,
                      
                      child: TextFormField(
                        
                        autocorrect: true,
                        style: TextStyle(fontSize: 15),
                        decoration: controller.inputeDecoration,
                        textAlign: TextAlign.center,
                        
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
              
            
            
              ),
        ));
  }
}
