import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibemart/core/colors/colors.dart';

class CommonTextField extends StatelessWidget {
  final String text;
  final bool? obscure;
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final void Function(String)? onSubmitted;
  const CommonTextField({
    super.key,
    required this.text,
    this.controller,
    this.obscure,
    this.suffixIcon,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure ?? false,
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: text,
        labelStyle: TextStyle(color: kPrimaryColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kGrayLight, width: 1.w),
        ),
        filled: true,
        fillColor: kCardColor, // white background
      ),
      cursorColor: kPrimaryColor,
      style: TextStyle(color: kTextPrimary),
    );
  }
}
