import 'package:vibemart/features/auth/data/data_source/auth_source.dart';
import 'package:vibemart/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthSource _authSource = AuthSource();

  @override
  Future<String> loginUser({required String email, required String password}) {
    try {
      return _authSource.loginUser(email: email, password: password);
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
      return _authSource.signupUser(
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
