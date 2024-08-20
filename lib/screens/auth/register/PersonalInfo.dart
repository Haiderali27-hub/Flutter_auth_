import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/constant.dart/images.dart';
import 'package:project_1/screens/auth/register/AddEductaion.dart';
import 'package:project_1/services/auth_service.dart';
import 'package:project_1/widgets/BackAppBar.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';
// Ensure this path is correct

class Personalinfo extends StatefulWidget {
  const Personalinfo({super.key});

  @override
  State<Personalinfo> createState() => _PersonalinfoState();
}

class _PersonalinfoState extends State<Personalinfo> {
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController introductionController = TextEditingController();
  final FirestoreService firestoreService = FirestoreService();

  void saveData() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    Map<String, dynamic> data = {
      'birthday': birthdayController.text,
      'introduction': introductionController.text,
    };

    firestoreService.addPersonalInfo(userId, data).then((_) {
      Get.to(() => Addeducation()); // Navigate after saving
    }).catchError((error) {
      Get.snackbar('Error', 'Failed to save data: $error',
          snackPosition: SnackPosition.BOTTOM);
    });
  }

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
              child: TextFormField(
                controller: birthdayController,
                decoration: InputDecoration(
                  labelText: 'Enter your birthday',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
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
              child: TextFormField(
                controller: introductionController,
                maxLines: 5, // Allow multiple lines
                decoration: InputDecoration(
                  labelText: 'Write your short introduction',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                    onPressed:
                        saveData, // Use saveData when the Next button is pressed
                    text: 'Next',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  HorizontalButton(
                    onPressed:
                        saveData, // Optionally use saveData for the Save and Exit as well
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
