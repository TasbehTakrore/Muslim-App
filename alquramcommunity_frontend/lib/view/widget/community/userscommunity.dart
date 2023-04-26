import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/color.dart';
import 'usercommunitysettings.dart';

class UsersCommunity extends StatelessWidget {
  const UsersCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: AppColor.lightYellow,
      height: 120,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext b, i) {
            return Column(
              children: [
                InkWell(
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext b) {
                          return UserCommunitySettings();
                        });
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset("assets/images/user.png",
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
                Text(
                  "50%",
                  style: GoogleFonts.patrickHand(
                      //fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 67, 83, 77),
                      fontSize: 12),
                )
              ],
            );
          },
          separatorBuilder: (BuildContext b, i) {
            return SizedBox(width: 5);
          },
          itemCount: 14),
    );
  }
}
