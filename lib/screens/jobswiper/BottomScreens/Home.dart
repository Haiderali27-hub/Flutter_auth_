import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project_1/constant.dart/images.dart';
import 'package:project_1/screens/jobswiper/BottomScreens/company_disription.dart';
import 'package:project_1/screens/jobswiper/BottomScreens/model_job.dart';
import 'package:project_1/widgets/jobslider_appbar.dart';

// Main Widget Class
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

// State Class
class _HomeState extends State<Home> {
  int myindex = 0;

  final List<Job> jobs = [
    Job(
        company: 'Facebook',
        location: 'California, USA',
        position: 'UI Designer',
        description: 'Can you bring creative human-centered ideas to life...',
        image: facebook2),
    Job(
      company: 'Google',
      location: 'Mountain View, USA',
      position: 'Product Manager',
      description: 'We are looking for a product manager with experience in...',
      image: google,
    ),
    Job(
      company: 'Apple',
      location: 'Calgary, Canada',
      position: 'UI Designer',
      description:
          'As a UI Designer at Apple, you ll be at the forefront of designing user interfaces that are not only functional but also aesthetically stunning. Youll collaborate with a team of world-class designers, engineers, and product managers to create engaging, user-centric designs that set the standard for excellence in technology and design.',
      image: apple,
    ),
    Job(
      company: 'MicroSoft Outlook',
      location: 'Texas, USA',
      position: 'UX design',
      description:
          'As a UI Designer at Microsoft Outlook, youll play a crucial role in shaping the user experience of one of the worlds leading email and calendar applications. Your designs will enhance productivity and streamline communication for millions of users. Collaborate with a talented team of designers, developers, and product managers to create intuitive and visually appealing interfaces',
      image: MSoutlook,
    ),
    Job(
      company: 'Guide',
      location: 'Islamabad, Pakistan',
      position: 'Archetectural Design',
      description:
          'As an Architectural Designer at Guide, you will play a key role in developing and executing architectural designs for a range of projects, from commercial buildings to residential developments. You will work closely with senior architects and project managers to deliver design solutions that are both creative and functional, meeting client needs and exceeding industry standards.',
      image: stripe,
    ),
    // Add more jobs here
  ];

  final cardSwiperController =
      CardSwiperController(); // Controller to control swipes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: CardSwiper(
          cardsCount: jobs.length,
          cardBuilder: (context, index, realIndex, anotherIndex) {
            final job = jobs[index];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                height: 550, // Fixed height for each card
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.to(CompanyDisription());
                        },
                        child: Image.asset(job.image, height: 60)),

                    // Company Name
                    Text(
                      job.company,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Job Position
                    Text(
                      job.position,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Job Location
                    Text(
                      job.location,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 16),

                    // Job Description
                    Text(
                      job.description,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    // Add some space before the buttons
                    Spacer(),
                    // Like and Dislike Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                cardSwiperController.swipe(CardSwiperDirection
                                    .left); // Swipe left for Dislike
                              },
                              icon: Icon(Icons.close, color: Colors.white),
                              label: Text(
                                'Dislike',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 15),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10), // Space between buttons
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                cardSwiperController
                                    .swipe(CardSwiperDirection.right);
                                // Swipe right for Like
                              },
                              icon: Icon(Icons.favorite, color: Colors.white),
                              label: Text(
                                'Like',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
