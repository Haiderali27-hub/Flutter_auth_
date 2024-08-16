import 'package:flutter/material.dart';

class Otptextfields extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final FocusNode? prevFocusNode;

  const  Otptextfields({
    Key? key,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.prevFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 70,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        maxLength: 1, // Limit input to one character per field
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          counterText: '', // Remove the character count indicator
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        onChanged: (value) {
          // Handle changes and move focus to the next field if available
          if (value.length == 1 && nextFocusNode != null) {
            focusNode!.unfocus();
            FocusScope.of(context).requestFocus(nextFocusNode);
          } else if (value.isEmpty && prevFocusNode != null) {
            focusNode!.unfocus();
            FocusScope.of(context).requestFocus(prevFocusNode);
          }
        },
      ),
    );
  }
}
