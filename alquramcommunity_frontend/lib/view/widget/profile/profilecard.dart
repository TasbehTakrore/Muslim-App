import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/view/widget/profile/prfilefriends.dart';
import 'package:flutter/Material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColor.grey
          // gradient: const LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [Color(0xff2C8066), Color(0xff5FCFAE)],
          // )
          ),
      height: 500,
      width: double.infinity,
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(top: 30),
      child: ProfileFriends(),
    );
  }
}
