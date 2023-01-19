import 'package:test_mobile/core/core.dart';
import 'package:test_mobile/data/auth/auth_api.dart';

class DummyAuth implements AuthApi {
  DummyAuth(this.http);
  final HttpService http;
  @override
  Future<RResponse> login(
      {required String username, required String password}) async {
    return await http.request(url: '/login', methodrequest: RequestMethod.post);
  }
}
