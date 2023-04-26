import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../controller/specificCommunity_controller.dart';
import '../../../core/constant/routes.dart';
import '../Quran/editquranthemedialog.dart';
import 'chat.dart';
import 'customcommunitycard.dart';
import 'editcommunityplan.dart';
import 'userscommunity.dart';

class SpecificCommunity extends StatelessWidget {
  const SpecificCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Get.put(SpecificCommunityController());
    return GetBuilder<SpecificCommunityController>(builder: (controller) {
      return WillPopScope(
          onWillPop: () async {
            Get.offAllNamed(AppRoute.home);
            return false;
          },
          child: Scaffold(
              floatingActionButton: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                      heroTag: "setting",
                      backgroundColor: AppColor.thickYellow,
                      child: const Icon(Icons.settings),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext b) {
                              return EditCommunityPlan();
                            });
                      }),
                  const SizedBox(height: 5),
                  FloatingActionButton(
                      heroTag: "chat",
                      backgroundColor: AppColor.primaryColor,
                      child: const Icon(Icons.chat),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext b) {
                              return ChatDialog();
                            });
                      }),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              backgroundColor: AppColor.grey,
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "An-Najah Students Group",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.patrickHand(
                          //fontWeight: FontWeight.w500,
                          color: AppColor.primaryColor,
                          fontSize: 30),
                    ),
                    Text(
                      "Since Apr/2020",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.patrickHand(
                          //fontWeight: FontWeight.w500,
                          color: AppColor.primaryColor,
                          fontSize: 15),
                    ),
                    CustomCommunityCard(
                      title: 'Remining Time',
                      fontSize1: 15,
                      fontSize2: 40,
                      heigh: 200,
                      body: '12:45:30',
                    ),
                    SizedBox(height: 5),
                    const UsersCommunity(),
                    const SizedBox(height: 15),
                    Container(
                      height: 500,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: AppColor.light2Yellow,
                      ),
                    )
                  ],
                ),
              )));
    });
  }
}
