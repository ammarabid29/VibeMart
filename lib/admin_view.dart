import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'features/auth/presentation/view/login/login_view.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text("Logout Admin"),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(
              context,
            ).pushReplacement(MaterialPageRoute(builder: (_) => LoginView()));
          },
        ),
      ),
    );
  }
}
