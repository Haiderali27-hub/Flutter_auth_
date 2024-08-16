import 'package:flutter/material.dart';

class Backappbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const Backappbar({super.key, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context); // Navigate back when the arrow is pressed
        },
      ),
      title: Text(title,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700)), // Set the title here
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
