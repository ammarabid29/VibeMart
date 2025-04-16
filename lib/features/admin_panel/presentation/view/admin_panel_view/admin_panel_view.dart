import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/core/commons/common_app_bar.dart';
import 'package:vibemart/features/admin_panel/presentation/view/add_item_view/add_item_view.dart';
import 'package:vibemart/features/auth/presentation/view/login/login_view.dart';

class AdminPanelView extends StatelessWidget {
  const AdminPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Admin Panel"),
      floatingActionButton: FloatingActionButton(
        foregroundColor: kCardColor,
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => AddItemView()));
        },
      ),
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
