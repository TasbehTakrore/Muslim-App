import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../controller/tasbeehscreen_controller.dart';
import '../../../core/constant/quranconst.dart';
import '../custombuttomlang.dart';
import 'customdropdown.dart';

TextEditingController _textEditingController = TextEditingController();

class AddNewTasbeeh extends StatelessWidget {
  AddNewTasbeeh({super.key});
  @override
  Widget build(BuildContext context) {
    TasbeehController controller = Get.put(TasbeehController());
    CustomDropdownController customDropdownController =
        Get.put(CustomDropdownController());

    return AlertDialog(
      backgroundColor: Color.fromARGB(200, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Container(
        padding: EdgeInsets.only(top: 20),
        height: 230,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("أضف تسبيحةً جديدة"),
            SizedBox(height: 20),
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                hintText: 'أدخل التّسبيحة هُنا',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColor.primaryColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColor.secondaryColor)),
                  onPressed: () {
                    customDropdownController.items
                        .add(_textEditingController.text);
                    controller.tasbehTypes.add(_textEditingController.text);
                    controller.tasbehValue.add(0.obs);

                    //controller.addNewTasbeeh();
                    Get.back();
                  },
                  icon: const Icon(Icons.add),
                  label: const Text(
                    "إضافة",
                    style: TextStyle(fontSize: 18),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
