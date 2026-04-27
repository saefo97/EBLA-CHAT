import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../components/background_decoration.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
                      color: Colors.blue
                  ),
                  child: AnimatedTextKit(
                    repeatForever: false,
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText('Forget Password',
                          speed: Duration(
                            milliseconds: 100,
                          )

                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            CustomTextFormField(title: "Email",),
            SizedBox(height: 8),
            // TODO: زر لنسيان كلمة المرور
          ],
        ),
      ),
    );
  }
}
