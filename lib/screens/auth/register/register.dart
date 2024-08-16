import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/constant.dart/images.dart';
import 'package:project_1/widgets/BackAppBar.dart';
import 'package:project_1/widgets/CustomTextField.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/loginicons.dart';
import 'package:project_1/widgets/my_text.dart';

class Register extends StatefulWidget {
  final VoidCallback shoeLoginPage;
  const Register({super.key, required this.shoeLoginPage});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future register() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    }
  }

  bool passwordConfirmed() {
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Backappbar(),
          Padding(
            padding: EdgeInsets.only(
              left: 32,
            ),
            child: MyText(
              text: 'Hello! Register to get started',
              size: 27,
              weight: FontWeight.w700,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                top: 25,
                left: 32,
                right: 32,
              ),

              //Input field
              child: Column(
                children: [
                  CustomTextfield(
                    text: 'Enter your Name',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Column(
                      children: [
                        CustomTextfield(
                          text: 'Enter your email',
                          controller: emailController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextfield(
                          text: 'Enter your password',
                          obscuretext: true,
                          controller: passwordController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextfield(
                          text: 'Confirm password',
                          obscuretext: true,
                          controller: confirmPasswordController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        HorizontalButton(
                          onPressed: register,
                          // {
                          //   Get.to(() => Name());
                          // },
                          text: 'Register',
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          //Or login with
          Padding(
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
              SizedBox(
                height: 17.53,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Loginicon(img: instagram, onTap: () {}),
                  SizedBox(width: 10), // Horizontal space between the icons
                  Loginicon(img: tictok, onTap: () {}),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(text: "Already have an account?"),
                  TextButton(
                      onPressed: widget.shoeLoginPage,
                      // {
                      //   Navigator.pop(context);
                      // },
                      child: MyText(
                        text: 'Login Now',
                        color: GlobalColors.lightBlue,
                      ))
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
