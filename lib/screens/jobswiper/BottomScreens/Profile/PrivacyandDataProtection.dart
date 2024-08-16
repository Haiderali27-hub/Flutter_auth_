import 'package:flutter/material.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/widgets/my_text.dart';

class Privacyanddataprotection extends StatelessWidget {
  const Privacyanddataprotection({super.key});

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
        title: MyText(
          text: 'Privacy & Data Protection',
          size: 25,
          weight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            MyText(text: 'Privacy Policy', size: 14),
            SizedBox(height: 5),
            Text(
              'At Jobyy, we are committed to protecting your privacy and ensuring the security of your personal information. Our privacy policy outlines how we collect, use, and safeguard your data. By using our app, you agree to the terms and practices described in this policy',
              style: TextStyle(color: GlobalColors.grey, fontSize: 11),
            ),
            SizedBox(height: 15),
            MyText(text: 'Data Collection', size: 14),
            SizedBox(height: 5),
            Text(
              'We collect and store information you provide when applying for jobs through our app. This may include your personal details, resume, cover letter, work history, and any additional information relevant to job applications.',
              style: TextStyle(color: GlobalColors.grey, fontSize: 11),
            ),
            SizedBox(height: 15),
            MyText(text: 'User Controls', size: 14),
            SizedBox(height: 5),
            Text(
              'You have the control to manage your data. You can edit or delete your profile information, including resumes and cover letters, at any time. You may also adjust your communication preferences in the app settings.',
              style: TextStyle(color: GlobalColors.grey, fontSize: 11),
            ),
            SizedBox(height: 15),
            MyText(text: 'Permissions', size: 14),
            SizedBox(height: 5),
            Text(
              'To ensure a seamless job application experience, our app may request access to certain device permissions, such as camera or location. These permissions are solely used to enhance your job search and application process. We do not use this information for any other purpose.',
              style: TextStyle(color: GlobalColors.grey, fontSize: 11),
            ),
            SizedBox(height: 15),
            MyText(text: 'Security Measures', size: 14),
            SizedBox(height: 5),
            Text(
              'Your data\'s security is a top priority. We implement industry-standard security measures to protect your information from unauthorized access, alteration, disclosure, or destruction.',
              style: TextStyle(color: GlobalColors.grey, fontSize: 11),
            ),
            SizedBox(height: 15),
            MyText(text: 'Contact Information', size: 14),
            SizedBox(height: 5),
            Text(
              'For any questions, concerns, or requests regarding your data or our privacy practices, please contact us at care@jobyy.com. Our support team is here to assist you and address any inquiries you may have.',
              style: TextStyle(color: GlobalColors.grey, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
