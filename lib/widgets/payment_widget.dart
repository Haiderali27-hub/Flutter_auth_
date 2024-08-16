import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: PaymentMethodScreen()));
}

// PaymentMethod class
class PaymentMethod {
  final String title;
  final String subtitle;
  final String iconPath; // Path to the icon asset

  PaymentMethod(
      {required this.title, required this.subtitle, required this.iconPath});
}

// List of payment methods
List<PaymentMethod> methods = [
  PaymentMethod(
      title: 'Stripe (Default)',
      subtitle: 'stripe',
      iconPath: 'assets/stripe_logo.png'),
  PaymentMethod(
      title: 'Apple Pay', subtitle: 'Pay', iconPath: 'assets/apple_logo.png'),
  PaymentMethod(
      title: 'Credit Card', subtitle: 'Visa', iconPath: 'assets/visa_logo.png'),
  // Add more methods as needed
];

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int? _selectedMethod = 0; // Default to first method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Payment Method'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: methods.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(methods[index].iconPath, width: 40),
            title: Text(methods[index].title),
            subtitle: Text(methods[index].subtitle),
            trailing: Radio(
              value: index,
              groupValue: _selectedMethod,
              onChanged: (int? value) {
                setState(() {
                  _selectedMethod = value;
                });
              },
              activeColor: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
