import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String body;
  void Function()? onTap;
  final double fontSize1;
  final double fontSize2;
  final double heigh;

  CustomCardHome(
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
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(AppImageAsset.mosque),
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
            height: heigh,
            child: ListTile(
              title: Text(title,
                  style: TextStyle(color: Colors.white, fontSize: fontSize1)),
              subtitle: Text(body,
                  style: TextStyle(color: Colors.white, fontSize: fontSize2)),
            ),
          ),
        ]),
      ),
    );
  }
}
