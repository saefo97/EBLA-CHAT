




import 'package:flutter/material.dart';

import '../constants.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return    AnimatedContainer(
      duration: Duration(milliseconds: 250),
      width: isClicked ? 175 : 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: isClicked ? kDarkGreen : kDarkGradient,
      ),

      child: MaterialButton(
        onPressed: isClicked     ?   null  : () {
          isClicked = true;

          setState(() {});
          print(isClicked);
        },
        height: 48.0,
        color: Colors.transparent,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisAlignment: isClicked
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.center,
          children: [
            Text(
              isClicked ? "Sent!" : "Send",
              style: TextStyle(
                fontFamily: "times",
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),

            isClicked
                ? Icon(Icons.check, color: Colors.white, size: 25)
                : Container(),
          ],
        ),
      ),
    );
  }
}
