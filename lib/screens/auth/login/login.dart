import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/constant.dart/images.dart';
import 'package:project_1/screens/auth/forgot_password/Email_verification.dart';
import 'package:project_1/widgets/CustomTextField.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/loginicons.dart';
import 'package:project_1/widgets/my_text.dart';

class LogIn extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LogIn({super.key, required this.showRegisterPage});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future logIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 32,
              ),
              //TExt
              child: MyText(
                text: 'Welcome back! Glad to see you, Again!',
                size: 27,
                weight: FontWeight.w700,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  top: 55,
                  left: 32,
                  right: 32,
                ),

                //Input field
                child: Column(
                  children: [
                    CustomTextfield(
                      text: 'Enter your email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 22.02,
                      ),
                      child: CustomTextfield(
                        text: 'Enter your password',
                        obscuretext: true,
                        controller: passwordController,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => const Forgotpassword());
                        },
                        child: MyText(
                          text: 'Forgot Password?',
                          weight: FontWeight.w700,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                )),
            HorizontalButton(
              onPressed: logIn,
              text: 'Login',
            ),
            //Or login with
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    "Or Login with",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 10,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Loginicon(img: facebook, onTap: () {}),
                    Loginicon(img: google, onTap: () {}),
                    Loginicon(img: apple, onTap: () {}),
                  ],
                ),
                const SizedBox(
                  height: 17.53,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Loginicon(img: instagram, onTap: () {}),
                    const SizedBox(
                        width: 10), // Horizontal space between the icons
                    Loginicon(img: tictok, onTap: () {}),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(text: "Don’t have an account?"),
                TextButton(
                    onPressed: widget.showRegisterPage,
                    // {
                    //   Get.to(() => const Register());
                    // },
                    child: MyText(
                        text: 'Register Now', color: GlobalColors.lightBlue))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
