
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;
      print("Signed in with UID: ${user?.uid}");
    } catch (e) {
      print("Error signing in anonymously: $e");
    }
  }
}
