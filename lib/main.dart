import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project_1/firebase/firebasemain.dart';
import 'package:project_1/screens/auth/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDY4s861oAowsHrEKoLBDteW8GMPIdn0yY",
          appId: "1:491251662107:android:06e6b17a73f333f73c27be",
          messagingSenderId: "491251662107",
          projectId: "findthejob-3a8fc"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      // Define the routes here
      routes: {
        '/login': (context) => LogIn(showRegisterPage: () {}),
        // Add other routes as needed
      },
    );
  }
}
