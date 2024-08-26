import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String textHint;
  final bool obscureText;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.textHint,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: textHint,
      ),
    );
  }
}
