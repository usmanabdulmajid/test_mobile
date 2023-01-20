import 'package:test_mobile/core/models/user.dart';
import 'package:test_mobile/data/data.dart';
import 'package:test_mobile/domain/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.auth);
  final AuthApi auth;
  @override
  Future<User> login(
      {required String username, required String password}) async {
    var user = User();
    try {
      final response = await auth.login(username: username, password: password);
      user = response.result?.data;
    } catch (e) {
      rethrow;
    }
    return user;
  }
}
