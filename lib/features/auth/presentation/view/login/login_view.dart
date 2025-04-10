import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibemart/features/auth/presentation/view/signup/signup_view.dart';
import 'package:vibemart/features/auth/presentation/view/widgets/auth_navigation_text.dart';
import 'package:vibemart/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:vibemart/features/auth/presentation/view/widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Hero(
                  tag: "logo",
                  child: Image.asset("assets/images/app_logo.png"),
                ),
                SizedBox(height: 20.h),
                CustomTextField(text: "Email"),
                SizedBox(height: 15.h),
                CustomTextField(text: "Password"),
                SizedBox(height: 20.h),
                CustomButton(text: "Login", onPressed: () {}),
                SizedBox(height: 15.h),
                AuthNavigationText(
                  promptText: "Don't have an account? ",
                  actionText: "Signup here",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => SignupView()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
