import 'package:ebla/background_decoration.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  backgroundImage: AssetImage("assets/images/logo.jpg"),
                ),
                SizedBox(width: 24.0),
                Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 28.0,
                    fontFamily: "times",
                  ),
                ),



              ],
            ),


            CustomButton(title: 'Sign In',

            ),

          ],
        ),
      )),
    );
  }
}
