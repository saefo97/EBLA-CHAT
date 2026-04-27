

import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  const CustomTextFormField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kDark1,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: kLight2, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: kDark1, width: 3),
        ),
        label: Text(title, style: TextStyle(color: kDark1)),
      ),
    );
  }
}
