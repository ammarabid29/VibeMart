import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/core/widgets/toasts.dart';
import 'package:vibemart/features/auth/presentation/view/login/login_view.dart';
import 'package:vibemart/features/auth/presentation/view/widgets/auth_navigation_text.dart';
import 'package:vibemart/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:vibemart/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:vibemart/features/auth/presentation/view_model/signup/signup_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String selectedRole = "User";
  bool isLoading = false;

  final SignupViewModel _signupViewModel = SignupViewModel();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                CustomTextField(text: "Name", controller: nameController),
                SizedBox(height: 15.h),
                CustomTextField(text: "Email", controller: emailController),
                SizedBox(height: 15.h),
                CustomTextField(
                  text: "Password",
                  controller: passwordController,
                  obscure: true,
                ),
                SizedBox(height: 15.h),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: "Role",
                    labelStyle: TextStyle(color: kPrimaryColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 2.0.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kGrayLight, width: 1.5.w),
                    ),
                    filled: true,
                    fillColor: kCardColor, // white background
                  ),
                  items:
                      ["Admin", "User"].map((role) {
                        return DropdownMenuItem(value: role, child: Text(role));
                      }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      if (newValue != null) {
                        selectedRole = newValue;
                      }
                    });
                  },
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  isLoading: isLoading,
                  text: "Signup",
                  onPressed: () async {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        nameController.text.isEmpty) {
                      showErrorToast("Enter the values");
                    } else {
                      setState(() {
                        isLoading = true;
                      });
                      await _signupViewModel.signUp(
                        context: context,
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        role: selectedRole,
                      );
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
                SizedBox(height: 15.h),
                AuthNavigationText(
                  promptText: "Already have an account? ",
                  actionText: "Login here",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (ctx) => LoginView()),
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
