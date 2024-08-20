import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/screens/jobswiper/BottomNavigation.dart';
import 'package:project_1/services/auth_service.dart';
import 'package:project_1/widgets/BackAppBar.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';

class Addeducation extends StatefulWidget {
  const Addeducation({super.key});

  @override
  State<Addeducation> createState() => _AddeductaionState();
}

class _AddeductaionState extends State<Addeducation> {
  String selectedBasicQualification = "High School";
  String selectedAdditionalQualification = "Certifications";
  List<String> basicQualifications = [
    "High School",
    "Associate Degree",
    "Bachelor's Degree",
    "Master's Degree"
  ];
  List<String> additionalQualifications = [
    "Certifications",
    "Online Courses",
    "Workshops",
    "Other"
  ];

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
        selectedBasicQualification =
            data['education']['basic'] ?? basicQualifications.first;
        selectedAdditionalQualification =
            data['education']['additional'] ?? additionalQualifications.first;
      });
    }
  }

  void saveEducationAndNavigate() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    Map<String, dynamic> data = {
      'basic': selectedBasicQualification,
      'additional': selectedAdditionalQualification
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
            SizedBox(height: 50),
            LinearProgressIndicator(
              value: 0.714, // Assume some progress value logic here
              backgroundColor: Colors.grey[300],
              valueColor:
                  AlwaysStoppedAnimation<Color>(GlobalColors.primaryColor),
            ),
            SizedBox(height: 50),
            MyText(text: 'Add Education?', size: 24, weight: FontWeight.w700),
            SizedBox(height: 20),
            // Basic Qualification Dropdown
            DropdownButtonFormField<String>(
              value: selectedBasicQualification,
              onChanged: (newValue) {
                setState(() {
                  selectedBasicQualification = newValue!;
                });
              },
              items: basicQualifications
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // Additional Qualification Dropdown
            DropdownButtonFormField<String>(
              value: selectedAdditionalQualification,
              onChanged: (newValue) {
                setState(() {
                  selectedAdditionalQualification = newValue!;
                });
              },
              items: additionalQualifications
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 200),
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
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
