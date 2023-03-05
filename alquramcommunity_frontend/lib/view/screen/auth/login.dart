import 'package:alquramcommunity_frontend/view/widget/auth/custombottomauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/customtextbodyauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/customtextformauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/customtexttitleauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: AppColor.grey_sec,

      /*
      appBar: AppBar(
        title: const Text('Sign In',style: Theme.of(context).textTheme.headline1),
        elevation: 0.0,
        centerTitle: true,
      ),*/


      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
        child: ListView(
          children:  [
            const SizedBox(height: 65),
            const CustomTextTitleAuth(
              text: "Hello Again ",
            ),

            const SizedBox(height: 10),
            const CustomTextBodyAuth(
              text :"Welcome back, you've been missed ! , Sign in with your account information or continue with Social Media.",

            ),
            const SizedBox(height: 25),
            const LogoAuth(),
            const SizedBox(height: 15),
            const CustomTextFormAuth(
              labelText: "Email",
              hinttext: "Enter your Email",
              iconData: Icons.email_outlined,
              //my controller
            ),
           
            const CustomTextFormAuth(
              labelText: "Password",
              hinttext: "Enter your password",
              iconData: Icons.lock_outline,
              //my controller
            ),

            const Text("Forget password",
            textAlign: TextAlign.end),
            
            const SizedBox(height: 15),
            const CustomBottomAuth(
              text: "Sign In",
              
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Don't have an account ?"),
              InkWell(child:Text("Sign Up!",style: TextStyle(color:AppColor.primaryColor,fontWeight: FontWeight.bold),))
            ],),

          ]),
      )
    );
  }
}
