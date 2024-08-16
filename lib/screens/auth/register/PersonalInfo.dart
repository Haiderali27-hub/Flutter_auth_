import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/constant.dart/images.dart';
import 'package:project_1/screens/auth/register/AddEductaion.dart';
import 'package:project_1/widgets/BackAppBar.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';
// Ensure this path is correct

class Personalinfo extends StatelessWidget {
  const Personalinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Backappbar(),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: LinearProgressIndicator(
                  value: 0.571428571, // Set progress value here (0.0 to 1.0)
                  backgroundColor: Colors.grey[300],
                  valueColor:
                      AlwaysStoppedAnimation<Color>(GlobalColors.primaryColor),
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: MyText(
                text: 'Some Personal Information',
                size: 20,
              ),
            ),
            SizedBox(height: 35),
            Center(
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: GlobalColors.lightGray3,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Image.asset(
                          camera,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Upload Profile Picture',
                          style: TextStyle(
                            color: GlobalColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: MyText(
                text: 'Your Birthday',
                size: 16,
                color: GlobalColors.black3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'We prioritize your privacy. We do not share your birthdate with any third       parties—only your age is used for a personalized experience',
                style: TextStyle(
                  fontSize: 9,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1),
              child: Container(
                height: 70,
                width: double.infinity, // Set the width to match parent width
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 219, 216, 216), // Border color
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: '',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: MyText(
                text: 'Write Your Short Introduction *',
                size: 16,
                color: GlobalColors.black3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                'This description is visible to your potential employers',
                style: TextStyle(
                  fontSize: 9,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                height: 170,
                width: 350, // Set the width to match parent width
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 219, 216, 216), // Border color
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: '',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Column(
                children: [
                  HorizontalButton(
                      onPressed: () {
                        Get.to(() => Addeductaion());
                      },
                      text: 'Next'),
                  SizedBox(
                    height: 10,
                  ),
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
    );
  }
}
