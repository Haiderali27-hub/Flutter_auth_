import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/constant.dart/images.dart';
import 'package:project_1/screens/jobswiper/BottomScreens/Profile/Notifications.dart';
import 'package:project_1/screens/jobswiper/BottomScreens/Profile/PrivacyandDataProtection.dart';
import 'package:project_1/screens/jobswiper/BottomScreens/Profile/payment.dart';
import 'package:project_1/screens/jobswiper/BottomScreens/Profile/personal_details.dart';
import 'package:project_1/screens/jobswiper/BottomScreens/Profile/referral_program.dart';
import 'package:project_1/screens/jobswiper/BottomScreens/Profile/settings.dart';
import 'package:project_1/widgets/common_image)viewer.dart';
import 'package:project_1/widgets/my_text.dart';
import 'package:project_1/widgets/profile_opt.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  Future<String> _getUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      String firstName = userDoc.get('firstName') ?? 'User';
      String lastName = userDoc.get('lastName') ?? '';
      return '$firstName $lastName';
    }
    return 'User';
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            backgroundColor: GlobalColors.primaryColor,
            title: MyText(
              text: 'My Profile',
              size: 18,
              weight: FontWeight.w500,
              color: GlobalColors.white,
            ),
            actions: [
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonImageView(
                  imagePath: profilepic,
                  width: 118,
                  height: 118,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder<String>(
                      future: _getUserName(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return MyText(
                            text: 'Loading...',
                            size: 20,
                            weight: FontWeight.w600,
                          );
                        } else if (snapshot.hasError) {
                          return MyText(
                            text: 'Error loading name',
                            size: 20,
                            weight: FontWeight.w600,
                          );
                        } else {
                          return MyText(
                            text: snapshot.data ?? 'User',
                            size: 20,
                            weight: FontWeight.w600,
                          );
                        }
                      },
                    ),
                    MyText(
                      text: "${user?.email ?? 'No email'}",
                      size: 11,
                      color: Colors.grey,
                      weight: FontWeight.w500,
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20),
            child: MyText(
              text: 'My Account',
              size: 20,
              weight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 18),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ProfileOpt(
                    text: 'Personal details',
                    onTap: () {
                      Get.to(() => PersonalDetails());
                    }),
                ProfileOpt(
                    text: 'Logout',
                    onTap: () {
                      Get.to(() => Logout());
                    }),
                ProfileOpt(
                    text: 'Payment Method ',
                    onTap: () {
                      Get.to(() => Payment());
                    }),
                ProfileOpt(text: 'Share feedback', onTap: () {}),
                ProfileOpt(
                    text: 'Privacy and Data Protection',
                    onTap: () {
                      Get.to(() => Privacyanddataprotection());
                    }),
                ProfileOpt(
                    text: 'Referral Program',
                    onTap: () {
                      Get.to(() => ReferralProgram());
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
