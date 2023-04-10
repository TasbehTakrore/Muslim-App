import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextSignUpIn extends StatelessWidget {
  final String text ; 
  final String text_signup;
  final void Function()? onTap;
  const CustomTextSignUpIn({super.key, required this.text, required this.text_signup, this.onTap});

  @override
  Widget build(BuildContext context) {
    return     Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            InkWell(
                onTap: onTap,
                child: Text(
              text_signup,
              style: const TextStyle(
                  color: AppColor.primaryColor, fontWeight: FontWeight.bold),
            ))
          ],
        );
  }
}