import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class ThikrCardsTop extends StatelessWidget {
  
  const ThikrCardsTop({super.key});

 
  @override
   Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: (){

                  },
                  child:const Icon(
                    Icons.refresh,
                    color: AppColor.primaryColor,
                    size: 45,),
                  
                ),
              ),
               Align(
                alignment: Alignment.topRight,
                 child: InkWell(
                    onLongPress: (){
                      
                    },
                   child:const Icon(
                    Icons.copy,
                   color: AppColor.primaryColor,
                   size: 30,),
                 ),
               ),
            ],);

  }
  
}
 





