import 'package:test_mobile/core/core.dart';

class NetworkException {
  NetworkException(this.type, {this.message});
  final NetworkExceptionType type;
  final String? message;
  String get value => message ?? type.description;
}
