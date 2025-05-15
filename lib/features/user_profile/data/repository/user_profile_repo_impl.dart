import 'package:flutter/material.dart';

import 'package:vibemart/features/user_profile/data/data_source/user_profile_source.dart';
import 'package:vibemart/features/user_profile/domain/repository/user_profile_repo.dart';

class UserProfileRepoImpl implements UserProfileRepo {
  final UserProfileSource _userProfileSource = UserProfileSource();

  @override
  Future<void> logoutUser(BuildContext context) async {
    try {
      await _userProfileSource.logoutUser(context);
    } catch (_) {
      rethrow;
    }
  }
}
