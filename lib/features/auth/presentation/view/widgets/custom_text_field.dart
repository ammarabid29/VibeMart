import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibemart/core/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(color: kPrimaryColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 2.0.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kGrayLight, width: 1.5.w),
        ),
        filled: true,
        fillColor: kCardColor, // white background
      ),
      cursorColor: kPrimaryColor,
      style: TextStyle(color: kTextPrimary),
    );
  }
}
