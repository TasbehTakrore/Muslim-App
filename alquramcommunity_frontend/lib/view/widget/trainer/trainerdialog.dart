import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/view/widget/trainer/pagecardtrainer.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

import '../../../controller/trainerdialog_controller.dart';
import '../recitation/listsurahcardrecitation.dart';
import 'juzcardtrainer.dart';
import 'listsurahcarttrainer.dart';

class TrainerDialog extends StatelessWidget {
  const TrainerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrainerDialogController());

    return GetBuilder<TrainerDialogController>(
      builder: (controller) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      //padding: EdgeInsets.only(bottom: 10),
                      margin: EdgeInsets.only(bottom: 20),
                      //color: Colors.amber,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      child: CustomSlidingSegmentedControl<int>(
                          fixedWidth:
                              MediaQuery.of(context).size.width / (1.5 * 3.2),
                          height: 39,
                          initialValue: controller.getIndex(),
                          children: {
                            1: Text('juz\'',
                                style: TextStyle(
                                    color: controller.getIndex() == 1
                                        ? AppColor.black
                                        : Colors.white)),
                            2: Text('Surah',
                                style: TextStyle(
                                    color: controller.getIndex() == 2
                                        ? AppColor.black
                                        : Colors.white)),
                            3: Text('Pages',
                                style: TextStyle(
                                    color: controller.getIndex() == 3
                                        ? AppColor.black
                                        : Colors.white))
                          },
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          thumbDecoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.3),
                                    blurRadius: 4.0,
                                    spreadRadius: 1.0,
                                    offset: const Offset(0.0, 2.0))
                              ]),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInToLinear,
                          onValueChanged: (v) {
                            controller.changeIndex(v);
                          })),
                  controller.getIndex() == 1
                      ? Container(
                          //color: Color.fromARGB(255, 181, 20, 20),
                          height: MediaQuery.of(context).size.height / 1.75,
                          width: MediaQuery.of(context).size.width,
                          child: GridView.builder(
                            itemCount: 30,
                            itemBuilder: (BuildContext context, int index) {
                              return FadeInDown(
                                  duration: const Duration(milliseconds: 300),
                                  child: JuzCardTrainer(
                                    surahNumber: index + 1,
                                  ));
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                          ))
                      : controller.getIndex() == 2
                          ? Container(
                              // color: Color.fromARGB(255, 235, 244, 54),
                              //height: 600,
                              height: MediaQuery.of(context).size.height / 1.75,
                              child: SizedBox(
                                width: 600,
                                child: ListView(
                                  children: const [
                                    Text("Surahs of the Qur'an",
                                        style: TextStyle(fontFamily: "Cairo")),
                                    SizedBox(height: 6),
                                    ListSurahCardTrainer()
                                  ],
                                ),
                              ))
                          : Container(
                              //color: Color.fromARGB(255, 153, 161, 0),
                              height: MediaQuery.of(context).size.height / 1.75,
                              width: MediaQuery.of(context).size.width,
                              child: GridView.builder(
                                itemCount: 604,
                                itemBuilder: (BuildContext context, int index) {
                                  return PageCardTrainer(
                                    surahNumber: index + 1,
                                  );
                                },
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                ),
                              ),
                            )
                ],
              ),
            ));
      },
    );
  }
}
