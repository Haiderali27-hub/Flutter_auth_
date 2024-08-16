import 'package:flutter/material.dart';
import 'package:project_1/constant.dart/images.dart';
import 'package:project_1/widgets/common_image)viewer.dart';
import 'package:project_1/widgets/my_text.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

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
              imagePath: onboarding3,
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
                    text: 'Choose your preferred language',
                    size: 32,
                    weight: FontWeight.w600,
                  ),
                  MyText(
                    text:
                        'Jobyy allows you to choose a language as per your preference.',
                    size: 16,
                    weight: FontWeight.w400,
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
