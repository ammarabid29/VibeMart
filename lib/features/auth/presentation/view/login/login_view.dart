import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibemart/core/widgets/toasts.dart';
import 'package:vibemart/features/auth/presentation/view/signup/signup_view.dart';
import 'package:vibemart/features/auth/presentation/view/widgets/auth_navigation_text.dart';
import 'package:vibemart/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:vibemart/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:vibemart/features/auth/presentation/view_model/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isPasswordHidden = true;

  final LoginViewModel _loginViewModel = LoginViewModel();

  @override
  void dispose() {
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
                Hero(
                  tag: "logo",
                  child: Image.asset("assets/images/app_logo.png"),
                ),
                SizedBox(height: 20.h),
                CustomTextField(text: "Email", controller: emailController),
                SizedBox(height: 15.h),
                CustomTextField(
                  text: "Password",
                  controller: passwordController,
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
                CustomButton(
                  isLoading: isLoading,
                  text: "Login",
                  onPressed: () async {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      showErrorToast("Enter the values");
                    } else {
                      setState(() {
                        isLoading = true;
                      });
                      await _loginViewModel.login(
                        context: context,
                        email: emailController.text,
                        password: passwordController.text,
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
