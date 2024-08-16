import 'package:flutter/material.dart';

import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/constant.dart/images.dart';
import 'package:project_1/widgets/Custombuttons.dart';
import 'package:project_1/widgets/bottomsheet.dart';
import 'package:project_1/widgets/jobslider_appbar.dart';
import 'package:project_1/widgets/my_text.dart';

class Joblist extends StatefulWidget {
  Joblist({super.key});

  @override
  State<Joblist> createState() => _JoblistState();
}

class _JoblistState extends State<Joblist> {
  void bottomslider() {
    showModalBottomSheet(context: context, builder: (ctx) => Bottomsheet());
  }

  int _selectedIndex = 0;
  final List<Map<String, String>> jobItems = [
    {
      'image': G,
      'text': 'Archetecture Design',
      'subtitle': 'Seoul, South Korea',
      'smallText': 'GUIDE',
    },
    {
      'image': facebook2,
      'text': 'Web Designing',
      'subtitle': 'London, UK',
      'smallText': 'FaceBook',
    },
    {
      'image': MSoutlook,
      'text': 'Data Analysing',
      'subtitle': 'Birmingham, UK',
      'smallText': 'Microsoft Outlook',
    },
    {
      'image': apple,
      'text': 'Mobile UI design',
      'subtitle': 'NewYork, USA',
      'smallText': 'Apple Company',
    },
    {
      'image': linkdin,
      'text': 'Clients and Jobs',
      'subtitle': 'California, USA',
      'smallText': 'Linkdln',
    },
  ];

  final List<Map<String, String>> jobDisliked = [
    {
      'image': MSoutlook,
      'text': 'Data Analysing',
      'subtitle': 'Birmingham, UK',
      'smallText': 'Microsoft Outlook',
    },
    {
      'image': facebook2,
      'text': 'Web Designing',
      'subtitle': 'London, UK',
      'smallText': 'FaceBook',
    },
    {
      'image': G,
      'text': 'Archetecture Design',
      'subtitle': 'Seoul, South Korea',
      'smallText': 'GUIDE',
    },
    {
      'image': apple,
      'text': 'Mobile UI design',
      'subtitle': 'NewYork, USA',
      'smallText': 'Apple Company',
    },
    {
      'image': linkdin,
      'text': 'Clients and Jobs',
      'subtitle': 'California, USA',
      'smallText': 'Linkdln',
    },
    {
      'image': onboarding5,
      'text': 'Web Development',
      'subtitle': 'Bahria Town, Pakistan',
      'smallText': 'Roshaan',
    },
    {
      'image': google,
      'text': 'Adobe Premier',
      'subtitle': 'Mumbai, India',
      'smallText': 'Camera vovo',
    },
  ];

  final List<Map<String, String>> jobALL = [
    {
      'image': MSoutlook,
      'text': 'Data Analysing',
      'subtitle': 'Birmingham, UK',
      'smallText': 'Microsoft Outlook',
    },
    {
      'image': facebook2,
      'text': 'Web Designing',
      'subtitle': 'London, UK',
      'smallText': 'FaceBook',
    },
    {
      'image': G,
      'text': 'Archetecture Design',
      'subtitle': 'Seoul, South Korea',
      'smallText': 'GUIDE',
    },
    {
      'image': apple,
      'text': 'Mobile UI design',
      'subtitle': 'NewYork, USA',
      'smallText': 'Apple Company',
    },
    {
      'image': linkdin,
      'text': 'Clients and Jobs',
      'subtitle': 'California, USA',
      'smallText': 'Linkdln',
    },
    {
      'image': onboarding5,
      'text': 'Web Development',
      'subtitle': 'Bahria Town, Pakistan',
      'smallText': 'Roshaan',
    },
  ];

  final List<Map<String, String>> jobLiked = [
    {
      'image': G,
      'text': 'Archetecture Design',
      'subtitle': 'Seoul, South Korea',
      'smallText': 'GUIDE',
    },
    {
      'image': facebook2,
      'text': 'Web Designing',
      'subtitle': 'London, UK',
      'smallText': 'FaceBook',
    },
    {
      'image': MSoutlook,
      'text': 'Data Analysing',
      'subtitle': 'Birmingham, UK',
      'smallText': 'Microsoft Outlook',
    },
    {
      'image': apple,
      'text': 'Mobile UI design',
      'subtitle': 'NewYork, USA',
      'smallText': 'Apple Company',
    },
    {
      'image': linkdin,
      'text': 'Clients and Jobs',
      'subtitle': 'California, USA',
      'smallText': 'Linkdln',
    },
    {
      'image': onboarding5,
      'text': 'Web Development',
      'subtitle': 'Bahria Town, Pakistan',
      'smallText': 'Roshaan',
    },
  ];

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(),
          Custombuttons(
            onButtonPressed: _onButtonPressed,
            selectedIndex: _selectedIndex,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyText(
                      text: 'Filtered Results',
                      size: 25,
                      weight: FontWeight.w600,
                    ),
                    IconButton(
                      onPressed: () {
                        bottomslider();
                      },
                      icon: Icon(
                        Icons.tune,
                        color: GlobalColors.primaryColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      MyText(
                        text: 'California, USA',
                        size: 16,
                        weight: FontWeight.w400,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _selectedIndex == 0
                  ? jobItems.length
                  : _selectedIndex == 1
                      ? jobDisliked.length
                      : _selectedIndex == 2
                          ? jobLiked.length
                          : jobALL.length,
              itemBuilder: (context, index) {
                final job = _selectedIndex == 0
                    ? jobItems[index]
                    : _selectedIndex == 1
                        ? jobDisliked[index]
                        : _selectedIndex == 2
                            ? jobLiked[index]
                            : jobALL[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              job['image']!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 10),
                            Text(
                              job['smallText']!,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            job['text']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            job['subtitle']!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 15,
                          width: 45,
                          color: GlobalColors.greenNeon,
                          child: Center(
                            child: Text(
                              'Full-Time',
                              style: TextStyle(fontSize: 9),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'English/Spanish . Fulltime . Remote',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
