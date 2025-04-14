import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vibemart/admin_view.dart';
import 'package:vibemart/core/widgets/toasts.dart';
import 'package:vibemart/features/auth/data/repository/auth_repo_impl.dart';
import 'package:vibemart/features/auth/domain/repository/auth_repo.dart';
import 'package:vibemart/features/splash/presentation/view/splash_view.dart';
import 'package:vibemart/user_view.dart';

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
      if (role == "User") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (ctx) => UserView()),
        );
      } else if (role == "Admin") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (ctx) => AdminView()),
        );
      }
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
