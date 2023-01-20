import 'package:test_mobile/core/models/user.dart';

abstract class AuthRepository {
  Future<User> login({required String username, required String password});
}
