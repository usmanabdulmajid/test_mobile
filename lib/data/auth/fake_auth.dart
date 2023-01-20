import 'package:dio/dio.dart';
import 'package:test_mobile/core/core.dart';
import 'package:test_mobile/data/auth/auth_api.dart';

///This is a class to simulate user login as a result of dummy api's login endpoint not responsing properly
class FakeAuth implements AuthApi {
  @override
  Future<RResponse> login(
      {required String username, required String password}) async {
    await Future.delayed(const Duration(seconds: 3));
    return RResponse(
      result: Response(
        requestOptions: RequestOptions(path: ''),
        data: User(
          id: 1,
          username: 'Tobi',
          email: 'obitouchiha@mail.com',
          firstname: 'Obito',
          lastname: 'Uchiha',
          gender: 'male',
          image: '',
          token: 'thjlelsmsl',
        ).toMap(),
      ),
    );
  }
}
