import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:project_1/constant.dart/images.dart';
import 'package:project_1/screens/auth/login/login.dart';
import 'package:project_1/screens/jobswiper/BottomNavigation.dart';
import 'package:project_1/widgets/common_image)viewer.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';

class IntroScreen4 extends StatelessWidget {
  const IntroScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image
            CommonImageView(
              imagePath: onboarding4,
              height: MediaQuery.sizeOf(context).height * 0.58,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover,
            ),
            //text
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 30.0),
              child: Column(
                children: [
                  MyText(
                    text: 'Thousand of Jobs are Waiting for you',
                    size: 32,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      HorizontalButton(
                          onPressed: () {
                            Get.to(() => LogIn(
                                  showRegisterPage: () {},
                                ));
                          },
                          text: 'Get started!'),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.91),
                        child: HorizontalButton(
                          onPressed: () {
                            Get.to(() => Bottomnavigation());
                          },
                          text: 'Continue as a guest',
                          backgroundColor: Colors.black,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
