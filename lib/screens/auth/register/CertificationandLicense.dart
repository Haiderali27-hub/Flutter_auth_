import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart'; // Import the dotted_border package
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/screens/auth/register/language.dart';
import 'package:project_1/widgets/BackAppBar.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart'; // Ensure this path is correct

class Certificationandlicense extends StatelessWidget {
  const Certificationandlicense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Backappbar(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: LinearProgressIndicator(
                    value: 0.857142857, // Set progress value here (0.0 to 1.0)
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                        GlobalColors.primaryColor),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                MyText(
                  text: 'What certifications or licenses do you have?',
                  size: 23,
                ),
                SizedBox(height: 25),
                Text('Upload Proof for Qualifications'),
                SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 1,
                        borderType: BorderType.Rect,
                        radius: Radius.circular(8),
                        child: Container(
                          height: 150,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.upload_file,
                                    size: 50, color: Colors.grey),
                                SizedBox(height: 10),
                                Text('Upload Documents'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 1,
                        borderType: BorderType.Rect,
                        radius: Radius.circular(8),
                        child: Container(
                          height: 150,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.upload_file,
                                    size: 50, color: Colors.grey),
                                SizedBox(height: 10),
                                Text('Upload Documents'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: GestureDetector(
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: GlobalColors
                            .primaryColor, // Replace with your actual color
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          'Add More +',
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 16, // Text size
                            fontWeight: FontWeight.w300, // Text weight
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 110,
                ),
                Center(
                  child: Column(
                    children: [
                      HorizontalButton(
                          onPressed: () {
                            Get.to(() => Language());
                          },
                          text: 'Next'),
                      SizedBox(
                        height: 15,
                      ),
                      HorizontalButton(
                        onPressed: () {},
                        text: 'Save and Exit',
                        textColor: GlobalColors.primaryColor,
                        backgroundColor: Colors.white,
                        bordercolor: GlobalColors.primaryColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
