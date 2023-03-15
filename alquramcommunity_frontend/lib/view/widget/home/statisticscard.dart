import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColor.lightYellow
          // gradient: const LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [Color(0xff2C8066), Color(0xff5FCFAE)],
          // )
          ),
      height: 500,
      width: double.infinity,
      margin: EdgeInsets.only(top: 40),
    );
  }
}
