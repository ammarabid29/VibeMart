import 'package:flutter/material.dart';

import 'package:vibemart/features/admin_panel/presentation/view/admin_panel_view/admin_panel_view.dart';
import 'package:vibemart/features/auth/presentation/view/login/login_view.dart';
import 'package:vibemart/features/splash/data/repository/splash_repo_impl.dart';
import 'package:vibemart/features/splash/domain/repository/splash_repo.dart';
import 'package:vibemart/features/user_app/user_app.dart';

class SplashViewModel {
  final SplashRepo _splashRepo = SplashRepoImpl();

  void navigationBasedOnRole(BuildContext context) async {
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
          MaterialPageRoute(builder: (_) => const UserApp()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginView()),
        );
      }
    }
  }
}
