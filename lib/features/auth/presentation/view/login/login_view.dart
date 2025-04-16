import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibemart/core/commons/custom_toasts.dart';
import 'package:vibemart/features/auth/presentation/view/signup/signup_view.dart';
import 'package:vibemart/features/auth/presentation/view/widgets/auth_navigation_text.dart';
import 'package:vibemart/core/commons/common_button.dart';
import 'package:vibemart/core/commons/common_text_field.dart';
import 'package:vibemart/features/auth/presentation/view_model/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;
  bool isPasswordHidden = true;

  final LoginViewModel _loginViewModel = LoginViewModel();

  @override
  void dispose() {
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
                Hero(
                  tag: "logo",
                  child: Image.asset("assets/images/app_logo.png"),
                ),
                SizedBox(height: 20.h),
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
                SizedBox(height: 20.h),
                CommonButton(
                  isLoading: isLoading,
                  text: "Login",
                  onPressed: () async {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      showErrorToast("Enter the values");
                    } else {
                      setState(() {
                        isLoading = true;
                      });
                      await _loginViewModel.login(
                        context: context,
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
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
