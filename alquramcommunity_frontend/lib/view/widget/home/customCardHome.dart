import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String body;
  const CustomCardHome({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xff2C8066),
                  Color(0xff5FCFAE)
                  //AppColor.primaryColor,
                  // AppColor.secondaryColor,
                ],
              )),

          alignment: Alignment.center,
          height: 150,
          // decoration: BoxDecoration(
          //     color: AppColor.primaryColor,
          //     borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            title: Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 20)),
            subtitle: Text(body,
                style: const TextStyle(color: Colors.white, fontSize: 30)),
          ),
        ),
        // Positioned(
        //   top: -60,
        //   right: -60,
        //   child: Container(
        //     height: 160,
        //     width: 160,
        //     decoration: BoxDecoration(
        //         color: AppColor.secondaryColor,
        //         borderRadius: BorderRadius.circular(160)),
        //   ),
        //)
      ]),
    );
  }
}
