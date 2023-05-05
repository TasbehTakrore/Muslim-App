import 'package:alquramcommunity_frontend/core/constant/color.dart'; 
import 'package:alquramcommunity_frontend/view/widget/profile/details.dart'; 
import 'package:alquramcommunity_frontend/view/widget/profile/prfilefriends.dart'; 
import 'package:flutter/Material.dart'; 
import 'package:get/get.dart'; 
import '../../../controller/profileController.dart'; 
 
class ProfileCard extends StatelessWidget { 
  const ProfileCard({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    final ProfileController profilesController = 
    Get.put(ProfileController()); 
    return Container( 
      decoration: BoxDecoration( 
          borderRadius: BorderRadius.circular(20), color: AppColor.grey, 
          // gradient: const LinearGradient( 
          //   begin: Alignment.topRight, 
          //   end: Alignment.bottomLeft, 
          //   colors: [Color(0xff2C8066), Color(0xff5FCFAE)], 
          // ) 
          ), 
      height: double.infinity, 
      width: double.infinity, 
      margin: EdgeInsets.only(top: 250,left:10,right:10), 
      child: Container( 
        child: SingleChildScrollView( 
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [ 
              SizedBox(height: 70,), 
              const Divider(  color: Color.fromARGB(136, 32, 93, 77),), 
              SizedBox(height: 5), 
              Details(), 
              const Divider(  color: Color.fromARGB(136, 32, 93, 77),), 
              SizedBox(height: 5), 
              Text("Friends:"), 
              ProfileFriends(), 
               
            ], 
          ), 
        ), 
      ) 
     // ProfileFriends(), 
    ); 
  } 
}