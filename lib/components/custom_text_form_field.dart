import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  bool isPassword;
  CustomTextFormField({
    super.key,
    required this.title,
    this.isPassword = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kDark1,
      obscureText: widget.isPassword ? isHidden : false,
      decoration: InputDecoration(
        // icon: Icon(Icons.email),
        // prefixIcon: Icon(Icons.email),
        suffixIcon: widget.isPassword
            ? IconButton(
                color: kDark1,
                onPressed: () {
                  isHidden = !isHidden;
                  setState(() {});
                },

                icon: isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : Container(height: 0, width: 0),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: kLight2, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: kDark1, width: 3),
        ),
        label: Text(widget.title, style: TextStyle(color: kDark1)),
      ),
    );
  }
}
