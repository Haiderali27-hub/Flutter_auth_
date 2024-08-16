import 'package:flutter/material.dart';
import 'package:project_1/screens/auth/login/login.dart';
import 'package:project_1/screens/auth/register/register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toogleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LogIn(showRegisterPage: toogleScreens);
    } else {
      return Register(
        shoeLoginPage: toogleScreens,
      );
    }
  }
}
