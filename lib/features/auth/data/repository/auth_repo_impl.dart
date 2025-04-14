import 'package:vibemart/features/auth/data/data_source/firebase_auth_service.dart';
import 'package:vibemart/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  @override
  Future<String> loginUser({required String email, required String password}) {
    try {
      return _firebaseAuthService.loginUser(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signupUser({
    required String name,
    required String email,
    required String password,
    required String role,
  }) {
    try {
      return _firebaseAuthService.signupUser(
        name: name,
        email: email,
        password: password,
        role: role,
      );
    } catch (e) {
      rethrow;
    }
  }
}
