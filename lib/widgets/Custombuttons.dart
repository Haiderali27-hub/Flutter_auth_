import 'package:flutter/material.dart';

import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/widgets/my_text.dart';

class Custombuttons extends StatefulWidget {
  final Function(int) onButtonPressed;
  final int selectedIndex;

  const Custombuttons({
    Key? key,
    required this.onButtonPressed,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  _CustombuttonsState createState() => _CustombuttonsState();
}

class _CustombuttonsState extends State<Custombuttons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton(0, 'New'),
          _buildButton(1, 'Disliked'),
          _buildButton(2, 'Liked'),
          _buildButton(3, 'All'),
        ],
      ),
    );
  }

  Widget _buildButton(int index, String text) {
    return GestureDetector(
      onTap: () => widget.onButtonPressed(index),
      child: Container(
        height: 33,
        width: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: widget.selectedIndex == index
              ? GlobalColors.white
              : Colors.transparent,
          boxShadow: widget.selectedIndex == index
              ? [
                  BoxShadow(
                    color: Colors.lightBlueAccent.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: MyText(
            text: text,
            size: 14,
            color: widget.selectedIndex == index
                ? GlobalColors.primaryColor
                : GlobalColors.black4,
          ),
        ),
      ),
    );
  }
}
