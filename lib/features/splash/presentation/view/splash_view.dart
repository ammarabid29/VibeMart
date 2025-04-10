import 'package:flutter/material.dart';
import 'package:vibemart/features/auth/presentation/view/login/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => LoginView()));
            },
            child: Hero(
              tag: "logo",
              child: Image.asset("assets/images/app_logo.png"),
            ),
          ),
        ),
      ),
    );
  }
}
