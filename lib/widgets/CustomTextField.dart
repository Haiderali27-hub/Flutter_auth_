import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
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
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscuretext && _obscureText,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.text,
        suffixIcon: widget.obscuretext
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
                color: widget.borderColorfocus, width: widget.width)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
                color: widget.borderColorEnable, width: widget.width)),
      ),
    );
  }
}
