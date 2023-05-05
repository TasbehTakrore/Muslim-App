import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/view/widget/community/communitydetailts.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import '../../../controller/allcommunities_controller.dart';
import '../../../controller/specificCommunity_controller.dart';
import '../../../core/constant/routes.dart';
import '../home/customappbar.dart';
class AllCommunities extends StatelessWidget {
  const AllCommunities({super.key});

  @override
  Widget build(BuildContext context) {

    AllCommunititiesController allCommunititiesController=Get.put(AllCommunititiesController());
    return GetBuilder<SpecificCommunityController>(builder: (controller) {
      return WillPopScope(
          onWillPop: () async {
            Get.offAllNamed(AppRoute.home);
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
                    const SizedBox(height: 20,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context,index)=>GestureDetector(
                          onTap: (){
                            Get.dialog(CommDetailsDialog());
                          },
                          child: Card(
                            elevation: 1,
                            color:AppColor.lightYellow,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30.0,
                                backgroundImage: AssetImage(AppImageAsset.profile),
                                backgroundColor: Colors.transparent,
                        
                              ),
                            title: Text("An-Najah National"),
                            subtitle: Text("read daily a page of quran ....."),
                            ),
                          ),
                        )
                      )
                      )
                  ],
                )
              )));
    });
  }
}
