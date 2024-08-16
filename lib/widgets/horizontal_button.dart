import 'package:flutter/material.dart';
import 'package:project_1/widgets/my_text.dart';

class HorizontalButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final Color? bordercolor;
  final FontWeight textWeight;
  final Color textColor;
  final IconData? icon; // Add an optional icon parameter

  HorizontalButton({
    required this.onPressed,
    required this.text,
    this.width = 300,
    this.height = 57,
    this.borderRadius = 10,
    this.backgroundColor = const Color(0xff3F6CDF),
    this.textWeight = FontWeight.w700,
    this.textColor = Colors.white,
    this.bordercolor,
    this.icon, // Initialize the icon parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: bordercolor != null
                ? BorderSide(color: bordercolor!)
                : BorderSide.none,
          ),
          backgroundColor: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              text: text,
              weight: textWeight,
              color: textColor,
            ),
            if (icon != null) // Conditionally render the icon if it is provided
              SizedBox(width: 8), // Add some space between the text and icon
            if (icon != null) Icon(icon, color: textColor),
          ],
        ),
      ),
    );
  }
}
