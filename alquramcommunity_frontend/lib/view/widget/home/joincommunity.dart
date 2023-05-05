import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';

class JoinCommunity extends StatelessWidget {
  const JoinCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 12, 12),
        child: GestureDetector(
          onTap: (){
            Get.toNamed(AppRoute.AllCommunities);
          },
          child: Container(
            width: 230,
            decoration: BoxDecoration(
              color: AppColor.lightYellow,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x34090F13),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              // padding: EdgeInsets.all(20),
              //color: Colors.red,
              child: Column(
                children: [
                  Container(
                      width: 230,
                      height: 181,
                      padding: EdgeInsets.all(23),
                      alignment: AlignmentDirectional(0, 0),
                      child: Column(children: const [
                        Icon(Icons.add, color: Colors.white, size: 80),
                        Text(
                          "Join New Community!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
                ],
              ),
            ),
          ),
        ));
  }
}
