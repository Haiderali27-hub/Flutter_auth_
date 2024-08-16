import 'package:flutter/material.dart';

class Dropboxes extends StatefulWidget {
  const Dropboxes({super.key});

  @override
  _DropboxesState createState() => _DropboxesState();
}

class _DropboxesState extends State<Dropboxes> {
  List<String> languages = [''];
  String? selectedLanguage; // Default language selection (can be null)

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white, // Set the background color to white
        child: Center(
          child: Container(
            width: 300, // Adjust the width as needed
            height: 50, // Adjust the height as needed
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 223, 227, 230), // Border color
                width: 2, // Border width
              ),
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedLanguage, // Use null if nothing is selected
                onChanged: (String? value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
                items: languages.map((language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(language),
                  );
                }).toList(),
                icon: Icon(
                  Icons.keyboard_arrow_down, // iOS-style downward arrow icon
                  color: Colors.black, // Icon color
                ),
                hint: null, // Remove hint text
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Dropboxes(),
  ));
}
