import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_1/screens/auth/login/login.dart';
import 'package:project_1/widgets/BackAppBar.dart';
import 'package:project_1/widgets/CustomTextField.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Backappbar(),
        Padding(
          padding: const EdgeInsets.only(top: 130),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 70),
                child: MyText(
                  text: 'Create new Password',
                  size: 27,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Your new password must be unique from those    previously used.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: CustomTextfield(text: 'New Password'),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: CustomTextfield(text: 'Confirm Password'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      child: Text(
                        'Make sure to use a secure password: A secure password should         be at least 10 characters long, include numbers, symbols, upper and lowercase letters',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 35),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: HorizontalButton(
                      onPressed: () {
                        Get.to(() => LogIn(
                              showRegisterPage: () {},
                            ));
                      },
                      text: 'Reset Password'),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
