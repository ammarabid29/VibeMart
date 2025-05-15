import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<String?> checkUserRole() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc =
            await _fireStore.collection("users").doc(user.uid).get();
        return userDoc['role'] as String;
      }
      return null;
    } catch (_) {
      rethrow;
    }
  }
}
