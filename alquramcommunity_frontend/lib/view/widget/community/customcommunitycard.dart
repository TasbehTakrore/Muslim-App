import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'communityPlan.dart';

class CustomCommunityCard extends StatelessWidget {
  final String title;
  final String body;
  void Function()? onTap;
  final double fontSize1;
  final double fontSize2;
  final double heigh;
  final bool isAdmin;

  CustomCommunityCard(
      {Key? key,
      required this.title,
      required this.body,
      this.onTap,
      required this.fontSize1,
      required this.fontSize2,
      required this.heigh,
      required this.isAdmin})
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                    visible: true,
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.person_add))),
                Text(title,
                    style: TextStyle(color: Colors.white, fontSize: fontSize1)),
                SizedBox(height: 10),
                Text(body,
                    style: TextStyle(
                        color: AppColor.thickYellow, fontSize: fontSize2)),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 8, 0, 8),
                        child: LinearPercentIndicator(
                          percent: 0.75,
                          width: MediaQuery.of(context).size.width / 1.3,
                          lineHeight: 16,
                          animation: true,
                          progressColor: Color.fromARGB(193, 252, 204, 92),
                          backgroundColor: Color(0xFFE0E3E7),
                          barRadius: Radius.circular(12),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      // const Text(
                      //   "..75% ",
                      //   style: TextStyle(
                      //       fontSize: 12, color: AppColor.thickYellow),
                      // )
                    ],
                  ),
                ),
                SizedBox(height: 12),
                InkWell(
                  onTap: () => {
                    showDialog(
                        context: context,
                        builder: (BuildContext b) {
                          return CommunityPlan();
                        })
                  },
                  child: Text(
                    "View the community plan",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
