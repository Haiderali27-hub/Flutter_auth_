import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String text;
  final double width;
  final double borderRadius;
  final Color borderColorfocus;
  final Color borderColorEnable;
  final bool obscuretext;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  // Make it nullable or ensure it's always provided

  CustomTextfield({
    super.key,
    required this.text,
    this.borderRadius = 8,
    this.borderColorfocus = Colors.black,
    this.borderColorEnable = const Color.fromARGB(255, 163, 159, 159),
    this.width = 1,
    this.obscuretext = false,
    this.controller,
    this.keyboardType = TextInputType.text,

  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscuretext,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColorfocus, width: width)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColorEnable, width: width)),
      ),
    );
  }
}
