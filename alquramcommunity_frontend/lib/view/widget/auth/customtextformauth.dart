import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  const CustomTextFormAuth(
    {super.key,
     required this.hinttext,
     required this.labelText,
     required this.iconData,
     this.mycontroller});

  final String hinttext;
  final String labelText;
  final IconData iconData;
  final TextEditingController? mycontroller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:15),
      child: TextFormField(
                controller: mycontroller,
                decoration: InputDecoration(
                  hintText: hinttext,
                  hintStyle:const TextStyle(fontSize: 15),
                  contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: labelText,
                  suffixIcon: Icon(iconData),
                  iconColor: AppColor.primaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color.fromARGB(255, 148, 40, 40)),
                    
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color:AppColor.primaryColor),

                    ),
                )
    
              ),
    );
  }
}