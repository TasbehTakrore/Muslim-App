import 'package:alquramcommunity_frontend/controller/commnity_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/view/widget/community/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'customdropdown.dart';

TextEditingController _textEditingController = TextEditingController();

class AddAnouncmentDialog extends StatelessWidget {
  final int communityID;

  AddAnouncmentDialog({super.key, required this.communityID});
  @override
  Widget build(BuildContext context) {
    // CustomDropdownController customDropdownController =
    //     Get.put(CustomDropdownController());
    CommunitityController communitityController =
        Get.put(CommunitityController());
    return AlertDialog(
      // backgroundColor: Color.fromARGB(200, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Container(
        padding: EdgeInsets.only(top: 20),
        height: 230,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("أضِف إعلانًا جديدًا"),
            SizedBox(height: 20),
            TextField(
              controller: _textEditingController,
              maxLength: 100,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                hintText: 'أدخِل إعلانك هُنا',
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
                    print(
                        "_textEditingController: ${_textEditingController.text}");
                    communitityController.addAnouncement(
                        communityID, _textEditingController.text);
                    // customDropdownController.items
                    //     .add(_textEditingController.text);
                    // controller.tasbehTypes.add(_textEditingController.text);
                    // controller.tasbehValue.add(0.obs);

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
