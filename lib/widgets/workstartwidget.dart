import 'package:flutter/material.dart';

class WorkStartDateWidget extends StatelessWidget {
  final String title;
  final String text;

  const WorkStartDateWidget({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.blue[50], // Light blue background color
        borderRadius: BorderRadius.circular(30), // Rounded corners
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700], // Text color for title
            ),
          ),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black, // Text color for text
            ),
          ),
        ],
      ),
    );
  }
}
