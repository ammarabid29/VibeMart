abstract class AuthRepo {
  Future<void> signupUser({
    required String name,
    required String email,
    required String password,
    required String role,
  });

  Future<String> loginUser({required String email, required String password});
}
