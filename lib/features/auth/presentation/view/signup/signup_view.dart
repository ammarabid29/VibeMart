import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibemart/features/auth/presentation/view/widgets/auth_navigation_text.dart';
import 'package:vibemart/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:vibemart/features/auth/presentation/view/widgets/custom_text_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Image.asset("assets/images/app_logo.png", height: 200.h),
                SizedBox(height: 20.h),
                CustomTextField(text: "Email"),
                SizedBox(height: 15.h),
                CustomTextField(text: "Password"),
                SizedBox(height: 20.h),
                CustomButton(text: "Signup", onPressed: () {}),
                SizedBox(height: 15.h),
                AuthNavigationText(
                  promptText: "Already have an account? ",
                  actionText: "Login here",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
