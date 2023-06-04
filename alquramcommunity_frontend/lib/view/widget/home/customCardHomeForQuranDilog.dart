import 'package:alquramcommunity_frontend/controller/randomVerse_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/view/widget/home/randomVerseDilog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHomeForQuranDilog extends StatelessWidget {
  final String title;
  final String body;
  void Function()? onTap;
  final double fontSize1;
  final double fontSize2;
  final double heigh;

  CustomCardHomeForQuranDilog(
      {Key? key,
      required this.title,
      required this.body,
      this.onTap,
      required this.fontSize1,
      required this.fontSize2,
      required this.heigh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    RandomVerseController randomVerseController =
        Get.put(RandomVerseController());
    return InkWell(
      onTap: () {
        Get.dialog(RandomVerseDilog());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: randomVerseController.isChildMode()
                    ? AssetImage(AppImageAsset.childImage)
                    : AssetImage(AppImageAsset.mosque),
                fit: BoxFit.cover,
                opacity: 0.2,
              ),
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff266f52), Color(0xff266f52)],
              )),
          alignment: Alignment.center,
          // width: 600,
          height: heigh,
          child: ListTile(
            title: Text("تدبُّر..",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize1,
                    fontWeight: FontWeight.bold)),
            subtitle: Text(body,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                //randomVerseController.todeyVerse,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize2,
                    fontFamily: "Quran")),
          ),
        ),
      ),
    );
  }
}
