import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibemart/core/colors/colors.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool? isLoading;

  const CommonButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      height: 40.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          foregroundColor: kCardColor,
          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 3,
          shadowColor: kPrimaryColor.withAlpha(30),
        ),
        child:
            isLoading == true
                ? CircularProgressIndicator(color: kBackgroundColor)
                : Text(text),
      ),
    );
  }
}
