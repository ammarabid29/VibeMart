import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vibemart/admin_view.dart';
import 'package:vibemart/features/auth/presentation/view/login/login_view.dart';
import 'package:vibemart/features/splash/data/repository/splash_repo_impl.dart';
import 'package:vibemart/features/splash/domain/repository/splash_repo.dart';
import 'package:vibemart/user_view.dart';

class SplashViewModel {
  final SplashRepo _splashRepo = SplashRepoImpl();

  void navigationBasedOnRole(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    final role = await _splashRepo.checkUserRole();

    if (context.mounted) {
      if (role == "Admin") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AdminView()),
        );
      } else if (role == "User") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const UserView()),
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
