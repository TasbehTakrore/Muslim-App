import 'package:alquramcommunity_frontend/controller/homescreen_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../core/constant/constants.dart';
import '../widget/home/customappbar.dart';
import '../widget/home/custombottomappbarhome.dart';
import '../widget/home/custombottomappbarhomeForLab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenControllerImp homeScreenControllerImp =
        Get.put(HomeScreenControllerImp());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;
    return WillPopScope(
        onWillPop: () async {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

          homeScreenControllerImp.changePage(4);
          Get.back();

          return false;
        },
        child: GetBuilder<HomeScreenControllerImp>(
            builder: (controller) => Scaffold(
                floatingActionButton: isLaptopScreen == false
                    ? FloatingActionButton(
                        backgroundColor: AppColor.primaryColor,
                        onPressed: () {
                          controller.changePage(4);
                        },
                        child: const Icon(Icons.home))
                    : CustomBottonAppBarHomeForLab(),
                floatingActionButtonLocation: isLaptopScreen == false
                    ? FloatingActionButtonLocation.centerDocked
                    : FloatingActionButtonLocation.miniEndDocked,
                appBar: AppBar(
                    shadowColor: AppColor.grey,
                    automaticallyImplyLeading: false,
                    //primary: true,
                    elevation: 0.0,
                    backgroundColor: AppColor.grey,
                    title: CustomAppBar(onPressedIcon: () {})
                    //titleTextStyle: TextStyle(text),
                    ),
                bottomNavigationBar: isLaptopScreen == false
                    ? const CustomBottonAppBarHome()
                    : SizedBox(),
                backgroundColor: AppColor.grey,
                body: controller.content.value

                //  FutureBuilder<List<String>>(
                //   future: homeScreenControllerImp.getMyCommu(),
                //   builder: (BuildContext context,
                //       AsyncSnapshot<List<String>> snapshot) {
                //     if (snapshot.connectionState == ConnectionState.waiting) {
                //       return const Center(child: CircularProgressIndicator());
                //     } else if (snapshot.hasError) {
                //       return const Center(
                //           child:
                //               Text('حدث خطأ في الاستعلام عن قاعدة البيانات'));
                //     } else {
                //       if (snapshot.hasData && snapshot.data != null) {

                //         // return ListView.builder(
                //         //   itemCount: snapshot.data!.length,
                //         //   itemBuilder: (BuildContext context, int index) {
                //         //     return Text(snapshot.data![index]);
                //         //   },
                //         // );
                //       } else {
                //         return const Center(child: Text('لا توجد بيانات'));
                //       }
                //     }
                //   },
                // ),
                //controller.listPage.elementAt(controller.currentPage)
                )));
  }
}
