import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signupUser({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      // create user
      final UserCredential userCredentials = await _auth
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );
      // save additional info
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredentials.user!.uid)
          .set({'name': name.trim(), 'email': email.trim(), 'role': role});
    } on FirebaseAuthException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // login user
      final UserCredential userCredentials = await _auth
          .signInWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );

      // force token refresh to ensure firestore access is permitted
      await userCredentials.user!.getIdToken(true);

      // fetch user role
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance
              .collection("users")
              .doc(userCredentials.user!.uid)
              .get();
      if (!userDoc.exists) {
        throw Exception('User document does not exist');
      }
      return userDoc['role'] as String;
    } on FirebaseAuthException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
