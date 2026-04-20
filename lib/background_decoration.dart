
import 'package:flutter/material.dart';

import 'constants.dart';

class BackgroundDecoration extends StatelessWidget {
  final Widget child;
  const BackgroundDecoration({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,

      child: Stack(
        children: [
          Positioned(
            right: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width * 2 / 3,
              height: MediaQuery.of(context).size.width * 2 / 3,

              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 4,
                    color: Colors.black,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(360),
                ),
                gradient: kLightGradient,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 4 / 5,
            height: MediaQuery.of(context).size.width * 4 / 5,

            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 8,
                  color: Colors.black,
                ),
              ],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(360),
              ),
              gradient: kDarkGradient,
            ),
          ),
          Positioned(
            left: 75,
            bottom: 100,
            child: Container(
              width: 75,
              height: 75,

              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 4,
                    color: Colors.black,
                    offset: Offset(-2, 2),
                  ),
                  // BoxShadow(
                  //     spreadRadius: 1,
                  //     blurRadius: 4,
                  //     color: Colors.red,
                  //     offset: Offset(2, 2)
                  // ),
                ],
                borderRadius: BorderRadius.circular(360),
                gradient: kLightGradient,
              ),
            ),
          ),
          Positioned(
            right: 50,
            bottom: 200,
            child: Container(
              width: 50,
              height: 50,

              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 8,
                    color: Colors.black,
                  ),
                ],
                shape: BoxShape.circle,
                gradient: kDarkGradient,
              ),
            ),
          ),

          child

        ],
      ),
    );
  }
}
