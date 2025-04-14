import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vibemart/features/auth/presentation/view/login/login_view.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text("Logout User"),
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
