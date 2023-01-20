import 'package:test_mobile/core/models/user.dart';
import 'package:test_mobile/data/data.dart';
import 'package:test_mobile/domain/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.auth);
  final AuthApi auth;
  @override
  Future<User> login(
      {required String username, required String password}) async {
    late User user;
    try {
      final response = await auth.login(username: username, password: password);
      user = User.fromMap(response.result?.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
    return user;
  }
}
