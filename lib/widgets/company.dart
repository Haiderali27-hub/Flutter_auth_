import 'package:flutter/material.dart';
import 'package:project_1/widgets/my_text.dart';

class Company extends StatelessWidget {
  final String companyName;
  final String location;

  const Company({
    Key? key,
    required this.companyName,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/facebook_logo.png', height: 80),
        const SizedBox(height: 10),
        MyText(
          text: companyName,
          size: 20,
          weight: FontWeight.bold,
        ),
        const SizedBox(height: 5),
        MyText(
          text: location,
          size: 16,
          weight: FontWeight.normal,
        ),
      ],
    );
  }
}
