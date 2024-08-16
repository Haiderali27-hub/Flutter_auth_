import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/screens/auth/register/address.dart';
import 'package:project_1/widgets/BackAppBar.dart';
import 'package:project_1/widgets/CustomTextField.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';

class Email extends StatefulWidget {
  const Email({super.key});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Backappbar(),
          Padding(
            padding: EdgeInsets.only(top: 50, left: 32, right: 32),
            child: LinearProgressIndicator(
              value: 0.285714286, // Set progress value here (0.0 to 1.0)
              backgroundColor: Colors.grey[300],
              valueColor:
                  AlwaysStoppedAnimation<Color>(GlobalColors.primaryColor),
            ),
          ),
          SizedBox(
              height:
                  25), // Add some space between the progress bar and the rest of the content
          Padding(
            padding: EdgeInsets.only(left: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: 'Add a phone number & Email to your resume!',
                  size: 25,
                  weight: FontWeight.w500,
                ),
                SizedBox(height: 15), // Add some space between the texts
                MyText(
                  text: 'Phone number',
                  size: 13,
                  weight: FontWeight.w500,
                ),
                MyText(
                  text: 'Only for employers you apply to or respond to',
                  size: 10,
                  weight: FontWeight.w400,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, top: 13),
                  child: CustomTextfield(text: ''),
                ),
                SizedBox(height: 22), // Add some space between the texts
                MyText(
                  text: 'Email',
                  size: 13,
                  weight: FontWeight.w500,
                ),
                MyText(
                  text: 'Only for employers you apply to or respond to',
                  size: 10,
                  weight: FontWeight.w400,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, top: 13),
                  child: CustomTextfield(text: ''),
                ),
                SizedBox(height: 140), // Adjust the space before the buttons
                Center(
                  child: Column(
                    children: [
                      HorizontalButton(
                          onPressed: () {
                            Get.to(() => Address());
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
