import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/screens/auth/register/email.dart';
import 'package:project_1/widgets/BackAppBar.dart';
import 'package:project_1/widgets/CustomTextField.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';

class Name extends StatefulWidget {
  const Name({super.key});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Backappbar(),
          Padding(
            padding: EdgeInsets.only(top: 50, left: 32, right: 32),
            child: LinearProgressIndicator(
              value: 0.142, // Set progress value here (0.0 to 1.0)
              backgroundColor: Colors.grey[300],
              valueColor:
                  AlwaysStoppedAnimation<Color>(GlobalColors.primaryColor),
            ),
          ),
          SizedBox(
              height:
                  40), // Add some space between the progress bar and the rest of the content
          Padding(
            padding: EdgeInsets.only(left: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: 'What is your name?',
                  size: 25,
                  weight: FontWeight.w500,
                ),
                SizedBox(height: 45), // Add some space between the texts
                MyText(
                  text: 'First name*',
                  size: 13,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: CustomTextfield(text: ''),
                ),
                SizedBox(height: 22), // Add some space between the texts
                MyText(
                  text: 'Last name*',
                  size: 13,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: CustomTextfield(text: ''),
                ),
                SizedBox(height: 140), // Adjust the space before the buttons
                Center(
                  child: Column(
                    children: [
                      HorizontalButton(
                          onPressed: () {
                            Get.to(() => Email());
                          },
                          text: 'Next'),
                      SizedBox(height: 13),
                      HorizontalButton(
                        onPressed: () {},
                        text: 'Save and Exit',
                        textColor: GlobalColors.primaryColor,
                        backgroundColor: Colors.white,
                        bordercolor: GlobalColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
