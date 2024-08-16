import 'package:flutter/material.dart';

class Shadowcontainer extends StatelessWidget {
  const Shadowcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 60,
                            spreadRadius: 70,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    );
  }
}