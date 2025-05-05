import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:vibemart/core/commons/common_widgets/custom_toasts.dart';
import 'package:vibemart/features/auth/data/repository/auth_repo_impl.dart';
import 'package:vibemart/features/auth/domain/repository/auth_repo.dart';
import 'package:vibemart/features/auth/presentation/view/login/login_view.dart';

class SignupViewModel {
  final AuthRepo _authRepo = AuthRepoImpl();

  Future<void> signUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      await _authRepo.signupUser(
        name: name,
        email: email,
        password: password,
        role: role,
      );
      // Navigate to the login screen after successful sign-up
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => LoginView()),
      );
      showSuccessToast("Signup Successfully");
    } on FirebaseAuthException catch (e) {
      // Display Firebase-specific error message in a popup
      showErrorToast(e.message ?? 'Authentication error occurred.');
    } catch (e) {
      // Display generic error message in a popup
      showErrorToast('An unexpected error occurred. Please try again.');
    }
  }
}
