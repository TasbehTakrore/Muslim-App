import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData iconbutton;
  final bool? active;

  const CustomButtonAppBar(
      {super.key,
      required this.textbutton,
      required this.iconbutton,
      required this.onPressed,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(iconbutton,
            color: active == true ? AppColor.primaryColor : Colors.black),
        Text(textbutton,
            style: TextStyle(
                color: active == true ? AppColor.primaryColor : Colors.black))
      ]),
    );
  }
}
