import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibemart/core/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final bool? obscure;
  final TextEditingController controller;
  final IconButton? suffixIcon;
  const CustomTextField({
    super.key,
    required this.text,
    required this.controller,
    this.obscure,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure ?? false,
      controller: controller,

      decoration: InputDecoration(
        suffixIcon: suffixIcon,
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
