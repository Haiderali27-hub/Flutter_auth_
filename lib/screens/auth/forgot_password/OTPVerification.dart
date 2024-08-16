import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_1/screens/auth/forgot_password/CreateNewpass.dart';

import 'package:project_1/widgets/BackAppBar.dart';
import 'package:project_1/widgets/OTPTextFields.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';

class Otpverification extends StatelessWidget {
  const Otpverification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller1 = TextEditingController();
    final TextEditingController controller2 = TextEditingController();
    final TextEditingController controller3 = TextEditingController();
    final TextEditingController controller4 = TextEditingController();

    final FocusNode focusNode1 = FocusNode();
    final FocusNode focusNode2 = FocusNode();
    final FocusNode focusNode3 = FocusNode();
    final FocusNode focusNode4 = FocusNode();

    return Scaffold(
      body: Column(
        children: [
          Backappbar(
            title: '',
          ), // Place the Backappbar at the top of the Column
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: MyText(
                    text: 'OTP Verification',
                    size: 27,
                    weight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 12.0),
                  child: Text(
                    'Enter the verification code we just sent on your email address.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 138, 134, 134),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Otptextfields(
                        controller: controller1,
                        focusNode: focusNode1,
                        nextFocusNode: focusNode2,
                      ),
                      Otptextfields(
                        controller: controller2,
                        focusNode: focusNode2,
                        nextFocusNode: focusNode3,
                        prevFocusNode: focusNode1,
                      ),
                      Otptextfields(
                        controller: controller3,
                        focusNode: focusNode3,
                        nextFocusNode: focusNode4,
                        prevFocusNode: focusNode2,
                      ),
                      Otptextfields(
                        controller: controller4,
                        focusNode: focusNode4,
                        prevFocusNode: focusNode3,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Container(
                      height: 60,
                      width: 350,
                      child: HorizontalButton(
                        onPressed: () {
                          Get.to(() => NewPassword());
                        },
                        text: 'Verify',
                      ),
                    ),
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
