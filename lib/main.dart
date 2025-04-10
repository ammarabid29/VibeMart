import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vibemart/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const VibeMart());
}

class VibeMart extends StatelessWidget {
  const VibeMart({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Text("data"),
    );
  }
}
