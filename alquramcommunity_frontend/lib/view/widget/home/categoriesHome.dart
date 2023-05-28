import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../controller/homescreen_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/constants.dart';
import '../../../data/datasource/static.dart';
import '../Quran/surahsdialog.dart';

class ListCategoriesHome extends StatelessWidget {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;
    return SizedBox(
      height: (isLaptopScreen == true) ? screenWidth / 4.8 : 105,
      child: ListView.separated(
        separatorBuilder: (context, index) => (isLaptopScreen == true)
            ? const SizedBox(width: 20)
            : const SizedBox(width: 10),
        itemCount: CategoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return (isLaptopScreen == true) && ((index == 3) || (index == 5))
              ? SizedBox()
              : Column(children: [
                  InkWell(
                    onTap: index > 2
                        ? CategoryList[index].onPressed
                        : () => showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CategoryList[index].onPressedWidgetDialog!;
                            }),
                    // CategoryList[index].onPressed,
                    child: Container(
                        decoration: BoxDecoration(
                            color: index < 2
                                ? AppColor.secondaryColor
                                : AppColor.lightYellow,
                            borderRadius: BorderRadius.circular(15)),
                        width: (isLaptopScreen == true) ? screenWidth / 7 : 68,
                        height: (isLaptopScreen == true) ? screenWidth / 7 : 68,
                        padding: const EdgeInsets.all(12),
                        child:
                            SvgPicture.asset("${CategoryList[index].image}")),
                  ),
                  const SizedBox(height: 4),
                  Text("${CategoryList[index].title}",
                      style: TextStyle(
                          fontSize: index < 2 ? 14 : 14,
                          fontWeight:
                              index < 2 ? FontWeight.bold : FontWeight.normal))
                ]);
        },
      ),
    );
  }
}
