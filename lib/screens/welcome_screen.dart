import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ebla/screens/sign_in_screen.dart';
import 'package:ebla/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '../components/background_decoration.dart';
import '../components/custom_button.dart';

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
            Hero(
              tag: "logo",
              child: CircleAvatar(
                radius: 75,
                backgroundColor: Colors.blue,
                backgroundImage: AssetImage("assets/images/logo.jpg"),
              ),
            ),
            SizedBox(height: 24.0),
           DefaultTextStyle(

                style: const TextStyle(
                  fontSize: 26.0,
                  fontFamily: 'times',
                  color: Colors.blue
                ),
                child: AnimatedTextKit(
                  repeatForever: false,
totalRepeatCount: 1,
                  animatedTexts: [
                    TypewriterAnimatedText('Welcome to  EPU  Group Chat!',
                      speed: Duration(
                        milliseconds: 50,
                      )

                    ),
                  ],
                ),
              ),
            // Text(
            //   "Welcome to  EPU  Group Chat!",
            //   style: TextStyle(
            //     color: Colors.blue,
            //     fontSize: 26.0,
            //     fontFamily: "times",
            //   ),
            // ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(
                  tag: "signIn",
                  child: CustomButton(title: 'Sign In',onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                  },),
                ),
                Hero(
                  tag: "signUp",
                  child: CustomButton(title: 'Sign Up',onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                  },
                  ),
                ),
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
