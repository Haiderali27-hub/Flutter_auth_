import 'package:flutter/material.dart';
import 'package:project_1/constant.dart/global_colors.dart';

class CustomProfile extends StatelessWidget {
  final String text;
  final String title;
  final double? size;
  final Color color;
  final FontWeight weight;
  final double? letterSpacing;
  final TextDecoration decoration;
  final int maxLines;
  final TextOverflow overflow;

  CustomProfile({
    Key? key,
    required this.text,
    this.title = '',
    this.size = 25,
    this.color = Colors.black,
    this.weight = FontWeight.w600,
    this.letterSpacing,
    this.decoration = TextDecoration.none,
    this.maxLines = 100,
    this.overflow = TextOverflow.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.9,
          ),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
            color: GlobalColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: size,
                          color: color,
                          fontWeight: weight,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Handle edit icon press
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  text,
                  maxLines: maxLines,
                  overflow: overflow,
                  style: TextStyle(
                    decoration: decoration,
                    letterSpacing: letterSpacing,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
