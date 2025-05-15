import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:vibemart/core/commons/common_widgets/custom_toasts.dart';
import 'package:vibemart/features/user_profile/data/repository/user_profile_repo_impl.dart';
import 'package:vibemart/features/user_profile/domain/repository/user_profile_repo.dart';

class UserProfileViewModel {
  final UserProfileRepo _userProfileRepo = UserProfileRepoImpl();

  Future<void> logoutUser(BuildContext context) async {
    try {
      await _userProfileRepo.logoutUser(context);
      showSuccessToast("Logout Successfully");
    } on FirebaseAuthException catch (e) {
      // Display Firebase-specific error message in a popup
      showErrorToast(e.message ?? 'Logout error occurred.');
    } catch (e) {
      // Display generic error message in a popup
      showErrorToast('An unexpected error occurred. Please try again.');
    }
  }
}
