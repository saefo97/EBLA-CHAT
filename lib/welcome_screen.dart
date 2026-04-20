import 'package:flutter/material.dart';
import 'constants.dart';
import 'custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Stack(
          children: [
            Positioned(
              right: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width * 2 / 3,
                height: MediaQuery.of(context).size.width * 2 / 3,

                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 4,
                      color: Colors.black,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(360),
                  ),
                  gradient: kLightGradient,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 4 / 5,
              height: MediaQuery.of(context).size.width * 4 / 5,

              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 8,
                    color: Colors.black,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(360),
                ),
                gradient: kDarkGradient,
              ),
            ),
            Positioned(
              left: 75,
              bottom: 100,
              child: Container(
                width: 75,
                height: 75,

                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 4,
                      color: Colors.black,
                      offset: Offset(-2, 2),
                    ),
                    // BoxShadow(
                    //     spreadRadius: 1,
                    //     blurRadius: 4,
                    //     color: Colors.red,
                    //     offset: Offset(2, 2)
                    // ),
                  ],
                  borderRadius: BorderRadius.circular(360),
                  gradient: kLightGradient,
                ),
              ),
            ),
            Positioned(
              right: 50,
              bottom: 200,
              child: Container(
                width: 50,
                height: 50,

                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 8,
                      color: Colors.black,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(360),
                  gradient: kDarkGradient,
                ),
              ),
            ),
            Column(
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
          ],
        ),
      ),
    );
  }
}
