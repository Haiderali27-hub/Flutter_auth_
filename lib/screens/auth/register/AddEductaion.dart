import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/screens/jobswiper/BottomNavigation.dart';
import 'package:project_1/services/auth_service.dart';
import 'package:project_1/widgets/BackAppBar.dart';
import 'package:project_1/widgets/dropdown.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';

class Addeductaion extends StatefulWidget {
  const Addeductaion({super.key});

  @override
  State<Addeductaion> createState() => _AddeductaionState();
}

class _AddeductaionState extends State<Addeductaion> {
  String basicQualification = "";
  String additionalQualification = "";

  @override
  void initState() {
    super.initState();
    fetchEducation();
  }

  void fetchEducation() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    var data = await FirestoreService().fetchEducationDetails(userId);
    if (data != null && data['education'] != null) {
      setState(() {
        basicQualification = data['education']['basic'] ?? "";
        additionalQualification = data['education']['additional'] ?? "";
      });
    }
  }

  void saveEducationAndNavigate() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    Map<String, dynamic> data = {
      'basic': basicQualification,
      'additional': additionalQualification
    };
    await FirestoreService().addEducationDetails(userId, data);
    Get.to(() => Bottomnavigation()); // Navigate to BottomNavigation screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Backappbar(),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Padding(
                padding: const EdgeInsets.only(right: 60),
                child: LinearProgressIndicator(
                  value: 0.714, // Set progress value here (0.0 to 1.0)
                  backgroundColor: Colors.grey[300],
                  valueColor:
                      AlwaysStoppedAnimation<Color>(GlobalColors.primaryColor),
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(right: 120),
              child: MyText(
                text: 'Add Education?',
                size: 24,
                weight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 175),
              child: Text(
                'Basic Qualification',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10),
            Dropboxes(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 140),
              child: Text(
                'Additional Qualification',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10),
            Dropboxes(),
            SizedBox(height: 200), // Adjusted height to provide spacing
            HorizontalButton(
              onPressed: saveEducationAndNavigate,
              text: 'Next',
            ),
            HorizontalButton(
              onPressed: saveEducationAndNavigate,
              text: 'Save and Exit',
              textColor: GlobalColors.primaryColor,
              backgroundColor: Colors.white,
              bordercolor: GlobalColors.primaryColor,
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
