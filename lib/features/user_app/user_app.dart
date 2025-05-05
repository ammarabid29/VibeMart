import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/features/user_app/user_home/presentation/view/user_home_view.dart';

class UserApp extends StatefulWidget {
  const UserApp({super.key});

  @override
  State<UserApp> createState() => _UserAppState();
}

class _UserAppState extends State<UserApp> {
  int selectedIndex = 0;
  final List pages = [
    const UserHomeView(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: kBackgroundColor,
        unselectedItemColor: kGrayMedium,
        selectedItemColor: kTextPrimary,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.search_normal),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.notification),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
        elevation: 0,
      ),
      body: pages[selectedIndex],
    );
  }
}
