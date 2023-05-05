import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class CustomTextFormAuth extends StatelessWidget {
  const CustomTextFormAuth(
    {super.key,
     required this.hinttext,
     required this.labelText,
     required this.iconData,
     required this.mycontroller,
     this.obscureText = false, 
     this.onTapIcon,
     });

  final String hinttext;
  final String labelText;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final bool obscureText;
  final void Function()? onTapIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:15),
      child: TextFormField(

                controller: mycontroller,
                obscureText: obscureText==null||obscureText==false?false:true,
                
                decoration: InputDecoration(
                  hintText: hinttext,
                  hintStyle:const TextStyle(fontSize: 15),
                  contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: labelText,
                  labelStyle: const TextStyle(color: AppColor.primaryColor),
                  suffixIcon: Theme(
                    data: ThemeData(iconTheme: IconThemeData(color:AppColor.primaryColor)),
                    child: InkWell(child:Icon(iconData),onTap: onTapIcon,),
                  ),             
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