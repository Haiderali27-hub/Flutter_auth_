import 'package:flutter/material.dart';

import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/widgets/common_image)viewer.dart';

class Loginicon extends StatelessWidget {
  final String img;
  final void Function() onTap;
  const Loginicon({super.key, required this.img, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: GlobalColors.borderColor),
        ),
        child: CommonImageView(
          imagePath: img,
          height: 25,
          width: 25,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
