import 'package:alquramcommunity_frontend/data/datasource/static.dart';
import 'package:alquramcommunity_frontend/view/widget/thikr/ThikrCardTop.dart';
import 'package:alquramcommunity_frontend/view/widget/thikr/ThikrCardBottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controller/thikrCatgController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/front_models/thikrmodel.dart';

class ThikrDataCardArabic extends StatelessWidget {
  final String arabicText;
  final String subCatg;
  final double? fontSize;
  final TEXT? thikr;

  const ThikrDataCardArabic({super.key, required this.arabicText, required this.subCatg, this.fontSize, this.thikr});
  @override
   Widget build(BuildContext context) {
    ThikrCatgControllerImp thikrCatgController = Get.put(ThikrCatgControllerImp());
    return GetBuilder<ThikrCatgControllerImp>(
      builder: (controller) {
        return Stack(
          children: [
            Container(
              margin:EdgeInsets.symmetric(vertical: 30),
              child: Card(
                color:Colors.white70,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: AppColor.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  padding:const EdgeInsets.only(right: 20,left:20,top: 20,bottom: 20),
                  child:Column(
                    children: [
                      const ThikrCardsTop(),
                      const SizedBox(height:30),
                      Text(
                        arabicText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily:"QuranSurah1-mLKO5",
                          fontSize:20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height:20),
                    ],
                  ),
                ),
              ),
            ),
            ThikrsBottomWidget( subCatg: subCatg)
          ],
        );
      },
    );
  }
}
