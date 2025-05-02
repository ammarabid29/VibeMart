import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vibemart/core/commons/common_dropdown.dart';
import 'package:vibemart/core/commons/custom_toasts.dart';
import 'package:vibemart/features/auth/presentation/view/login/login_view.dart';
import 'package:vibemart/features/auth/presentation/view/widgets/auth_navigation_text.dart';
import 'package:vibemart/core/commons/common_button.dart';
import 'package:vibemart/core/commons/common_text_field.dart';
import 'package:vibemart/features/auth/presentation/view_model/signup/signup_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String selectedRole = "User";

  bool isLoading = false;
  bool isPasswordHidden = true;
  final SignupViewModel _signupViewModel = SignupViewModel();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                CommonTextField(text: "Name", controller: _nameController),
                SizedBox(height: 15.h),
                CommonTextField(text: "Email", controller: _emailController),
                SizedBox(height: 15.h),
                CommonTextField(
                  text: "Password",
                  controller: _passwordController,
                  obscure: isPasswordHidden,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    },
                    icon: Icon(
                      isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                CommonDropdown(
                  label: "Role",
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
                CommonButton(
                  isLoading: isLoading,
                  text: "Signup",
                  onPressed: () async {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty ||
                        _nameController.text.isEmpty) {
                      showErrorToast("Enter the values");
                    } else {
                      setState(() {
                        isLoading = true;
                      });
                      await _signupViewModel.signUp(
                        context: context,
                        name: _nameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
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
