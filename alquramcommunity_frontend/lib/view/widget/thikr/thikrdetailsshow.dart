import 'package:alquramcommunity_frontend/data/datasource/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/routes.dart';

class ThikrDetailsShow extends StatelessWidget {
  
  const ThikrDetailsShow({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.9,
      //physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for(int i=0;i<=5;i++)
        Container(
          padding: EdgeInsets.only(left:15,right:15,top:7),
          margin : EdgeInsets.symmetric(vertical: 8,horizontal: 12),
          decoration: BoxDecoration(
            color: AppColor.lightgreen,/*
            gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff2C8066), Color(0xff5FCFAE)],
              ),*/
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                   Get.toNamed(AppRoute.thikrdetails,arguments: [{'$i'}]);
                },
                child: Container(
                  margin: EdgeInsets.only(top:2,left:10,right:10,bottom:2),

                  child: Image.asset("${ThikrCategoryList[i].image}"),
                  height: 90,
                  width:90,
                ),
              ),
              Container(

                padding:EdgeInsets.only(top :i==0 ? 2: 12),
                alignment: Alignment.bottomCenter,
                child: Text(
                  "${ThikrCategoryList[i].title}",
                  style:TextStyle(color: AppColor.black,fontWeight: FontWeight.bold,
                  fontSize: i<5 ?16 : 16,
                  fontFamily: "Cairo")
                )

              ),
            ],
          ),

        )
      ],

      );
  }
}
