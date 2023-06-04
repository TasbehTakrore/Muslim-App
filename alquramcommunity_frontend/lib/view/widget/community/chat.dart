import 'package:alquramcommunity_frontend/controller/commnity_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/quranconst.dart';
import '../custombuttomlang.dart';

CommunitityController communitityController = Get.put(CommunitityController());

class ChatDialog extends StatelessWidget {
  final String communityChatID;
  final String communityName;
  ChatDialog(
      {super.key, required this.communityName, required this.communityChatID});
  @override
  Widget build(BuildContext context) {
    late TextEditingController messageController = TextEditingController();
    print("##communityChatID $communityChatID");
    return Container(
      color: AppColor.grey,
      // backgroundColor: Color.fromARGB(226, 255, 255, 255),
      // child: Scaffold(
      //   appBar: AppBar(
      //     backgroundColor: AppColor.primaryColor,
      //     title: Row(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         Text(communityName),
      //         // SizedBox(width: 10),
      //       ],
      //     ),
      //   ),
      height: 800,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MessageStreamBuilder(communityChatID: communityChatID),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColor.primaryColor,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: AppColor.secondaryColor,
                    textDirection: TextDirection.ltr,
                  ),
                  onPressed: () {
                    if (messageController.text != "") {
                      communitityController.sendMessage(
                          communityChatID: communityChatID,
                          message: messageController.text);
                    }
                    messageController.clear();
                    // communityChatID
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: messageController,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      hintText: 'اكتب رسالتك هنا...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({super.key, required this.communityChatID});
  final String communityChatID;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: communitityController.db
            .collection('groupsChat')
            .doc(communityChatID)
            .collection('messages')
            .orderBy('time')
            .snapshots(),
        builder: (context, snapshot) {
          List<MessageLine> messagesWidget = [];

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColor.secondaryColor,
              ),
            );
          } else {
            final messages = snapshot.data!.docs.reversed;
            for (var message in messages) {
              final messageText = message.get('senderMessage');
              final emailSender = message.get('senderEmail');
              final nameSender = message.get('senderName');

              messagesWidget.add(MessageLine(
                isMe: emailSender == communitityController.getUserEmail(),
                sender: nameSender,
                text: messageText,
              ));
              print(
                  "nameSender: $nameSender messageText: $messageText,emailSender:$emailSender ");
            }
          }
          return Container(
              color: AppColor.grey,
              height: MediaQuery.of(context).size.height / 2.68,
              child: ListView(
                  reverse: true,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  children: messagesWidget));
        });
  }
}

class MessageLine extends StatelessWidget {
  const MessageLine(
      {super.key,
      required this.sender,
      required this.text,
      required this.isMe});
  final bool isMe;
  final String sender;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(
            sender,
            style: TextStyle(color: Colors.grey[600]),
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            color: isMe ? AppColor.thickYellow : AppColor.secondaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text("$text",
                  style: TextStyle(color: isMe ? Colors.black : Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
