import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:vibemart/features/auth/presentation/view/login/login_view.dart';

class UserProfileSource {
  Future<void> logoutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => LoginView()));
    } catch (_) {
      rethrow;
    }
  }
}
