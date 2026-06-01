import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebla/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth_services.dart';
import '../components/loading_screen.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  AuthService _authService = AuthService();
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDark1,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
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

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("messages").snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting || snapshot.data == null
          ){
            return LoadingScreen();
          }
          else if(snapshot.data!.size == 0){
            return Center(child: Text("No Messages yet!"));
          }

        return ListView.builder(
          reverse: true,
          itemCount: snapshot.data!.size,
          padding: EdgeInsets.only(bottom: 72, top: 8, left: 8, right: 8),
          itemBuilder: (context, index) {
            return Align(
              alignment:  snapshot.data!.docs[index]['sender'] == FirebaseAuth.instance.currentUser!.email
                  ? AlignmentGeometry.centerRight
                  : AlignmentGeometry.centerLeft,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 0.8 * MediaQuery.of(context).size.width,
                ),
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: snapshot.data!.docs[index]['sender'] == FirebaseAuth.instance.currentUser!.email
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
                  gradient: snapshot.data!.docs[index]['sender'] == FirebaseAuth.instance.currentUser!.email ? kLightGradient : kDarkGradient,
                ),

                child: Text(
                  snapshot.data!.docs[index]['message'],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        );
      },),
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
            IconButton(onPressed: ()  {
              FirebaseFirestore.instance.collection("messages").add(
                {
                  "message" : messageController.text.trim(),
                  "time" : DateTime.now(),
                  "sender" : FirebaseAuth.instance.currentUser!.email
                }
              );

              messageController.clear();
            }, icon: Icon(Icons.send)),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Sign Out"),
              leading: Icon(Icons.exit_to_app),
              onTap: (){
                _authService.signOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
