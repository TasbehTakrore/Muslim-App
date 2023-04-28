import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/qiblascreen_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';


class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
    return WillPopScope(
        onWillPop: () async {
          Get.toNamed(AppRoute.home);
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.white70,
          body: FutureBuilder(
            future:_deviceSupport ,
            builder: (_,AsyncSnapshot<bool?> snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(snapshot.hasError){
                return Center(
                  child: Text("Error : ${snapshot.error.toString()}"),
                );
              }
              if(snapshot.hasData){
                return QiblahCompass();
              }
              else {
                return const Center(
                  child: Text("your device doesn't support")
                );
              }


            }
          )
     
          
          
          
         /* 
          Column(
            children: [
              const SizedBox(height:30),
              const Center(
                child: Text("Qibla Compass",
                style: TextStyle(color:AppColor.primaryColor,fontWeight: FontWeight.bold,fontSize: 25),),
              ),
              const SizedBox(height:30),
              SizedBox(
              height: width,width:width,
              child:Center(
                child: Stack(
                  
                  alignment: Alignment.center,
                  children: [
                   Obx(()=>
                    Transform.rotate(
                      angle: (qiblaController.qiblaDirection.value * (pi / 180) * -1),
                      child: SvgPicture.asset("assets/images/compass.svg",height: width,width:width),
                     ),),
                    Obx(()=> 
                    Transform.rotate(
                     angle: (qiblaController.qiblaDirection.value * (pi / 180) * -1),
                     alignment: Alignment.center,
                     child:SvgPicture.asset("assets/images/needle.svg",height: width,width:width),
                     ),)
                    
              
                  ],
                ),
              ),
               
              
              ),
             
              
            ],
          ),
           
           
           */
              ),
            );
 
  }
}
