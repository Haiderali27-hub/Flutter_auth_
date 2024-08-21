import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/constant.dart/images.dart';
import 'package:project_1/screens/jobswiper/BottomScreens/Home.dart';
import 'package:project_1/screens/jobswiper/BottomScreens/JobList.dart';
import 'package:project_1/screens/jobswiper/BottomScreens/Profile/profile.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  int myindex = 0;

  final tabs = [
    const Home(),
    Joblist(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: myindex,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            myindex = value;
          });
        },
        currentIndex: myindex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              tags,
              width: 24,
              height: 24,
              color:
                  myindex == 0 ? GlobalColors.primaryColor : GlobalColors.grey2,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              joblist,
              width: 24,
              height: 24,
              color:
                  myindex == 1 ? GlobalColors.primaryColor : GlobalColors.grey2,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              profile,
              width: 24,
              height: 24,
              color:
                  myindex == 2 ? GlobalColors.primaryColor : GlobalColors.grey2,
            ),
            label: '',
          ),
        ],
        selectedItemColor: GlobalColors.primaryColor,
        unselectedItemColor: GlobalColors.grey2,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
