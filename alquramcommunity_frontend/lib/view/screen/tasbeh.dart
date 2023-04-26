import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../controller/tasbeehscreen_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/routes.dart';
import '../widget/Tasbeeh/addnewtasbeeh.dart';
import '../widget/Tasbeeh/customdropdown.dart';

class TasbeehScreen extends StatelessWidget {
  TasbeehScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    Get.put(TasbeehScreenController());

    return GetBuilder<TasbeehScreenController>(builder: (controller) {
      return WillPopScope(
          onWillPop: () async {
            Get.offAllNamed(AppRoute.home);
            return false;
          },
          child: Scaffold(
            body: Container(
                padding: EdgeInsets.only(top: 80),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImageAsset.mosque),
                      fit: BoxFit.cover,
                      opacity: 0.2,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xff266f52), Color(0xff266f52)],
                    )),
                width: double.infinity,
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.bottom,
                child: ListView(
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 50),
                                InkWell(
                                  onTap: () {
                                    controller.changeValue();
                                  },
                                  child: CircularPercentIndicator(
                                    radius: 150,
                                    lineWidth: 20,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    backgroundColor:
                                        Color.fromARGB(32, 252, 204, 92),
                                    percent:
                                        (controller.getValue() % 100 / 100),
                                    center: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          controller.getValue().toString(),
                                          style: const TextStyle(
                                              color: AppColor.thickYellow,
                                              fontSize: 40),
                                        ),
                                        Text(
                                          controller.gettasbeehtype(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    progressColor: AppColor.thickYellow,
                                  ),
                                ),
                                const SizedBox(height: 50),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext b) {
                                                return AddNewTasbeeh();
                                              });
                                        },
                                        child: const Icon(
                                          Icons.add_box,
                                          size: 60,
                                          color: Color.fromARGB(
                                              166, 255, 255, 255),
                                          weight: 100,
                                        ),
                                      ),
                                      SizedBox(
                                        //padding: EdgeInsets.only(top: 60),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        child: CustomDropdown(
                                          onChanged: (selectedItem) {
                                            controller
                                                .changeIteamIndex(selectedItem);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ));
    });
  }
}
