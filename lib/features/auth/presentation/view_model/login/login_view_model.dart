import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vibemart/core/widgets/toasts.dart';
import 'package:vibemart/features/auth/data/repository/auth_repo_impl.dart';
import 'package:vibemart/features/auth/domain/repository/auth_repo.dart';
import 'package:vibemart/features/splash/presentation/view/splash_view.dart';

class LoginViewModel {
  final AuthRepo _authRepo = AuthRepoImpl();

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final String role = await _authRepo.loginUser(
        email: email,
        password: password,
      );
      // Navigate to the login screen after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => SplashView()),
      );
      showSuccessToast("Login Successfully");
    } on FirebaseAuthException catch (e) {
      // Display Firebase-specific error message in a popup
      showErrorToast(e.message ?? 'Authentication error occurred.');
    } catch (e) {
      // Display generic error message in a popup
      showErrorToast('An unexpected error occurred. Please try again.');
    }
  }
}
