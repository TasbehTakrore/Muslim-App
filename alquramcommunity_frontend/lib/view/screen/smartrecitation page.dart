import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../controller/smartrecitation_controller.dart';

class SmartRecitation extends StatelessWidget {
  const SmartRecitation({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SmartRecitationController());

    return GetBuilder<SmartRecitationController>(
        builder: (controller) => Scaffold(body: Text("Tas")));
  }
}
