import 'package:ebla/components/loading_screen.dart';
import 'package:ebla/screens/chat_screen.dart';
import 'package:ebla/screens/onboarding_screen.dart';
import 'package:ebla/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isOpened = false;

  checkIfOpened() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isOpened = prefs.getBool("isOpened") ?? false;
    });
    prefs.setBool("isOpened", true);
  }

  @override
  void initState() {
    print("Hello");
    checkIfOpened();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isOpened ? StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return WelcomeScreen();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          } else {
            return ChatScreen();
          }
          return WelcomeScreen();
        },
      )
      : OnboardingScreen()

      ,
    );
  }
}
