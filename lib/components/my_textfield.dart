import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
      super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Theme(
        data: Theme.of(context).copyWith(
          hintColor: Color.fromARGB(171, 199, 213, 224), // Color del obscureText
        ),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF1b2838)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF1b2838)),
            ),
            fillColor: Color(0xFF1b2838),
            filled: true,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
