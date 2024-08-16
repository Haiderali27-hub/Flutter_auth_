import 'package:flutter/material.dart';
import 'package:project_1/constant.dart/global_colors.dart';

import 'package:project_1/widgets/company.dart';

import 'package:project_1/widgets/jobslider_appbar.dart';
import 'package:project_1/widgets/my_text.dart';
import 'package:project_1/widgets/workstartwidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 128.0),
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: GlobalColors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Company(),
                      const SizedBox(height: 20),
                      MyText(
                        text: 'UI Designer',
                        size: 28,
                        weight: FontWeight.w600,
                      ),
                      const SizedBox(height: 10),
                      MyText(
                        text:
                            'Can you bring creative human-centered ideas to life and make great things happen beyond what meets the eye? '
                            'We believe in teamwork, fun, complex projects, diverse perspectives, and simple solutions. How about you? We\'re looking for a like-minded',
                        size: 11,
                        weight: FontWeight.w400,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 23),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.37, // 35% of screen width
                              height: 55, // Increased height
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.close, color: Colors.white),
                                label: MyText(
                                  text: 'Dislike',
                                  size: 20,
                                  weight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.37, // 35% of screen width
                              height: 55, // Increased height
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.favorite, color: Colors.white),
                                label: MyText(
                                  text: 'Like',
                                  size: 20,
                                  weight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 13.0),
                        child: Column(
                          children: [
                            WorkStartDateWidget(
                                title: 'start of work', text: '30 July, 2021'),
                            SizedBox(
                              height: 20,
                            ),
                            WorkStartDateWidget(
                                title: 'Job Location', text: 'California, USA'),
                            SizedBox(
                              height: 20,
                            ),
                            WorkStartDateWidget(
                                title: 'language preferred',
                                text: 'English (Fluent)'),
                            SizedBox(
                              height: 20,
                            ),
                            WorkStartDateWidget(
                                title: 'Degrees', text: 'UI/UX Bachelors'),
                            SizedBox(
                              height: 20,
                            ),
                            WorkStartDateWidget(
                                title: 'Job Nature', text: 'Contractual'),
                            SizedBox(
                              height: 20,
                            ),
                            WorkStartDateWidget(
                                title: 'roles and responsibilities',
                                text:
                                    'Can you bring creative human-centered ideas to life and make great things happen beyond what meets the eye?'
                                    'We believe in teamwork, fun, complex projects, diverse perspectives, and simple solutions. How about you? We\'re looking for a like-minded'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
