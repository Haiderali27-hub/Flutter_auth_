import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/widgets/BackAppBar.dart';

import 'package:project_1/widgets/companyicon.dart';
import 'package:project_1/widgets/my_text.dart';

class CompanyDisription extends StatelessWidget {
  CompanyDisription({super.key});

  final List<Map<String, String>> jobs = [
    {
      'title': 'Web Developer',
      'subtitle': 'California, USA',
    },
    {
      'title': 'UI/UX Designer',
      'subtitle': 'California, USA',
    },
    {
      'title': 'iOS Developer',
      'subtitle': 'California, USA',
    },
    // Add more jobs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Backappbar(title: 'Company Details'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CompanyIcon(),
                  SizedBox(height: 10),
                  MyText(
                    text: 'Description',
                    size: 27,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Can you bring creative human-centered ideas to life and',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  Center(
                    child: Text(
                      'make great things happen beyond what meets the eye?',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  Center(
                    child: Text(
                      'We believe in teamwork, fun, complex projects, diverse',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  Center(
                    child: Text(
                      'perspectives, and simple solutions. How about you? ',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  Center(
                    child: Text(
                      'We’re looking for a like-minded',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center the icons
                    children: const [
                      Icon(
                        FontAwesomeIcons.facebookF,
                        size: 15,
                        color: Color.fromARGB(255, 87, 85, 85),
                      ),
                      SizedBox(width: 20), // Add spacing between icons
                      Icon(
                        FontAwesomeIcons.instagram,
                        size: 15, // Set the size of the icon
                        color: Color.fromARGB(
                            255, 87, 85, 85), // Set the color of the icon
                      ),
                      SizedBox(width: 20), // Add spacing between icons
                      Icon(
                        FontAwesomeIcons.twitter,
                        size: 15, // Set the size of the icon
                        color: Color.fromARGB(
                            255, 87, 85, 85), // Set the color of the icon
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 200),
                    child: MyText(
                      text: 'Active Jobs',
                      size: 16,
                      color: GlobalColors.black4,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView.builder(
                        itemCount: jobs.length,
                        itemBuilder: (context, index) {
                          final job = jobs[index];
                          return ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            title: Text(
                              job['title'] ?? 'Job Title',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: GlobalColors.black,
                              ),
                            ),
                            subtitle: Text(
                              job['subtitle'] ?? 'Job Subtitle',
                              style: TextStyle(
                                fontSize: 14,
                                color: GlobalColors.grey2,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 7,
                                  width: 7,
                                  decoration: BoxDecoration(
                                      color: GlobalColors.green,
                                      borderRadius: BorderRadius.circular(100),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 3,
                                            spreadRadius: 2,
                                            color: Colors.lightGreen)
                                      ]),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Active',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: GlobalColors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
