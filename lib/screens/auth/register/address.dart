import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/screens/auth/register/PersonalInfo.dart';
import 'package:project_1/services/auth_service.dart';
import 'package:project_1/widgets/BackAppBar.dart';
import 'package:project_1/widgets/CustomTextField.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  TextEditingController streetController = TextEditingController();
  TextEditingController cityStateController = TextEditingController();
  String selectedCountry =
      'United States'; // Default value or manage dynamically

  // List of countries for the dropdown (you can populate this from a database or API)
  final List<String> countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'Germany',
    'France',
    'Spain',
    'Pakistan',
  ];

  @override
  void dispose() {
    streetController.dispose();
    cityStateController.dispose();
    super.dispose();
  }

  void saveAddressDetails() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ??
        ''; // Ensure the user is logged in
    Map<String, dynamic> addressData = {
      'country': selectedCountry,
      'street': streetController.text.trim(),
      'cityState': cityStateController.text.trim()
    };

    FirestoreService().addUserDetails(userId, addressData).then((_) {
      Get.to(() => Personalinfo()); // Navigate after saving data
    }).catchError((error) {
      Get.snackbar('Error', 'Failed to save address: $error',
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Backappbar(),
          Padding(
            padding: EdgeInsets.only(top: 50, left: 32, right: 32),
            child: LinearProgressIndicator(
              value: 0.428571429, // Set progress value here (0.0 to 1.0)
              backgroundColor: Colors.grey[300],
              valueColor:
                  AlwaysStoppedAnimation<Color>(GlobalColors.primaryColor),
            ),
          ),
          SizedBox(
              height:
                  40), // Add some space between the progress bar and the rest of the content
          Padding(
            padding: EdgeInsets.only(left: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: 'Where are you located?',
                  size: 25,
                  weight: FontWeight.w500,
                ),
                SizedBox(height: 15), // Add some space between the texts
                MyText(
                  text: 'Country *',
                  size: 13,
                ),
                Container(
                  width: 295,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 163, 159, 159)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4)),
                      value: selectedCountry,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCountry = newValue!;
                        });
                      },
                      items: countries
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 25), // Add some space between the texts
                MyText(
                  text: 'Street address *',
                  size: 13,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: CustomTextfield(
                    text: '',
                    controller: streetController,
                  ),
                ),
                SizedBox(height: 22), // Add some space between the texts
                MyText(
                  text: 'City, State *',
                  size: 13,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: CustomTextfield(
                    text: '',
                    controller: cityStateController,
                  ),
                ),
                SizedBox(height: 110), // Adjust the space before the buttons
                Center(
                  child: Column(
                    children: [
                      HorizontalButton(
                          onPressed: saveAddressDetails,
                          // Here you might save data to Firestore or pass to next screen
                          /* Get.to(() => Personalinfo()); */

                          text: 'Next'),
                      SizedBox(height: 13),
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
        ],
      ),
    );
  }
}
