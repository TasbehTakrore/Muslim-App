import 'package:easy_actions/easy_actions.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';

class statisticsTrainerContent extends StatelessWidget {
  const statisticsTrainerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0),
        color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
        child: Center(
          child: Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              // primary: false,
              // padding: const EdgeInsets.all(20),
              // crossAxisSpacing: 10,
              // mainAxisSpacing:
              //     10, //  gridDelegate: SliverGridDelegate ( ),
              // crossAxisCount: 1,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  //child: Text("tasbeh"),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.15,
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  // child: Text("tasbeh"),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.15,
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  //child: Text("tasbeh"),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    //color: Color.fromARGB(42, 25, 108, 52),

                    color: Colors.white,
                  ),
                  // child: Text("tasbeh"),
                ),
                EasyElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.home);
                  },
                  height: 70,
                  width: MediaQuery.of(context).size.width / 2,
                  isRounded: true,
                  color: AppColor.secondaryColor,
                  label: "End",
                ),
              ]),
        ));
  }
}
