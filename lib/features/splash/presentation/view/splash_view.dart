import 'package:flutter/material.dart';
import 'package:vibemart/features/splash/presentation/view_model/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashViewModel _splashViewModel = SplashViewModel();

  @override
  void initState() {
    super.initState();
    _splashViewModel.navigationBasedOnRole(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Hero(
            tag: "logo",
            child: Image.asset("assets/images/app_logo.png"),
          ),
        ),
      ),
    );
  }
}
