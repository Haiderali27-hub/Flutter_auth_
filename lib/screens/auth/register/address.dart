import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/screens/auth/register/PersonalInfo.dart';
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
  String dropdownValue = 'English';

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
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon:
                          const Icon(Icons.arrow_drop_down, color: Colors.grey),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['English', 'Spanish', 'German', 'French']
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
                  child: CustomTextfield(text: ''),
                ),
                SizedBox(height: 22), // Add some space between the texts
                MyText(
                  text: 'City, State *',
                  size: 13,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: CustomTextfield(text: ''),
                ),
                SizedBox(height: 110), // Adjust the space before the buttons
                Center(
                  child: Column(
                    children: [
                      HorizontalButton(
                          onPressed: () {
                            Get.to(() => Personalinfo());
                          },
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
