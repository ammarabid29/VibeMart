import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

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
      await _fireStore.collection("users").doc(userCredentials.user!.uid).set({
        'name': name.trim(),
        'email': email.trim(),
        'role': role,
      });
    } on FirebaseAuthException catch (e) {
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
      // fetch user role
      DocumentSnapshot userDoc =
          await _fireStore
              .collection("users")
              .doc(userCredentials.user!.uid)
              .get();
      return userDoc['role'] as String;
    } on FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
