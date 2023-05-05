import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import '../../../controller/allcommunities_controller.dart';
import '../../../controller/specificCommunity_controller.dart';
import '../../../core/constant/routes.dart';
import '../home/customappbar.dart';


class ViewCommunity extends StatelessWidget {
  const ViewCommunity({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(AllCommunititiesController());
    return GetBuilder<SpecificCommunityController>(builder: (controller) {
      return WillPopScope(
          onWillPop: () async {
            Get.offAllNamed(AppRoute.AllCommunities);
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
                    shadowColor: AppColor.grey,
                    automaticallyImplyLeading: false,
                    //primary: true,
                    elevation: 0.0,
                    backgroundColor: AppColor.grey,
                    title: CustomAppBar(onPressedIcon: () {})
                    //titleTextStyle: TextStyle(text),
            ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical:10,horizontal: 15),
                        hintText: "Search",
                        suffixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(),
                        )
                      ),
                    ),
                   
                  ],
                )
              )));
    });
  }
}
