import 'package:alquramcommunity_frontend/data/datasource/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/thikrCatgController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/routes.dart';
import '../custombuttomlang.dart';

class ThikrsBottomWidget extends StatelessWidget {
  final int Catg;
  final int subCatg;

  const ThikrsBottomWidget({Key? key, required this.Catg, required this.subCatg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
      ThikrCatgControllerImp thikrCatgController = Get.put(ThikrCatgControllerImp());
    return GetBuilder<ThikrCatgControllerImp>(
      init: ThikrCatgControllerImp(),
      builder: (thikrCatgController) {
        return Positioned(
          bottom: 0,
          left: MediaQuery.of(context).size.width / 4,
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.width / 5,
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: CustomButton(
                color: AppColor.black,
                onPressed: () {
                  thikrCatgController.decrementRepeat(Catg, subCatg);
                },
                textbutton:
                    '${thikrCatgController.countersList[Catg][subCatg]}',
              ),
            ),
          ),
        );
      },
    );
  }
}
