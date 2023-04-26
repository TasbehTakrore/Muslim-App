import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/view/widget/trainer/juzcontentdialog.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import '../../../controller/trainerdialog_controller.dart';
import 'pagescontentdialog.dart';
import 'surahcontentdialog.dart';

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
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 1.49,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      //padding: EdgeInsets.only(bottom: 10),
                      margin: const EdgeInsets.only(bottom: 20),
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
                      ? const JuzContentDialog()
                      : controller.getIndex() == 2
                          ? const SurahsContentDialog()
                          : const PagesContentDialog(),
                ],
              ),
            ));
      },
    );
  }
}
