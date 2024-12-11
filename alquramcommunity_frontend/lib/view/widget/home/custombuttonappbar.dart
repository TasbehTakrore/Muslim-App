import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData iconbutton;
  final bool? active;
  final double size;
  final Color defColor;
  final Color activeColor;
  const CustomButtonAppBar(
      {super.key,
      required this.textbutton,
      required this.iconbutton,
      required this.onPressed,
      required this.active,
      required this.size, required this.defColor, required this.activeColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(iconbutton,
            color: active == true ?  activeColor:defColor ,
            size: size - 2),
        Text(textbutton,
            style: TextStyle(
                color: active == true ?  activeColor:defColor,
                fontSize: size - 14))
      ]),
    );
  }
}
