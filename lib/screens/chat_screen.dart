import 'package:ebla/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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

      body: Column(),
      bottomSheet: Row(
        children: [
          Expanded(

              child: TextField()),
          IconButton(onPressed:(){}, icon: Icon(Icons.send))
        ],
      ),
    );
  }
}
