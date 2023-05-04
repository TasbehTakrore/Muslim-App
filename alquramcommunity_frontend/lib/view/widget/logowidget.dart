import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';

class logoWidget extends StatelessWidget {
  final double logowidth;
  final int sizeType;

  const logoWidget(
      {super.key, required this.logowidth, required this.sizeType});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          //padding: EdgeInsets.only(left: 6, right: 6),
          //color: Colors.amber,
          alignment: AlignmentDirectional.centerStart,
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    //width: 50,
                    height: 33,
                    //color: Colors.amber,

                    padding: EdgeInsets.only(top: 0, bottom: 0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Al-Quran",
                      style: GoogleFonts.patrickHand(
                          //fontWeight: FontWeight.w500,
                          color: AppColor.primaryColor,
                          fontSize: 30),
                    ),
                  ),
                  Container(
                      //width: 50,
                      height: 20,
                      //color: Colors.blue,
                      padding: EdgeInsets.only(left: 20, top: 0),
                      //alignment: Alignment.topLeft,
                      child: Text(
                        "Community",
                        style: GoogleFonts.patrickHand(
                            fontWeight: FontWeight.w200,
                            color: AppColor.black,
                            fontSize: 15),
                      ))
                  //   style: TextStyle(
                  //       fontFamily: "Quran",
                  //       letterSpacing: 3,
                  //       //fontWeight: FontWeight.bold,
                  //       fontSize: sizeType == 1 ? 30 : 16,
                  //       color: AppColor.black),
                  // ),
                ]),
            // Container(
            //     //width: 50,
            //     //height: 80,
            //     //color: Colors.blue,
            //     padding: EdgeInsets.only(left: 10, top: 0),
            //     //alignment: Alignment.topLeft,
            //     child: Text(
            //       "",
            //       style: TextStyle(
            //           color: AppColor.black,
            //           fontSize: 13,
            //           fontWeight: FontWeight.w200),
            //     ))
          ),
        ),
        // Container(
        //   // color: Colors.amber,
        //   padding: const EdgeInsets.only(top: 2),
        //   height: 100,
        //   width: 100,
        //   child: Image.asset(AppImageAsset.mosqueLine, fit: BoxFit.contain),
        // ),
      ],
    );
  }
}
