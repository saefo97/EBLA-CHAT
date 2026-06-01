import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ebla/components/loading_screen.dart';
import 'package:ebla/constants.dart';
import 'package:ebla/screens/forget_password_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth_services.dart';
import '../components/background_decoration.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';
import 'chat_screen.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool isLoading = false;

  signIn(BuildContext context) async {
    if(_globalKey.currentState!.validate()){
      setState(() {
        isLoading = true;
      });
      String? errorMessage = await _authService.signIn(
        emailController.text.trim(),

        passwordController.text.trim(),
      );
      setState(() {
        isLoading = false;
      });
      if (errorMessage == null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
              (route) => false,
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage))
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: isLoading ? LoadingScreen() : Scaffold(
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
                          'Sign In',
                          speed: Duration(milliseconds: 100),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              CustomTextFormField(

                title: "Email", controller: emailController,
                validator: (value) {
                  if(value == "" || value == null || value.isEmpty){
                    return "الرجاء إدخال بريد إلكتروني";
                  }
                  return null;
                },

              ),
              SizedBox(height: 8),
              CustomTextFormField(
                title: "Password",
                controller: passwordController,
                isPassword: true,
                validator: (value) {
                  if(value == "" || value == null || value.isEmpty){
                    return "الرجاء إدخال كلمة مرور";
                  }else if(value . length < 6){
                    return "كلمة المرور ضعيفة";
                  }
                  return null;
                },

              ),
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(color: kDark1),
                  ),
                ),
              ),
              Hero(
                tag: "signIn",
                child: CustomButton(title: 'Sign In', width: 200,
                  onPressed: (){
                    signIn(context);
                  },


                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
