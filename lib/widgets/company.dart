import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/constant.dart/images.dart';
import 'package:project_1/screens/jobswiper/BottomScreens/company_disription.dart';
import 'package:project_1/widgets/my_text.dart';

class Company extends StatelessWidget {
  const Company({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: GestureDetector(
            onTap: () {
              Get.to(() => CompanyDisription());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 121,
                  child: Image.asset(facebook2),
                ),
              ],
            ),
          ),
        ),
        MyText(
          text: 'Facebook',
          size: 20,
          weight: FontWeight.w600,
          color: GlobalColors.black,
        ),
        const SizedBox(height: 10),
        MyText(
          text: 'California, USA',
          size: 12,
          weight: FontWeight.w600,
          color: GlobalColors.grey2,
        ),
      ],
    );
  }
}
