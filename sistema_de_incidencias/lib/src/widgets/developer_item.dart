import 'dart:ui';

import 'package:flutter/material.dart';

class DeveloperItem extends StatelessWidget {
  DeveloperItem({
    super.key,
    required this.picture,
    required this.name,
    required this.description,
  });

  final String name;
  final String description;
  String picture = "assets/backgrounds/IMG-20230817-WA0073.jpg";
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 60),
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xFF02A9DA),
                Color(0xFF069BDF),
                Color(0xFF0F84D1),
                Color(0xFF186DDE),
              ],
            )),
            child: CircleAvatar(
              backgroundImage: AssetImage(picture),
            ),
          ),
        ],
      ),
    );
  }
}
