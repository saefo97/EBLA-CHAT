import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ebla/components/loading_screen.dart';
import 'package:ebla/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth_services.dart';
import '../components/background_decoration.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  final AuthService _authService = AuthService();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool isLoading = false;

  signUp(BuildContext context) async {
   if(_globalKey.currentState!.validate()){
     setState(() {
       isLoading = true;
     });
     String? errorMessage = await _authService.signUp(
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
    return isLoading? LoadingScreen():
    Form(
      key: _globalKey,
      child: Scaffold(
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
              SizedBox(height: 8),
              CustomTextFormField(
                title: "Confirm Password",
                isPassword: true,
                controller: confirmPasswordController,
                validator: (value) {
                  if(value == "" || value == null || value.isEmpty){
                    return "الرجاء إدخال تأكيد كلمة مرور";
                  }else if(passwordController. text != confirmPasswordController.text){
                    return "كلمة المرور غير مطابقة لتأكيد كلمة المرور";
                  }
                  return null;
                },

              ),
              SizedBox(height: 8),
              Hero(
                tag: "signUp",
                child: CustomButton(
                  title: 'Sign Up',
                  width: 200,
                  onPressed: () {
                    signUp(context);
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
