
import 'package:flutter/foundation.dart';
import 'package:todo_clean/domain/repositories/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthViewModel(this.authRepository);

  Future<void> signInAnonymously() async {
    try {
      await authRepository.signInAnonymously();
      // Handle any post-sign-in logic here, such as updating the UI state.
      notifyListeners();  // Notifies listeners (UI) that a change has occurred
    } catch (e) {
      print("Error in sign-in process: $e");
    }
  }
}
