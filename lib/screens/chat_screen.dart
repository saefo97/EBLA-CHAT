import 'package:ebla/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  bool isMe = true;
  List<String> messages = [
    "Hello",
    "WhatsUp!",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "How are you",
    "XXXXXXXXXX",
    "ZZZZZZZZZZZ",
  ];
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDark1,
        title: Text(
          "EPU Chat",
          style: TextStyle(color: Colors.white, fontFamily: "times"),
        ),
        //  centerTitle: true,
        //   actions: [
        // IconButton(onPressed: (){}, icon: Icon(Icons.phone)),
        //     SizedBox(width: 8,),
        //     Icon(Icons.video_camera_back),
        //
        //   ],
        //  leading: Icon(Icons.add),
      ),

      body: ListView.builder(
        reverse: true,
        itemCount: messages.length,
        padding: EdgeInsets.only(bottom: 72, top: 8, left: 8, right: 8),
        itemBuilder: (context, index) {
          return Align(
            alignment: isMe
                ? AlignmentGeometry.centerRight
                : AlignmentGeometry.centerLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 0.8 * MediaQuery.of(context).size.width,
              ),
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: isMe
                    ? BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                        topLeft: Radius.circular(36),
                      )
                    : BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                        topRight: Radius.circular(36),
                      ),
                gradient: isMe ? kLightGradient : kDarkGradient,
              ),

              child: Text(
                messages[index],
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(child: TextField(
              decoration: InputDecoration(
                hintText: "Type a message...."
              ),
                controller: messageController,

                minLines: 1, maxLines: 5)),
            IconButton(onPressed: () {
              messageController.clear();
            }, icon: Icon(Icons.send)),
          ],
        ),
      ),
    );
  }
}
