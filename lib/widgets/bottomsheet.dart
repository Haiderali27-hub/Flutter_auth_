import 'package:flutter/material.dart';
import 'package:project_1/constant.dart/global_colors.dart';
import 'package:project_1/widgets/horizontal_button.dart';
import 'package:project_1/widgets/my_text.dart';

class Bottomsheet extends StatefulWidget {
  const Bottomsheet({super.key});

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  RangeValues _currentRangeValues = const RangeValues(0, 10);
  String _selectedQualification = 'Bachelors';
  int _selectedTime = 40;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Text(
                  'Filter',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Reset action
                  },
                  child: Text(
                    'Reset',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            MyText(
              text: 'Distance',
              size: 16,
              weight: FontWeight.w600,
            ),
            RangeSlider(
              values: _currentRangeValues,
              min: 0,
              max: 10,
              divisions: 10,
              activeColor: GlobalColors.primaryColor,
              inactiveColor: Colors.grey,
              labels: RangeLabels(
                '${_currentRangeValues.start.round()} km',
                '${_currentRangeValues.end.round()} km',
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${_currentRangeValues.start.round()} km'),
                  Text('${_currentRangeValues.end.round()} km'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: 'Qualifications',
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  Container(
                    width: screenWidth * 0.9,
                    height: 52,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedQualification,
                      icon: Padding(
                        padding: EdgeInsets.only(
                            left:
                                200), // Adjust this value to increase the space
                        child: const Icon(Icons.expand_more,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(height: 0), // Removes underline
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedQualification = newValue!;
                        });
                      },
                      items: <String>['Bachelors', 'Masters', 'PhD']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyText(
                    text: 'Time',
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  MyText(
                    text:
                        'The approximate distance from your current location to the job location.',
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 8.0, // Horizontal spacing between buttons
                    runSpacing:
                        4.0, // Vertical spacing between lines of buttons
                    children: [
                      _timeButton(10),
                      _timeButton(20),
                      _timeButton(30),
                      _timeButton(40),
                      _timeButton(50),
                      _timeButton(60),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                      child: HorizontalButton(
                          onPressed: () {}, text: 'Apply Filter'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _timeButton(int time) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedTime = time;
        });
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: _selectedTime == time ? Colors.white : Colors.black,
        backgroundColor: _selectedTime == time ? Colors.blue : Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text('$time min'),
    );
  }
}
