import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {

  final String hint;

  final TextEditingController controller;

  final EdgeInsets contentPadding;

  final bool obscureText;

  MyFormField({this.hint, this.controller, this.contentPadding, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: hint,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            )
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2
          )
        ),
        contentPadding: contentPadding
      ),
      controller: controller,
      obscureText: obscureText,
    );
  }
}
