import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/screens/jobswiper/BottomScreens/Profile/Notifications.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Future<String> _getUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      // Assuming the name is stored in a field called 'firstName' in the user's document
      String firstName = userDoc.get('firstName') ?? 'User';
      String lastName = userDoc.get('lastName') ?? '';

      return '$firstName $lastName';
    }
    return 'User';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getUserName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AppBar(
            backgroundColor: GlobalColors.primaryColor,
            title: Text('Loading...'),
          );
        } else if (snapshot.hasError) {
          return AppBar(
            backgroundColor: GlobalColors.primaryColor,
            title: Text('Error'),
          );
        } else {
          return AppBar(
            backgroundColor: GlobalColors.primaryColor,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  snapshot.data!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(FontAwesomeIcons.slidersH, color: Colors.white),
                onPressed: () {
                  // Handle settings icon press
                },
              ),
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {
                      Get.to(() => Notifications());
                    },
                  ),
                  Positioned(
                    right: 11,
                    top: 11,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 8,
                        minHeight: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
