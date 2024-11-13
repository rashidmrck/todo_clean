
import 'package:todo_clean/data/datasources/remote/auth_service.dart';
import 'package:todo_clean/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl(this.authService);

  @override
  Future<void> signInAnonymously() {
    return authService.signInAnonymously();
  }
}
