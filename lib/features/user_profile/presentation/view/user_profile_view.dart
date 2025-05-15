import 'package:flutter/material.dart';

import 'package:vibemart/features/user_profile/presentation/view_model/user_profile_view_model.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProfileViewModel _userProfileViewModel = UserProfileViewModel();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logout button
            ElevatedButton(
              onPressed: () {
                _userProfileViewModel.logoutUser(context);
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
