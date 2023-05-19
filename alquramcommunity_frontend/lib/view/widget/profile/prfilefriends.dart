import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
// <<<<<<< HEAD
// import 'friendtapdialog.dart'; 
 
// class ProfileFriends extends StatelessWidget { 
//   const ProfileFriends({super.key}); 
 
//   @override 
//   Widget build(BuildContext context) { 
//     return 
       
//           Container(
//             height: 100,
//           decoration: BoxDecoration(color: AppColor.grey), 
//             child: ListView.separated( 
//                 scrollDirection: Axis.horizontal, 
//                 itemBuilder: (BuildContext b, i) { 
//                   return Column( 
//                     children: [ 
//                       InkWell( 
//                         onTap: () { 
                          
//                           showDialog( 
//                               context: context, 
//                               builder: (BuildContext b) { 
//                                return FriendTapDialog();
//                               });
//                         }, 
//                         child: Container( 
//                           margin: const EdgeInsets.only(top:10),
//                           width: 50, 
//                           height: 50, 
//                           clipBehavior: Clip.antiAlias, 
//                           decoration: const BoxDecoration(shape: BoxShape.circle), 
//                            child :Image.asset( AppImageAsset.profile,
//                               fit: BoxFit.fitWidth),
//                         ), 
//                       ), 
//                       Text( 
//                         "###", 
//                         style: GoogleFonts.patrickHand( 
//                             //fontWeight: FontWeight.w500, 
//                             color: AppColor.primaryColor, 
//                             fontSize: 10), 
//                       ), 
                  
//                     ], 
//                   ); 
//                 }, 
//                 separatorBuilder: (BuildContext b, i) { 
//                   return SizedBox(width: 6); 
//                 }, 
//                 itemCount: 14),
//           );
        
      
    
//   } 
// }
// =======

class ProfileFriends extends StatelessWidget {
  const ProfileFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(color: AppColor.grey),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext b, i) {
            return Column(
              children: [
                InkWell(
                  onLongPress: () {
                    /*
                          showDialog( 
                              context: context, 
                              builder: (BuildContext b) { 
                              //  return UserCommunitySettings(); 
                              }); */
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 70,
                    height: 70,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColor.black,
                          width: 3,
                        )),
                    child:
                        Image.asset(AppImageAsset.profile, fit: BoxFit.cover),
                  ),
                ),
                Text(
                  "###",
                  style: GoogleFonts.patrickHand(
                      //fontWeight: FontWeight.w500,
                      color: AppColor.primaryColor,
                      fontSize: 10),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext b, i) {
            return SizedBox(width: 6);
          },
          itemCount: 14),
    );
  }
}
// >>>>>>> main
