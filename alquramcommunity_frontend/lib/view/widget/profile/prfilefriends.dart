import 'package:flutter/Material.dart'; 
import 'package:google_fonts/google_fonts.dart'; 
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart'; 
 
class ProfileFriends extends StatelessWidget { 
  const ProfileFriends({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return Container( 
      height: 130,
      margin: const EdgeInsets.only(top:0,left:5,right:5,bottom:5),
      decoration: BoxDecoration(
               ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(width: 15),
            Text("Friends",style:TextStyle(
              fontSize:15,

            ),          
            ),
            ],
          ),
  
          Container(
            height: 100,
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
                          margin: const EdgeInsets.only(top:10),
                          width: 60, 
                          height: 60, 
                          clipBehavior: Clip.antiAlias, 
                          decoration: const BoxDecoration(shape: BoxShape.circle), 
                           child :Image.asset( AppImageAsset.profile,
                              fit: BoxFit.fitWidth),
                        ), 
                      ), 
                      Text( 
                        "Tasbeh Tak", 
                        style: GoogleFonts.patrickHand( 
                            //fontWeight: FontWeight.w500, 
                            color: AppColor.primaryColor, 
                            fontSize: 13), 
                      ), 
                  
                    ], 
                  ); 
                }, 
                separatorBuilder: (BuildContext b, i) { 
                  return SizedBox(width: 6); 
                }, 
                itemCount: 14),
          ),
        ],
      ), 
    ); 
  } 
}