import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/screens/jobswiper/BottomNavigation.dart';
import 'package:project_1/widgets/BackAppBar.dart';

import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';
import 'package:project_1/widgets/tags.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String dropdownValue = 'English';
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 32.59),
        child: Column(
          children: [
            Backappbar(),
            Padding(
              padding: EdgeInsets.only(top: 50, left: 32, right: 0),
              child: LinearProgressIndicator(
                value: 1, // Set progress value here (0.0 to 1.0)
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
                    text: 'Your Language Skills?',
                    size: 25,
                    weight: FontWeight.w500,
                  ),
                  SizedBox(height: 15), // Add some space between the texts
                  MyText(
                    text: 'Add Languages',
                    size: 13,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    width: 295,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 163, 159, 159)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.grey),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                          'English',
                          'Spanish',
                          'German',
                          'French'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Tags(label: "Fluent"),
                      SizedBox(width: 10),
                      Tags(label: "Native"),
                      SizedBox(width: 10),
                      Tags(label: "Conversational"),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Tags(label: 'Native'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      GestureDetector(
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
                    ],
                  ),

                  SizedBox(height: 80), // Adjust the space before the buttons
                  Center(
                    child: Column(
                      children: [
                        HorizontalButton(
                            onPressed: () {
                              Get.to(() => Bottomnavigation());
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
      ),
    );
  }
}
