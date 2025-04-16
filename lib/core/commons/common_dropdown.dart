import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibemart/core/colors/colors.dart';

class CommonDropdown extends StatelessWidget {
  final String label;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;
  final String? value;
  const CommonDropdown({
    super.key,
    required this.label,
    this.items,
    this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
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
      items: items,
      onChanged: onChanged,
    );
  }
}
