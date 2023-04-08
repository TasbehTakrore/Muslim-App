import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import 'package:easy_actions/easy_actions.dart';

class CustomButton extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  final Color color;
  const CustomButton(
      {super.key,
      required this.textbutton,
      this.onPressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.amber,
        padding: const EdgeInsets.symmetric(
            //horizontal: 20,
            ),
        width: double.infinity,
        child: EasyElevatedButton(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(15),
          label: textbutton,
          isRounded: true,
          labelStyle: Theme.of(context).textTheme.bodyLarge,
          //height: ,
          labelColor: AppColor.grey,
          color: color,
          onPressed: onPressed,
        ));
  }
}
