import 'package:flutter/material.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/constant.dart/images.dart';
import 'package:project_1/widgets/horizontal_button.dart';

import 'package:project_1/widgets/my_text.dart';

class SubscriptionPlan extends StatelessWidget {
  const SubscriptionPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Container(
                  height: 60,
                  child: Image.asset(onboarding5),
                ),
                const SizedBox(height: 10),
                MyText(
                    text: 'Choose Subscription Plan',
                    size: 20,
                    weight: FontWeight.w700),
                const Text(
                  'Get the best service with our subscription plans\n tailored to make streaming fun and live.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 20),
                _buildPlanCard(
                  title: 'Basic Plan',
                  price: 'Free',
                  description: 'Perfect for starters',
                  features: ['You get', 'Explore Jobs', 'Job Listings Visible'],
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  isBasicPlan: true,
                ),
                const SizedBox(height: 15),
                _buildPlanCard(
                  title: 'Silver Plan',
                  price: '0.99€',
                  description: 'Perfect for Applying',
                  features: [
                    'You get',
                    'Listing Details Visible',
                    'No Additional features'
                  ],
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  textColor: Colors.black,
                ),
                const SizedBox(height: 15),
                _buildPlanCard(
                  title: 'Gold Plan',
                  price: '6.99€',
                  description: 'Perfect for Seekers',
                  features: [
                    'You get',
                    'Listing Details Visible',
                    'User can send message to Employer when applying'
                  ],
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  textColor: Colors.black,
                ),
                const SizedBox(height: 20),
                HorizontalButton(
                  onPressed: () {},
                  text: 'Start your 1 Month free trial',
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required String description,
    required List<String> features,
    required Color backgroundColor,
    required Color textColor,
    bool isBasicPlan = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blueAccent),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textColor)),
                SizedBox(height: 5),
                Text(price,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: textColor)),
                SizedBox(height: 5),
                Text(description,
                    style: TextStyle(
                        fontSize: 12, color: GlobalColors.primaryColor)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features.map((feature) {
                if (feature == 'You get') {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(feature,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: textColor)),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text('✔ $feature',
                        style: TextStyle(fontSize: 12, color: textColor)),
                  );
                }
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
