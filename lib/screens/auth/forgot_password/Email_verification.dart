import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_1/widgets/BackAppBar.dart';
import 'package:project_1/widgets/CustomTextField.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future sendCode() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password reset link has been sent! \n check your email"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Backappbar(), // Place the Backappbar at the top of the Column
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 110),
                  child: MyText(
                    text: 'Forgot Password?',
                    size: 27,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Don\'t worry! It occurs. Please enter the email address linked with your account',
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: CustomTextfield(
                      text: 'Enter your email',
                      controller: emailController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: HorizontalButton(
                      onPressed: sendCode,
                      // {
                      //   Get.to(() => Otpverification());
                      // },
                      text: 'Send Code',
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
