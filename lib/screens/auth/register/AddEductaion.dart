import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/screens/auth/register/CertificationandLicense.dart';
import 'package:project_1/widgets/BackAppBar.dart';
import 'package:project_1/widgets/dropdown.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';

class Addeductaion extends StatelessWidget {
  const Addeductaion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Backappbar(),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Padding(
                padding: const EdgeInsets.only(right: 60),
                child: LinearProgressIndicator(
                  value: 0.714, // Set progress value here (0.0 to 1.0)
                  backgroundColor: Colors.grey[300],
                  valueColor:
                      AlwaysStoppedAnimation<Color>(GlobalColors.primaryColor),
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(right: 120),
              child: MyText(
                text: 'Add Education?',
                size: 24,
                weight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 175),
              child: Text(
                'Basic Qualification',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10),
            Dropboxes(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 140),
              child: Text(
                'Additional Qualification',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10),
            Dropboxes(),
            SizedBox(height: 200), // Adjusted height to provide spacing
            HorizontalButton(
              onPressed: () {
                Get.to(() => Certificationandlicense());
              },
              text: 'Next',
            ),
            SizedBox(height: 10), // Adjusted height to provide spacing
            HorizontalButton(
              onPressed: () {},
              text: 'Save and Exit',
              textColor: GlobalColors.primaryColor,
              backgroundColor: Colors.white,
              bordercolor: GlobalColors.primaryColor,
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
