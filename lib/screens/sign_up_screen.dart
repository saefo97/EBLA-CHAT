import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/background_decoration.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Hero(
                  tag: "logo",
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    backgroundImage: AssetImage("assets/images/logo.jpg"),
                  ),
                ),

                SizedBox(width: 24.0),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 26.0,
                    fontFamily: 'times',
                    color: Colors.blue,
                  ),
                  child: AnimatedTextKit(
                    repeatForever: false,
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Sign Up',
                        speed: Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            CustomTextFormField(title: "Email", controller: emailController),
            SizedBox(height: 8),
            CustomTextFormField(
              title: "Password",
              controller: passwordController,
              isPassword: true,
            ),
            SizedBox(height: 8),
            CustomTextFormField(
              title: "Confirm Password",
              isPassword: true,
              controller: confirmPasswordController,
            ),
            SizedBox(height: 8),
            Hero(
              tag: "signUp",
              child: CustomButton(title: 'Sign Up', width: 200
              ,
                onPressed: (){
                FirebaseAuth.instance.
                createUserWithEmailAndPassword(email: emailController.text.trim(),
                    password: passwordController.text.trim());
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
