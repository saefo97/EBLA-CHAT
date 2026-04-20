import 'package:flutter/material.dart';
import 'background_decoration.dart';
import 'constants.dart';
import 'custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage("assets/images/logo.jpg"),
            ),
            SizedBox(height: 24.0),
            Text(
              "Welcome to  EPU  Group Chat!",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 28.0,
                fontFamily: "times",
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(title: 'Sign In'),
                CustomButton(title: 'Sign Up'),
              ],
            ),

            // Image.asset("assets/images/logo.jpg",
            // width: 200,
            // ),
          ],
        ),
      ),
    );
  }
}
