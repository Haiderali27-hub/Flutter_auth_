import 'package:flutter/material.dart';

import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/constant.dart/images.dart';
import 'package:project_1/widgets/BackAppBar.dart';
import 'package:project_1/widgets/CustomProfile%20widget.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Backappbar(title: ''),
              SizedBox(height: 20),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 192, 191, 191),
                ),
                child: ClipOval(
                  child: Image.asset(
                    MyImage,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: 'Syed Umar Ahmad',
                    size: 25,
                    weight: FontWeight.bold,
                  ),
                  GestureDetector(child: Icon(Icons.edit)),
                ],
              ),
              SizedBox(height: 10),
              Text(
                '+92 309 8752218',
                style: TextStyle(color: GlobalColors.grey),
              ),
              SizedBox(height: 5),
              Text(
                'sumerahmed0077@gmail.com',
                style: TextStyle(color: GlobalColors.grey),
              ),
              SizedBox(height: 5),
              Text(
                'Rawalpindi 45600',
                style: TextStyle(color: GlobalColors.grey),
              ),
              SizedBox(
                height: 50,
              ),
              MyText(
                text: 'Introduction',
                size: 25,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 15,
              ),
              CustomProfile(
                  title: 'Intro',
                  text:
                      'Hi, my name is Umar. I am a beginner app developer currently working on a variety of app-related projects. My goal is to become a full-stack developer.Im passionate about learning new technologies and improving my coding skills.'),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: 'Work Experience',
                    size: 25,
                    weight: FontWeight.bold,
                  ),
                  Icon(Icons.add)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CustomProfile(
                title: 'Flutter Apps',
                text:
                    'Mative  Bahria Town, Islamabad\n June 2024 to Present\n\n Worked on a big Project from a Swiss Client, did the complete front end of the app All by my self. ',
              ),
              SizedBox(
                height: 10,
              ),
              CustomProfile(
                  title: 'Reactnative Apps',
                  text:
                      'Mative Bahria Town, Islamabad\n July 2023 to December 2023\n\nWorked on a online shopping center app with all the front end designed by my self and was the first time i was woring in app develpment.'),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: 'Education',
                    size: 25,
                    weight: FontWeight.bold,
                  ),
                  GestureDetector(child: Icon(Icons.add))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CustomProfile(
                  title: 'Bachelors in Computer Science ',
                  text:
                      'Comsats University Islamabad - Attock Campus\nSeptember 2022 to Present'),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: 'Skills',
                    size: 25,
                    weight: FontWeight.bold,
                  ),
                  GestureDetector(child: Icon(Icons.add))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CustomProfile(
                title: 'Flutter',
                text: '2 - Months',
              ),
              SizedBox(
                height: 10,
              ),
              CustomProfile(
                text: '1 - year',
                title: 'React Native',
              ),
              SizedBox(
                height: 10,
              ),
              CustomProfile(
                text: '1.5 - year',
                title: 'Figma',
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: 'Language Skills',
                    size: 25,
                    weight: FontWeight.bold,
                  ),
                  GestureDetector(child: Icon(Icons.add)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CustomProfile(
                title: 'English',
                text: '(Fluent)',
              ),
              SizedBox(
                height: 10,
              ),
              CustomProfile(
                text: '(Native))',
                title: 'Urdu',
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: HorizontalButton(onPressed: () {}, text: 'Save'),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
