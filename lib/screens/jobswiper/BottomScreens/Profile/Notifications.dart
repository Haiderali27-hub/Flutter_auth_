import 'package:flutter/material.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/constant.dart/images.dart';
import 'package:project_1/widgets/my_text.dart';

class Notifications extends StatelessWidget {
  Notifications({super.key});

  final List notifications = [
    {
      'icon': Icons.calendar_today,
      'title': 'Employers Like your Profile',
      'time': 'Just now'
    },
    {
      'icon': Icons.calendar_today,
      'title': 'Employers Like your Profile',
      'time': 'Just now'
    },
    {
      'icon': Icons.calendar_today,
      'title': 'Your profile has been Viewed\n60 times',
      'time': 'Just now'
    },
  ];

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
        title: MyText(text: 'Notification', size: 25, weight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: 'New',
              size: 18,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(height: 50, child: Image.asset(NewIcon)),
                SizedBox(
                  width: 20,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'ITS A MATCH. ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Your appointment\nhas been completed',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: MyText(
                          text: 'Just now',
                          size: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: GlobalColors.primaryColor),
                    )
                  ],
                )
              ],
            ),
            Text('________________________________________________',
                style:
                    TextStyle(color: const Color.fromARGB(255, 238, 232, 232))),
            SizedBox(
              height: 30,
            ),
            MyText(
              text: 'Earlier',
              size: 18,
              weight: FontWeight.bold,
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color.fromARGB(255, 230, 229, 255),
                            ),
                            child: Icon(notification['icon'],
                                size: 20, color: GlobalColors.primaryColor),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 13),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: MyText(
                                        text: notification['title']!,
                                        size: 14,
                                        weight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: MyText(
                                      text: notification['time']!,
                                      size: 11,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                      width: 7,
                                      height: 7,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: GlobalColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
