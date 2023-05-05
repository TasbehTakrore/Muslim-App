import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdownController extends GetxController {
  var isExpanded = false.obs;
  var selectedItem = "سبحان الله".obs;
  var items = <String>[
    "سبحان الله",
    "الحمد لله",
    "لا إله إلّا الله",
    "الله أكبر",
    "لا حول ولا قوة إلا بالله",
    "أستغفر الله",
    "اللهمّ صلّ على محمّد"
  ].obs;

  void toggleExpansion() => isExpanded.toggle();

  void selectItem(String item) {
    selectedItem.value = item;
    isExpanded.value = false;
  }

  void setItems(List<String> itemList) {
    items.value = itemList;
    selectedItem.value = itemList.first;
  }
}

class CustomDropdown extends StatelessWidget {
  final CustomDropdownController controller =
      Get.put(CustomDropdownController());

  final Function(String) onChanged;

  CustomDropdown({
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(() => Container(
              margin: EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: GestureDetector(
                onTap: controller.toggleExpansion,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Text(
                        controller.selectedItem.value,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Icon(
                      controller.isExpanded.value
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      size: 45,
                    ),
                  ],
                ),
              ),
            )),
        Obx(() => Visibility(
              visible: controller.isExpanded.value,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: controller.items.value
                      .map((item) => GestureDetector(
                            onTap: () {
                              controller.selectItem(item);
                              onChanged(item);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            )),
      ],
    );
  }
}
