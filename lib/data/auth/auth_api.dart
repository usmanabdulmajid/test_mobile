import 'package:test_mobile/core/core.dart';

abstract class AuthApi {
  Future<RResponse> login({required String username, required String password});
}
