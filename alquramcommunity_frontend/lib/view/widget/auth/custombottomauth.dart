import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomBottomAuth extends StatelessWidget {
  final String text ;
  final void  Function()? onPressed;
  const CustomBottomAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color:  AppColor.primaryColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      onPressed: onPressed,
      
      textColor: AppColor.grey,
      child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        
      
      ),
    );

  }
}