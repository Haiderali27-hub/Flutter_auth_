import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/widgets/my_text.dart';

import '../../../auth/login/login.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _SettingsState();
}

class _SettingsState extends State<Logout> {
  // Make the signUserOut function asynchronous
  void signUserOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    // Navigate to the login screen using GetX
    Get.offAll(() => LogIn(showRegisterPage: () {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: const Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: MyText(text: 'Logout', size: 25, weight: FontWeight.bold),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () => signUserOut(context), // Pass context to the function
              child: Container(
                color: Colors.lightGreen,
                width: 90,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(text: "Logout"),
                    SizedBox(width: 10),
                    Icon(Icons.logout),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
