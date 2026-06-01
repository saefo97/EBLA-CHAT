
import 'package:ebla/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: kDarkGradient
        ),

        child: SpinKitSpinningLines(
            size: 150,

            color: Colors.white));
  }
}
