import 'package:ebla/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  const CustomButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: title == "Sign In" ? kLightGradient : kDarkGradient,
      ),

      child: MaterialButton(
        onPressed: () {},
        height: 48.0,
        color: Colors.transparent,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: "times",
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
