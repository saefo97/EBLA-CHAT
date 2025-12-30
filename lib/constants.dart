import 'package:flutter/material.dart';

Color kLight1 = Colors.blue.shade300;
Color kLight2 = Colors.blue.shade500;
Color kDark1 = Colors.blue.shade700;
Color kDark2 = Colors.blue.shade900;

LinearGradient kLightGradient = LinearGradient(
  colors: [kLight1, kLight2],
  begin: AlignmentGeometry.topCenter,
  end: AlignmentGeometry.bottomCenter,
);

LinearGradient kDarkGradient = LinearGradient(
  colors: [kDark1, kDark2],
  begin: AlignmentGeometry.topCenter,
  end: AlignmentGeometry.bottomCenter,
);
