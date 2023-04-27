import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../controller/alarmController.dart';
import '../../../controller/prayscreen_controller.dart';
import '../../../core/constant/color.dart';

class EditProfile extends StatelessWidget {

  const EditProfile({super.key});
  @override
  Widget build(BuildContext context) {
    
    return Dialog(
      
      backgroundColor: Colors.transparent,
      child: Container(
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child:  Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text("Edit Profile Information",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height:10),  
                
               
        
                  ],
              
          ),
        ),
      ),
    );
  }
}
