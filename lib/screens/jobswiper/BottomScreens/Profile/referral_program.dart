import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import for input formatters and clipboard
import 'package:project_1/widgets/BackAppBar.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';

class ReferralProgram extends StatefulWidget {
  const ReferralProgram({super.key});

  @override
  State<ReferralProgram> createState() => _ReferralProgramState();
}

class _ReferralProgramState extends State<ReferralProgram> {
  final TextEditingController referralLinkController = TextEditingController();

  void pasteFromClipboard() async {
    final clipboardData = await Clipboard.getData('text/plain');
    if (clipboardData != null) {
      referralLinkController.text = clipboardData.text ?? '';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Text pasted from clipboard!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Backappbar(
            title: 'Referral Program',
          ),
          SizedBox(
            height: 122,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color:
                    Color.fromARGB(255, 216, 210, 210), // Set the border color
                width: 2.0, // Set the border width
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                  16.0), // Add padding inside the container
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Minimize the column height
                children: [
                  MyText(
                    text: 'Referral ID',
                    size: 18,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 24.0,
                      letterSpacing:
                          40.0, // Adjust this value to control spacing
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(5),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyText(
                    text: 'Referral Link',
                    size: 18,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: referralLinkController,
                    decoration: InputDecoration(
                      hintText: 'xx//mp/asuajfgdgdfgsk.com',
                      suffixIcon: IconButton(
                        onPressed: pasteFromClipboard,
                        icon: Icon(Icons
                            .content_paste), // Use content_paste icon for paste functionality
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyText(
                    text: 'Add Link',
                    size: 18,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: 'The people you invited',
                        size: 17,
                        color: Colors.grey,
                      ),
                      MyText(
                        text: '10',
                        size: 17,
                        weight: FontWeight.bold,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: 'The people are joined',
                        size: 17,
                        color: Colors.grey,
                      ),
                      MyText(
                        text: '06',
                        size: 17,
                        weight: FontWeight.bold,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 42,
                  ),
                  Center(
                      child: Container(
                          width: 300,
                          child: HorizontalButton(
                            onPressed: () {},
                            text: 'Share',
                            icon: Icons.share,
                          )))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
