import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import 'package:easy_actions/easy_actions.dart';

class CustomButtonLang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, required this.textbutton, this.onPressed});

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
          color: AppColor.primaryColor,
          onPressed: onPressed,
        ));
  }
}
