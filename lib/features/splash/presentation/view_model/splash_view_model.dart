import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vibemart/core/commons/common_widgets/custom_toasts.dart';

import 'package:vibemart/features/admin_panel/presentation/view/admin_panel_view/admin_panel_view.dart';
import 'package:vibemart/features/auth/presentation/view/login/login_view.dart';
import 'package:vibemart/features/splash/data/repository/splash_repo_impl.dart';
import 'package:vibemart/features/splash/domain/repository/splash_repo.dart';
import 'package:vibemart/features/user_dashboard/user_dashboard.dart';

class SplashViewModel {
  final SplashRepo _splashRepo = SplashRepoImpl();

  void navigationBasedOnRole(BuildContext context) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final role = await _splashRepo.checkUserRole();

      if (context.mounted) {
        if (role == "Admin") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const AdminPanelView()),
          );
        } else if (role == "User") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const UserDashboard()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginView()),
          );
        }
      }
    } on FirebaseException catch (e) {
      // Display Firebase-specific error message in a popup
      showErrorToast(e.message ?? 'Login error occurred.');
    } catch (e) {
      // Display generic error message in a popup
      showErrorToast('Error in splash.');
    }
  }
}
