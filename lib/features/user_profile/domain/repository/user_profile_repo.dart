import 'package:flutter/cupertino.dart';

abstract class UserProfileRepo {
  Future<void> logoutUser(BuildContext context);
}
