import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  final String text;
  const CustomHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "See All",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 16,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }
}
