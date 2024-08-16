import 'package:flutter/material.dart';
import 'package:project_1/constant.dart/images.dart';
import 'package:project_1/widgets/BackAppBar.dart';
import 'package:project_1/widgets/common_image)viewer.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String _selectedPaymentMethod = 'Stripe'; // Default selected method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Backappbar(
              title: 'Payment',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 23.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  MyText(
                    text: 'Contact info',
                    size: 22,
                    weight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: 'Name',
                                size: 20,
                                weight: FontWeight.w700,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Your name',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: 'Surname',
                                size: 20,
                                weight: FontWeight.w700,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Your surname',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  MyText(
                    text: 'Payment methods',
                    size: 22,
                    weight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color.fromARGB(255, 197, 193, 193),
                      ),
                    ),
                    child: ListTile(
                      title: MyText(
                        text: 'Stripe(Default)',
                        weight: FontWeight.w700,
                      ),
                      leading: Radio<String>(
                        value: 'Stripe',
                        groupValue: _selectedPaymentMethod,
                        onChanged: (value) {
                          setState(() {
                            _selectedPaymentMethod = value!;
                          });
                        },
                      ),
                      trailing: CommonImageView(
                        imagePath: stripe,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color.fromARGB(255, 197, 193, 193),
                      ),
                    ),
                    child: ListTile(
                      title: MyText(
                        text: 'Apple Pay',
                        weight: FontWeight.w700,
                      ),
                      leading: Radio<String>(
                        value: 'Apple Pay',
                        groupValue: _selectedPaymentMethod,
                        onChanged: (value) {
                          setState(() {
                            _selectedPaymentMethod = value!;
                          });
                        },
                      ),
                      trailing: CommonImageView(
                        imagePath: applepay,
                      ), // Replace with your actual image URL
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color.fromARGB(255, 197, 193, 193),
                      ),
                    ),
                    child: ListTile(
                      title: MyText(
                        text: 'Credit Card',
                        weight: FontWeight.w700,
                      ),
                      leading: Radio<String>(
                        value: 'Credit Card',
                        groupValue: _selectedPaymentMethod,
                        onChanged: (value) {
                          setState(() {
                            _selectedPaymentMethod = value!;
                          });
                        },
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                          text: 'Your Saved Card',
                          style: TextStyle(color: Colors.black),
                          children: const <TextSpan>[
                            TextSpan(
                              text: '\n9065 0450 **** ****',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      trailing: TextButton(
                        child: Text('Change Card'),
                        onPressed: () {
                          // Implement your change card functionality
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color.fromARGB(255, 197, 193, 193),
                      ),
                    ),
                    child: ListTile(
                      title: MyText(
                        text: 'Twint (soon available)',
                        weight: FontWeight.w700,
                      ),
                      leading: Radio<String>(
                        value: 'Twint',
                        groupValue: _selectedPaymentMethod,
                        onChanged: (value) {
                          setState(() {
                            _selectedPaymentMethod = value!;
                          });
                        },
                      ),
                      trailing: CommonImageView(
                        imagePath: Twint,
                      ), // Replace with your actual image URL
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: MyText(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                color: Colors.grey,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: 'Total Price \n90.00FRS',
                      size: 18,
                      weight: FontWeight.bold,
                    ),
                    HorizontalButton(
                      onPressed: () {},
                      text: 'Pay',
                      width: MediaQuery.of(context).size.width *
                          0.3, // Dynamic width adjustment
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
