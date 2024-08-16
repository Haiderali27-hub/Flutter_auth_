import 'package:flutter/material.dart';
import 'package:project_1/screens/Onboarding/introscreens/intro_screen1.dart';
import 'package:project_1/screens/Onboarding/introscreens/intro_screen2.dart';
import 'package:project_1/screens/Onboarding/introscreens/intro_screen3.dart';
import 'package:project_1/screens/Onboarding/introscreens/intro_screen4.dart';
import 'package:project_1/widgets/my_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController _controller = PageController();
  bool Second_Lpage = false;
  int currentIndex = 0;
  String dropdownValue = 'English'; // Default value for the dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.green,
            height: MediaQuery.sizeOf(context).height,
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
                setState(() {
                  Second_Lpage = (index == 2);
                });
              },
              children: [
                IntroScreen1(),
                IntroScreen2(),
                IntroScreen3(),
                IntroScreen4(),
              ],
            ),
          ),
          //dropdown code
          Container(
            // color: Colors.brown,
            alignment: Alignment(0, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (currentIndex != 3) ...[
                  Second_Lpage
                      ? Container(
                          width: 200,
                          height: 52,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: Padding(
                              padding: EdgeInsets.only(
                                left: 100,
                              ), // Adjust this value to increase the space
                              child: const Icon(Icons.arrow_drop_down,
                                  color: Colors.grey),
                            ),
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            underline:
                                Container(height: 0), // Removes underline
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>[
                              'English',
                              'Spanish',
                              'German',
                              'French'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )
                      //Text button
                      : TextButton(
                          onPressed: () {
                            _controller.jumpToPage(3); // Jumps to the last page
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: MyText(
                                text: 'Skip',
                                weight: FontWeight.bold,
                                size: 16,
                              )),
                        ),
                  currentIndex != 2
                      ? SizedBox(
                          width: 80.2, //space between buttons
                        )
                      : SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Container(
                      width: 50,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets
                              .zero, // Ensure there's no padding altering the icon's position
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.white,
                          size:
                              24, // Specify the icon size for consistent rendering
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          //image shadding
          currentIndex != 3
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100.0),
                    child: Container(
                      height: 250,
                      width: MediaQuery.sizeOf(context)
                          .width, // Height for the gradient and text container
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(1), // Opaque white
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(), //used for blank space
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
