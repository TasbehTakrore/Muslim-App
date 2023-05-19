
import 'package:alquramcommunity_frontend/data/datasource/static.dart'; 
import 'package:flutter/material.dart'; 
import 'package:get/get.dart'; 
 
import '../../../controller/thikrCatgController.dart'; 
import '../../../core/constant/color.dart'; 
import '../../../core/constant/imageasset.dart'; 
import '../../../core/constant/routes.dart'; 
 
class ThikrHomeCard2 extends StatelessWidget { 
  const ThikrHomeCard2({Key? key}) : super(key: key); 
 
  @override 
  Widget build(BuildContext context) { 
    ThikrCatgControllerImp controller=Get.put(ThikrCatgControllerImp()); 
    return GridView.builder( 
      itemCount: ThikrCategoryList.length, 
      physics: const NeverScrollableScrollPhysics(), 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( 
        crossAxisCount: 2, 
        childAspectRatio: 1, 
      ), 
      shrinkWrap: true, 
      itemBuilder: (context, index) { 
        return Container( 
          padding: const EdgeInsets.only(left: 15, right: 15, top: 7), 
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12), 
          decoration: BoxDecoration( 
            color: AppColor.lightYellow, 
            borderRadius: BorderRadius.circular(20), 
          ), 
          child: Column( 
            children: [ 
              InkWell( 
                onTap: () async {  
                  await controller.selectThikr(index); 
                  Get.toNamed(AppRoute.thikrdetails, arguments: ['$index']); 
                }, 
                child: Container( 
                  margin: const EdgeInsets.only( 
                      top: 2, left: 10, right: 10, bottom: 2), 
                  height: 90, 
                  width: 90, 
                  child: Image.asset("${ThikrCategoryList[index].image}"), 
                ), 
              ), 
              Container( 
                  padding: EdgeInsets.only(top: index == 2 ? 2 : 13), 
                  alignment: Alignment.bottomCenter, 
                  child: Text("${ThikrCategoryList[index].title}", 
                      style: TextStyle( 
                          color: AppColor.black, 
                          fontWeight: FontWeight.bold, 
                          fontSize: index < 5 ? 14 : 14, 
                          fontFamily: "Cairo"))), 
            ], 
          ), 
        ); 
      }, 
    ); 
  } 
}